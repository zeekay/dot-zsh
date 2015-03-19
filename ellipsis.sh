#!/usr/bin/env bash
#
# zeekay/zsh
#
# My zeesh-based zsh configuration.

pkg.link() {
    fs.link_files common

    case $(os.platform) in
        osx)
            fs.link_files platform/osx
            ;;
        freebsd)
            fs.link_files platform/freebsd
            ;;
        linux)
            fs.link_files platform/linux
            ;;
        cygwin)
            fs.link_files platform/cygwin
            ;;
    esac
}

pkg.install() {
    # Backup existing ~/.zsh
    fs.backup ~/.zsh

    # clone zeesh and dependencies
    git.clone https://github.com/zeekay/zeesh \
        ~/.zsh
    git.clone https://github.com/zsh-users/zsh-syntax-highlighting \
        ~/.zsh/plugins/syntax-highlighting/lib
    git.clone https://github.com/zsh-users/zsh-history-substring-search \
        ~/.zsh/plugins/history-substring-search/lib

    # Set theme to vi-statusline, or vi-statusline-legacy based on zsh version.
    if [ "$(zsh --version | grep 'zsh 5')" ]; then
        echo vi-statusline > ~/.zsh/local/theme.last
    else
        echo vi-statusline-legacy > ~/.zsh/local/theme.last
    fi
}

helper() {
    # run command for ourselves
    $1

    # run command on zeesh
    cd ~/.zsh; $1 zeesh

    # run command for each plugin dep
    if [ -e ~/.zsh/plugins/git/lib ]; then
        cd ~/.zsh/plugins/git/lib; $1 zsh/hub
    fi
    cd ~/.zsh/plugins/vi-mode/lib; $1 zsh/vimpager
    cd ~/.zsh/plugins/syntax-highlighting/lib; $1 zsh/zsh-syntax-highlighting
    cd ~/.zsh/plugins/history-substring-search/lib; $1 zsh/zsh-history-substring-search
}

pkg.pull() {
    helper git.pull
}

pkg.status() {
    helper hooks.status
}

pkg.push() {
    # run command for ourselves
    git.push

    # run command on zeesh
    cd ~/.zsh; git.push zeesh

    # run command for each plugin dep we have push permissions
    if [ -e ~/.zsh/plugins/git/lib ]; then
        cd ~/.zsh/plugins/git/lib; git.push hub
    fi
    cd ~/.zsh/plugins/vi-mode/lib; git.push vimpager
}
