#!/usr/bin/env zsh

source ${funcsourcetrace[1]%/*}/inc/lwpVariables.sh
source ${funcsourcetrace[1]%/*}/inc/lwpDeleteSite.sh
source ${funcsourcetrace[1]%/*}/inc/lwpCreateSite.sh
source ${funcsourcetrace[1]%/*}/inc/lwpInstallPlugins.sh

function lwp() {
    local func="$1"
    local param1="$2"

    case "${func}" in
    "delete-site")
        lwp_delete_site $param1
        ;;
    "create-site")
        lwp_create_site $param1
        ;;
    "install-plugins")
        lwp_install_plugins
        ;;
    "create-user")
        wp user delete melvinbrem@socialbrothers.nl --network
        wp user create ${LWP_DEFAULT_USERNAME} ${LWP_DEFAULT_EMAIL} --user_pass="${LWP_DEFAULT_PASSWORD}" --role="administrator" --skip-email
        wp super-admin add admin
        ;;
    "init")
        lwp install-plugins
        lwp create-user
        ;;
    "help" | *)
        echo "======================================"
        echo "LWP - Local WordPress"
        echo "======================================"
        echo "Get fucked"
        echo ""
        ;;
    esac
}
