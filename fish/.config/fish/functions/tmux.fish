set default_sessions (cat ~/.tmuxsessions)

function createSessions
    for folder in $argv

        # Expand tilde (~) in the path
        set expanded_path (eval echo $folder)

        # Get the name of the folder without the path
        set session_name (basename $folder)

        # Check if a tmux session with that name already exists
        if tmux has-session -t $session_name 2>/dev/null
            echo "Session $session_name already exists"
        else
            # Create a new tmux session with the name and starting directory of the folder
            echo (string join "" "starting session: " $session_name)

            tmux new-session -d -s $session_name -c $expanded_path


            tmux send-keys -t $session_name "tmux new-window -n git" Enter
            tmux send-keys -t $session_name "tmux new-window -n nvim" Enter
            tmux send-keys -t $session_name "tmux new-window -n server" Enter
            tmux send-keys -t $session_name "tmux new-window -n scratch" Enter
            sleep 0.3

            tmux send-keys -t $session_name:1 gitui Enter
            tmux send-keys -t $session_name:2 nvim Enter
            tmux send-keys -t $session_name:3 "echo server" Enter
            tmux send-keys -t $session_name:4 "ls -a" Enter
            tmux send-keys -t $session_name:0 "tmux kill-window -t $session_name:0" Enter
        end
    end
    tmux new-session
end

function initGit
    if git rev-parse --is-inside-work-tree >/dev/null 2>&1
        gitui
    else
        echo "not git repo"
    end
end


function startSessions
    createSessions $default_sessions
end


function stopSessions
    for session_id in (tmux list-sessions -F "#{session_id}")
        tmux kill-session -t $session_id
    end
end
