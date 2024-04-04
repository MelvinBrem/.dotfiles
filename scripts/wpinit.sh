wpinit () {
    plugins=(
        'https://downloads.wordpress.org/plugin/disable-emails.latest-stable.zip'
        '/Users/melvinbrem/Plugins/wp-migrate-db-pro-2.6.12.zip'
    )

    for plugin in $plugins; do
        echo "Installing ${plugin}...";
        wp --skip-themes --skip-plugins plugin install $plugin --activate
    done;
}