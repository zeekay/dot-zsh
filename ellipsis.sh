#!/usr/bin/env bash

mod.install() {
    ellipsis.run_installer "https://raw.githubusercontent.com/zeekay/zeesh/master/scripts/install.sh"
}

mod.pull() {
    git.pull ~/.zsh
}

mod.push() {
    git.push ~/.zsh
}

mod.status() {
    git.status ~/.zsh
}
