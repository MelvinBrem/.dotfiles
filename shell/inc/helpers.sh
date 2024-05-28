#!/usr/bin/env zsh

function throw_error() {
    local text=$1

    printf "${GLOBAL_COLOR_RED}"
    printf "$text\n"
    printf "${GLOBAL_COLOR_DEFAULT_TEXT}"
}

function throw_warning() {
    local text=$1

    printf "${GLOBAL_COLOR_ORANGE}"
    printf "$text\n"
    printf "${GLOBAL_COLOR_DEFAULT_TEXT}"
}

function throw_tip() {
    local text=$1

    printf "${GLOBAL_COLOR_BLUE}"
    printf "$text\n"
    printf "${GLOBAL_COLOR_DEFAULT_TEXT}"
}

function has_subdirectory() {
    local dir="$1"

    if [[ -z "$dir" ]]; then
        return 1
    fi

    for item in "$dir"*; do
        if [[ -d "$item" ]]; then
            return 0
        fi
    done

    return 1
}
