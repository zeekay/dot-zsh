#!/usr/bin/env bash
#
# zeekay/dot-zsh
# My zeesh-based zsh configuration.

pkg.install() {
    # backup existing files
    ellipsis.backup ~/.zsh

    # clone zeesh and dependencies
    git.clone https://github.com/zeekay/zeesh \
        ~/.zsh
    git.clone https://github.com/zeekay/vimpager \
        ~/.zsh/plugins/vi-mode/lib
    git.clone https://github.com/zeekay/hub \
        ~/.zsh/plugins/git/lib
    git.clone https://github.com/zsh-users/zsh-syntax-highlighting \
        ~/.zsh/plugins/syntax-highlighting/lib
    git.clone https://github.com/zsh-users/zsh-history-substring-search \
        ~/.zsh/plugins/history-substring-search/lib

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

    # set theme to bogart
    echo bogart > ~/.zsh/local/theme.last
}

helper() {
    # run command for ourselves
    $1

    # run command on zeesh
    cd ~/.zsh
    $1

    # run command for each addon
    for lib in $HOME/.zsh/plugins/*/lib; do
        cd $lib
        $1
    done
}

pkg.pull() {
    helper git.pull
}

pkg.push() {
    helper git.push
}

pkg.status() {
    helper git.status
}
