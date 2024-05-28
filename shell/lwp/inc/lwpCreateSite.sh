#!/usr/bin/env zsh

function lwp_create_site() {
    site_multisite=''
    site_name=''

    # Catch issues
    if [ ! -d "${LWP_PATH_SITES}" ]; then
        throw_error "Something is wrong with the \"${LWP_PATH_SITES}\" directory"
        return
    fi

    # Handle paramaters
    if [ -n "$1" ]; then
        site_name=$1
    else
        printf "Site name: "
        read site_name
    fi

    if [[ "${site_name}" =~ [^a-z-] ]]; then
        throw_error "Invalid site name"
        return
    fi

    # If dir already exists
    if [ -d "${LWP_PATH_SITES}/${site_name}" ]; then
        throw_error "The directory ${site_name} already exists"
        return
    fi

    # Check if database already exists
    site_name_formatted="${site_name//-/@002d}"

    if [ -d "/usr/local/var/mysql/${LWP_DB_PREFIX}${site_name_formatted}" ]; then
        throw_error "Database for ${site_name} already exists"
        return
    fi

    read "answer?Is this a multisite? [y/n]: "
    if [[ "$answer" == "y" ]]; then
        site_multisite=true
    elif [[ "$answer" == "n" ]]; then
        site_multisite=false
    else
        echo "Invalid input. Please enter 'y' or 'n'."
        return
    fi

    # ======================================================================================
    # Create Wordpress install
    # ======================================================================================

    printf "Creating site directory...\n"
    cd "${LWP_PATH_SITES}"
    mkdir -p "${site_name}"
    cd "${site_name}"

    printf "Downloading and installing Wordpress...\n"

    wp_version=${2:-"latest"}

    wp core download --version="${wp_version}"

    # ======================================================================================
    # Create database
    # ======================================================================================

    printf "Creating database...\n"
    mysqladmin -uroot create "${LWP_DB_PREFIX}${site_name}"

    # ======================================================================================
    # Config Wordpress
    # ======================================================================================

    printf "Configuring Wordpress...\n"
    wp config create --dbname="${LWP_DB_PREFIX}${site_name}" --dbuser="root"
    wp core install --url="http://$site_name.test/" --title="${site_name}" --admin_name="${LWP_DEFAULT_USERNAME}" --admin_password="${LWP_DEFAULT_PASSWORD}" --admin_email="${LWP_DEFAULT_EMAIL}" --skip-email

    # ======================================================================================
    # Plugins
    # ======================================================================================

    printf "Uninstalling garbage...\n"
    wp plugin uninstall --all

    while true; do
        throw_warning "Install plugins? [y/n]: "
        read yn
        case $yn in
        [Yy]*) lwp_install_plugins && return false ;;
        [Nn]*) return false ;;
        *) ;;
        esac
    done

    throw_tip "Done"
}
