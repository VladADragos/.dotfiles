
if status is-interactive

    # Commands to run in interactive sessions can go here
    eval (keychain --eval .ssh/id_ed25519)
    . ~/.config/fish/path.fish
    . ~/.config/fish/functions/functions.fish

    alias nvim="NVIM_APPNAME=nvim_conf/starter /home/vlad/.local/share/bob/nvim-bin/nvim"
    /home/vlad/.cargo/bin/rtx activate fish | source
end
