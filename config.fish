set fish_greeting ""
set PATH . $PATH

alias vi=vim
alias python=python3
alias gdb="gdb -quiet"
alias ls="ls --color=auto"
alias grep="grep --color --exclude=tags"

stty -ixon      # disable Ctrl-S and Ctrl-Q

alias prlint="eslint --quiet --reset -c ~/.eslintrc (git --no-pager diff --name-only -M100% --diff-filter=AM --relative FETCH_HEAD | grep '\.js\$')"

function fish_prompt --description 'Write out the prompt'
    echo -n -s (set_color $fish_color_cwd) (prompt_pwd) (set_color normal) '> '
end

function todo
    vim (git config --get todo.path)
end

function gd
    git diff
end

function gdo
    git diff origin/master
end

function gst
    git status
end

function gco
    git add -A
    and git commit -m "$argv[1]"
end

function vm
    switch (count $argv)
        case 0
            set name dev
            set username admin
        case 1
            set name $argv[1]
            set username admin
        case 2
            set name $argv[1]
            set username $argv[2]
    end
    if not VBoxManage list runningvms | cut -d '"' -f 2 | grep -q "$name"
        VBoxManage startvm --type headless "$name"
        echo "Waiting for SSH connection..."
    end
    set port (VBoxManage showvminfo "$name" --machinereadable | \
                 grep '^Forwarding(.*,22"' | cut -d, -f4)
    ssh -p $port -o ConnectionAttempts=60 $username@localhost
end

# map Ctrl-D to "clear"
function fish_user_key_bindings
    bind \cd echo\ -n\ \(clear\ \|\ string\ replace\ \\e\\\[3J\ \"\"\)\;\ commandline\ -f\ repaint
end
