#!/bin/zsh

function lwp_delete_site() {

    cd "${LWP_PATH_SITES}"

    printf "Choose a site to uninstall:\n"
    select del_site_name in */; do
        if [ -n "${del_site_name}" ]; then
            break
        else
            throw_error "Invalid Selection"
        fi
    done
    del_site_name=${del_site_name//\//}

    while true; do
        throw_warning "Are you sure? [y/n]: "
        read yn
        case $yn in
        [Yy]*) break ;;
        [Nn]*) return false ;;
        *) ;;
        esac
    done

    while true; do
        throw_error "Are you really sure? [y/n]:"
        read yn
        case $yn in
        [Yy]*) break ;;
        [Nn]*) return false ;;
        *) ;;
        esac
    done

    printf "Deleting Wordpress...\n"
    rm -fr "${LWP_PATH_SITES}/${del_site_name}"

    printf "Deleting database...\n"
    mysqladmin -uroot -f drop "${LWP_DB_PREFIX}${del_site_name}"

    printf "${del_site_name} deleted\n"
}
