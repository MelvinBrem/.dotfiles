#!/usr/bin/env zsh

lfcd () {
    cd "$(command lf -print-last-dir "$@")"
}