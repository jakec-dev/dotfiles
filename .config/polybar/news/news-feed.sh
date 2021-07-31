#!/bin/sh
# modified from https://github.com/nivit/polybar-module-news

# default values

show_site="no"  # display the name of the news source
use_colors="yes"  # for error/warning

length=70  # number of characters for the output. 0 = no limit
add_ellipsis="yes"  # used only when length > 0

error_bg_color="#282a36"
error_fg_color="#ff5555"
warning_bg_color="#282a36"
warning_fg_color="#ffb86c"

python_cmd=python3

module_dir=${SCRIPTS_HOME}/polybar/news
module_obj_dir=${XDG_CACHE_HOME}/polybar-news

feed_file=${module_obj_dir}/news.items
feeds=${XDG_CONFIG_HOME}/newsboat/urls
rss_lock=${module_obj_dir}/news.lock
rss_py=${module_dir}/download_rss_feeds.py
rss_url=${module_obj_dir}/news.url

print_msg() {
    if [ "X${use_colors}X" = "XyesX" ]; then
        if [ "${1}" = "warning" ]; then
            bg_color="${warning_bg_color}"
            fg_color="${warning_fg_color}"
        else
            bg_color="${error_bg_color}"
            fg_color="${error_fg_color}"
        fi
        printf "%s" "%{B${bg_color} F${fg_color}} -- ${2} -- %{B- F-}"
    else
        printf "%s" "${2}"
    fi

    if [ "${1}" = "error" ]; then
        exit 0  # actually ignore the error...
    fi
}

download_rss() {
    if [ ! -f "${feeds}" ]; then
        print_msg error "no feeds file found!"
    fi

    if [ ! -d "${module_obj_dir}" ]; then
        mkdir -p "${module_obj_dir}"
    fi

    if command -v "$python_cmd" > /dev/null 2>&1; then
        if ! ${python_cmd} -c 'import feedparser' > /dev/null 2>&1; then
            print_msg error "install python module feedparser, please!"
        fi
    else
        print_msg error "install/configure a python 3 interpreter, please!"
    fi

    print_msg warning "Downloading RSS/Atom feeds"

    (
        touch "${rss_lock}"
        ${python_cmd} "${rss_py}" "${feeds}" "${feed_file}"
        rm -f "${rss_lock}"
    )

    exit 0
}

main() {
    if [ -s "${feed_file}" ]; then
        if [ -z "$1" ] && [ ! -f "${rss_lock}" ]; then
            if [ "X${show_site}X" = "XyesX" ]; then
                site=$(sed -n -e '1p' "${feed_file}")": "
            else
                site=""
            fi

            title=$(sed -n -e '2p' "${feed_file}")
            output="${site}${title}"

            if [ "${length}" -gt 0 ] && [ "${length}" -lt "${#output}" ]; then
                if [ "X${add_ellipsis}X" = "XyesX" ] ; then
                    ellipsis="..."
                    length="$((length - 3))"
                else
                    ellipsis=""
                fi
                output="$(printf "%s" "${output}" | cut -c -"${length}")"
                output="${output% *}${ellipsis}"
            fi

            url=$(sed -n -e '3p' "${feed_file}")

            printf "%s" "${url}" > "${rss_url}"
            sed -i.bak -e '1,3d' "${feed_file}"
            printf "%s" "${output}"

            exit 0
        elif [ "$1" = "url" ]; then
            xdg-open "$(cat "${rss_url}")"&
            exit 0
        elif [ "$1" = "download" ] && [ ! -f "${rss_lock}" ]; then
            download_rss
            exit 0
        else
            print_msg warning "Downloading RSS/Atom feeds"
        fi
    else
        download_rss
    fi
}


main "${1}"

# vim: expandtab shiftwidth=4 smartindent softtabstop=4 tabstop=4

