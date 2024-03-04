#!/usr/bin/env sh

function run {
    if ! pgrep $1 ; then
        $@&
    fi
}

run "compton"
run "nitrogen --restore"
