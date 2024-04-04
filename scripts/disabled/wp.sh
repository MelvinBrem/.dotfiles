#!/usr/bin/env zsh
# A nasty little thing to create local wp installs, please dont use, not very proud of this

COLOR_DEFAULT_TEXT="\033[0;39m"
COLOR_RED="\033[0;91m"
COLOR_WARNING="\033[0;93m"
COLOR_BLUE="\033[0;96m"

GLOBAL_SITES_DIR=~/wordpress-local/sites
GLOBAL_AUTO_PLUGIN_DIR=~/wordpress-local/auto-plugins

GLOBAL_DEFAULT_USERNAME="admin"
GLOBAL_DEFAULT_PASSWORD="root"
GLOBAL_DEFAULT_EMAIL="melvinbrem@socialbrothers.nl"

function throw_error() {
    printf "${COLOR_RED}Error:\n$1\n${COLOR_DEFAULT_TEXT}"
}

function throw_warning() {
    printf "${COLOR_WARNING}Warning:\n$1\n${COLOR_DEFAULT_TEXT}"
}

function throw_warning(){
    printf "${COLOR _WARNING}"
    printf "Warning:\n"
    printf "$1\n"
    printf "${COLOR_DEFAULT_TEXT}"
}

function wpinstall() {
        # Catch issues
        if [ ! -d "${GLOBAL_SITES_DIR}" ]; then
            throw_error "Something is wrong with the \"${GLOBAL_SITES_DIR}\" directory"
            return
        fi

        # Handle paramaters
        if [ -n "$1" ]; then
            NEW_SITE_NAME=$1
        else
            printf "Enter a site name: "
            read NEW_SITE_NAME
        fi

        if [[ "${NEW_SITE_NAME}" =~ [^a-z-] ]]; then
            throw_error "Invalid site name"
            return
        fi

        # If dir already exists
        if [ -d "${GLOBAL_SITES_DIR}/${NEW_SITE_NAME}" ]; then
            throw_error "The directory ${NEW_SITE_NAME} already exists"
            return
        fi

        # Check if database already exists
        NEW_SITE_NAME_FORMATTED="${NEW_SITE_NAME//-/@002d}"

        if [ -d "/usr/local/var/mysql/${NEW_SITE_NAME_FORMATTED}" ]; then
            throw_error "Database for ${NEW_SITE_NAME} already exists"
            return
        fi
        
        # ======================================================================================
        # Create Wordpress install
        # ======================================================================================

        printf "Creating site dir...\n"
        cd "${GLOBAL_SITES_DIR}"
        mkdir "${NEW_SITE_NAME}"
        cd "${NEW_SITE_NAME}"

        printf "Downloading and installing Wordpress...\n"

        WP_VERSION=${2:-"latest"}

        wp core download --version="${WP_VERSION}"
        
        # ======================================================================================
        # Create database
        # ======================================================================================
        
        printf "Creating database...\n"
        mysqladmin -uroot create "${NEW_SITE_NAME}"

        # ======================================================================================
        # Config Wordpress
        # ======================================================================================
        
        printf "Configuring Wordpress...\n"
        wp config create --dbname="${NEW_SITE_NAME}" --dbuser="root"
        wp core install --url="http://localhost:8080/$NEW_SITE_NAME/" --title="${NEW_SITE_NAME}" --admin_name="${GLOBAL_DEFAULT_USERNAME}" --admin_password="${GLOBAL_DEFAULT_PASSWORD}" --admin_email="${GLOBAL_DEFAULT_EMAIL}"


        # ======================================================================================
        # Plugins
        # ======================================================================================

        printf "Uninstalling bloatware...\n"
        wp plugin uninstall --all

        printf "Installing plugins from ${GLOBAL_AUTO_PLUGIN_DIR}...\n"
        for FILE in "${GLOBAL_AUTO_PLUGIN_DIR}"/*; do
            printf "    - Installing "${FILE##*/}"...\n"
            wp plugin install "${FILE}";
        done

        wphost
}

function wpuninstall() {

        cd "${GLOBAL_SITES_DIR}"
        printf "Choose a site to uninstall:\n"
        select DEL_SITE_NAME in */; do
            if [ -n "${DEL_SITE_NAME}" ]; then
                break
            else
                printf "${COLOR_WARNING}Invalid Selection${COLOR_DEFAULT_TEXT}\n"
            fi
        done
        DEL_SITE_NAME=${DEL_SITE_NAME//\//}

        while true; do
            printf "Are you sure? [y/n]: "
            read yn
            case $yn in
                [Yy]* ) break;;
                [Nn]* ) return false;;
                * ) ;;
            esac
        done

        while true; do
            printf "${COLOR_WARNING}Are you really sure? [y/n]: ${color_text_default}"
            read yn
            case $yn in
                [Yy]* ) break;;
                [Nn]* ) return false;;
                * ) ;;
            esac
        done

        printf "Deleting Wordpress...\n"
        rm -fr "${GLOBAL_SITES_DIR}/${DEL_SITE_NAME}"

        printf "Deleting database...\n"
        mysqladmin -uroot -f drop "${DEL_SITE_NAME}"

        printf "${DEL_SITE_NAME} deleted\n"
}

function wphost() {

        printf %"$COLUMNS"s |tr " " "="
        printf "Starting sites at: ${COLOR_BLUE}http://localhost:8080/index.php${COLOR_DEFAULT_TEXT}\n"
        printf %"$COLUMNS"s |tr " " "="

        cd "${GLOBAL_SITES_DIR}" && php -S localhost:8080 &
        sleep 1 # Wait for the server to start
        open -g "http://localhost:8080/index.php?new_site=${NEW_SITE_NAME:-none}"
}