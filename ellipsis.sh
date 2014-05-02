#!/usr/bin/env bash
#
# zeekay/zsh
#
# My zeesh-based zsh configuration.

pkg.install() {
    # backup existing files
    fs.backup ~/.zsh

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

    # set theme to bogart
    echo bogart > ~/.zsh/local/theme.last
}

helper() {
    # run command for ourselves
    $1

    # run command on zeesh
    cd ~/.zsh; $1 zeesh

    # run command for each plugin dep
    cd ~/.zsh/plugins/git/lib; $1 hub
    cd ~/.zsh/plugins/vi-mode/lib; $1 vimpager
    cd ~/.zsh/plugins/syntax-highlighting/lib; $1 zsh-syntax-highlighting
    cd ~/.zsh/plugins/history-substring-search/lib; $1 zsh-history-substring-search
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
    cd ~/.zsh/plugins/git/lib; git.push hub
    cd ~/.zsh/plugins/vi-mode/lib; git.push vimpager
}
