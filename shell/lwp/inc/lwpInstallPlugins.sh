#!/bin/zsh

function lwp_install_plugins() {
    plugins=(
        'https://downloads.wordpress.org/plugin/disable-emails.latest-stable.zip'
        'https://downloads.wordpress.org/plugin/pexlechris-adminer-stable.zip'
        '/Users/melvinbrem/Desktop/Plugins/wp-migrate-db-pro-2.6.12.zip'
    )

    for plugin in $plugins; do
        echo "Installing ${plugin}..."
        wp --skip-themes --skip-plugins plugin install $plugin --activate
    done

    wp migratedb setting update license c1574813-220e-498a-86ea-0c73f3e6655d --user=1
}
