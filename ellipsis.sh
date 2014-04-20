#!/usr/bin/env bash
#
# ellipsis-zsh
#   ellipsis.sh module that install a zeesh-based zsh configuration.

mod.install() {
    # backup existing files
    ellipsis.backup ~/.zsh

    # clone zeesh
    git.clone "https://github.com/zeekay/zeesh" ~/.zsh

    # symlink files
    ellipsis.link_files "$mod_path/common"

    case "$(ellipsis.platform)" in
        darwin)
            ellipsis.link_files "$mod_path/platform/osx"
            ;;
        freebsd)
            ellipsis.link_files "$mod_path/platform/freebsd"
            ;;
        linux)
            ellipsis.link_files "$mod_path/platform/linux"
            ;;
        cygwin*)
            ellipsis.link_files "$mod_path/platform/cygwin"
            ;;
    esac
}

mod.pull() {
    git.pull $mod_path
    git.pull ~/.zsh
}

mod.push() {
    git.pull $mod_path
    git.push ~/.zsh
}

mod.status() {
    git.pull $mod_path
    git.status ~/.zsh
}
