. ~/.config/fish/functions/sessions.fish

function createSessions
    for folder in $argv
        # Get the name of the folder without the path
        set session_name (basename $folder)

        # Check if a tmux session with that name already exists
        if tmux has-session -t $session_name 2>/dev/null
            echo "Session $session_name already exists"
        else
            # Create a new tmux session with the name and starting directory of the folder
            tmux new-session -d -s $session_name -c $folder
        end
    end
end

function startSessions
	createSessions $default_sessions
end
