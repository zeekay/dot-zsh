#!/usr/bin/env bash
#
# zeekay/dot-zsh
# My zeesh-based zsh configuration.

pkg.install() {
    # backup existing files
    ellipsis.backup $HOME/.zsh

    # clone zeesh
    git.clone git://github.com/zeekay/zeesh.git $HOME/.zsh

    # symlink files
    ellipsis.link_files "$PKG_PATH/common"

    case "$(utils.platform)" in
        darwin)
            ellipsis.link_files "$PKG_PATH/platform/osx"
            ;;
        freebsd)
            ellipsis.link_files "$PKG_PATH/platform/freebsd"
            ;;
        linux)
            ellipsis.link_files "$PKG_PATH/platform/linux"
            ;;
        cygwin*)
            ellipsis.link_files "$PKG_PATH/platform/cygwin"
            ;;
    esac
}

pkg.pull() {
    git.pull $PKG_PATH
    cd $HOME/.zsh
    git.pull $HOME/.zsh
}

pkg.push() {
    git.push $PKG_PATH
    cd $HOME/.zsh
    git.push $HOME/.zsh
}

pkg.status() {
    git.status $PKG_PATH
    cd $HOME/.zsh
    git.status $HOME/.zsh
}
