#!/usr/bin/env zsh

lwp () {
    local func="$1"

    case "${func}" in
        "install-plugins")
            plugins=(
                'https://downloads.wordpress.org/plugin/disable-emails.latest-stable.zip'
                '/Users/melvinbrem/Desktop/Plugins/wp-migrate-db-pro-2.6.12.zip'
            )

           for plugin in $plugins; do
                echo "Installing ${plugin}...";
                wp --skip-themes --skip-plugins plugin install $plugin --activate
            done;
        ;;
        "create-user")
            wp user delete melvinbrem@socialbrothers.nl --network
            wp user create localadmin melvinbrem@socialbrothers.nl --user_pass="root" --role="administrator"
            wp super-admin add localadmin
        ;;
        "init")
            lwp install-plugins
            wp migratedb setting update license c1574813-220e-498a-86ea-0c73f3e6655d --user=1
            lwp create-user
        ;;
        "help"|*)
            echo "======================================"
            echo "LWP - Local WordPress"
            echo "======================================"
            echo "No help 4 u sorry :)"
            echo ""
        ;;
    esac
}