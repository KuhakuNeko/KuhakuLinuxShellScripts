#! /bin/sh
#KillFasterTMUX by KuhakuNeko
#This is guaranteed to KILL tmux 100% even when it bugs, and it used to listthe killed sessions too...
echo "The Following sessions will be killed in the next seconds, and theres NOTHING you can do about it."
echo""
ps aux | grep tmux
echo""
tmux list-sessions
sleep 4
tmux list-sessions | awk 'BEGIN{FS=":"}{print $1}' | xargs -n 1 tmux kill-session -t
tmux kill-server
pkill -f tmux