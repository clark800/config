function vm {
    local name=${1:-dev}
    local username=${2:-admin}
    if ! VBoxManage list runningvms | cut -d '"' -f 2 | grep -q "$name"; then
        VBoxManage startvm --type headless "$name"
        echo "Waiting for SSH connection..."
    fi
    local port=$(VBoxManage showvminfo "$name" --machinereadable |
                 grep '^Forwarding(.*,22"' | cut -d, -f4)
    ssh -p $port -o ConnectionAttempts=60 $username@localhost
}

function title {
    echo -n -e "\033]0;$1\007"
}

function notify {
  message="${1:-Process complete}"
  options='title "Terminal" sound name "Ping"'
  script="display notification \"$message\" with $options"
  /usr/bin/osascript -e "$script"
}

alias python=python3
