if status is-interactive
end

if test -f ~/.cache/wal/colors.sh
    for line in (bash -c 'source ~/.cache/wal/colors.sh && env')
        set -l kv (string split -m 1 "=" -- $line)
        if test (count $kv) -eq 2
            # Bỏ qua biến rỗng hoặc biến không hợp lệ
            if string match -qr '^[a-zA-Z_][a-zA-Z0-9_]*$' -- $kv[1]
                # Bỏ qua biến read-only như "_"
                if not contains -- $kv[1] _ SHLVL PWD OLDPWD
                    set -gx $kv[1] $kv[2]
                end
            end
        end
    end
end


set -x LS_COLORS "di=1;44:ln=1;36:ex=1;32:*.js=1;33"
alias ls="ls --color=auto"

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
