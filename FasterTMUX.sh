#! /bin/sh
#FasterTMUX by KuhakuNeko

echo "Welcome to FasterTMUX by KuhakuNeko please select your optimized mode:"
echo "1. Window and clock"
echo "2. Explorer, window and clock"
echo "3. Too many empty windows"
read mode

tmux FasterTMUX
tmux new-session -d -s FasterTMUX
	
if [ $mode = "1" ]
then
	tmux clock
	tmux split-window -t FasterTMUX:0
elif [ $mode = "2" ]
then
	tmux clock
	tmux split-window -t FasterTMUX:0
	tmux split-window -t FasterTMUX:0
else
	tmux split-window -t FasterTMUX:0
	tmux split-window -t FasterTMUX:0
	tmux split-window -t FasterTMUX:0
	tmux split-window -t FasterTMUX:0
fi

tmux select-layout -t FasterTMUX:0 tiled
tmux attach -tFasterTMUX