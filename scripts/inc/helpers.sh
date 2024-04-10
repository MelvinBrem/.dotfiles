#!/usr/bin/env zsh

function throw_error() {
    printf "${GLOBAL_COLOR_RED}"
    printf "$1\n"
    printf "${COLOR_DEFAULT_TEXT}"
}

function throw_warning(){
    printf "${GLOBAL_COLOR_ORANGE}"
    printf "$1\n"
    printf "${COLOR_DEFAULT_TEXT}"
}

function throw_tip(){
    printf "${GLOBAL_COLOR_BLUE}"
    printf "$1\n"
    printf "${COLOR_DEFAULT_TEXT}"
}