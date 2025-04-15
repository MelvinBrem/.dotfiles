#!/bin/zsh

function lwp_install_plugins() {
    # Do better plox
    plugins=(
        'https://downloads.wordpress.org/plugin/disable-emails.latest-stable.zip'
        '/Users/melvinbrem/Desktop/Plugins/wp-migrate-db-pro-2.7.0.zip'
    )

    for plugin in $plugins; do
        echo "Installing ${plugin}..."
        wp --skip-themes --skip-plugins plugin install $plugin --activate
    done

    wp migratedb setting update license ${LWP_LICENSE_MWP} --user=1
}
