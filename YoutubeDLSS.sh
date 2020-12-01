#! /bin/sh
#youtubeDLSS by KuhakuNeko
#exit, DLdir, EXansaa, link, name, FLname, PLAnsaa, AULI, PlayLoop

exit=0

echo "Please enter the download directory..."
read DLdir
cd $DLdir

echo ""
echo "REMEMBER IF YOU DONT GIVE A LINK YOUTUBEDLSS WILL REDIRECT YOU TO THE YTP SEARCH ENGINE TO COPY A LINK"
echo ""

while [ $exit != 1 ]
do

	echo "You have a link or youll perform a ytp search? type either 'search' or 'link'"
	read AULI
	
		if [ $AULI = "search" ]
		then
			echo "Enter the name of the song or video you would like to get (Dont use spaces words will get lost)"
			read name
			
			ytp $name

			echo "Press Ctrl+Shift+V to paste the url"
			read link
		else
			echo "Enter the link"
			read link
		fi
		
	echo "Enter the name of the final downloaded file"
	read FLname
	echo "Extract the audio? yes/no"
	read EXansaa
	
		if [ $EXansaa = "yes" ]
		then
			youtube-dl -x --audio-format mp3 -o "$FLname.%(ext)s" $link
			echo""
		fi

		if [ $EXansaa = "no" ]
		then
			youtube-dl -o "$FLname.%(ext)s" $link
			echo""
		fi

	echo "DOWNLAOD DIRECTORY VIDEOS/MUSIC"
	ls | sort
	echo""

	PlayLoop=0
	while [ $PlayLoop != 1 ]
	do
		echo "Would you like to play all the contents in the file or the song you downloaded? all/this/none"
		echo "Now you can also play songs and manage your playlist with VLC by typing "vlc".  //BETA VERSION WARNING"
		read PLAnsaa
		
			if [ $PLAnsaa = "all" ]
			then
				mpv $DLdir
				echo""
			elif [ $PLAnsaa = "this" ]
			then
				play $FLname.mp3
				echo""
			elif [ $PLAnsaa = "vlc" ]
			then
				nvlc $DLdir
				echo""
			else
				echo "ok, though its good to listen to music..."
				echo ""
			fi

			echo "Exit the player menu? "0" to continue and "1" to exit"
			read PlayLoop
	done

	echo "So would you like to exit or continue downloading? enter '0' to continue and '1' to exit"
	read exit
	
done
echo "------------------------------------------"
echo "Thanks for using YoutubeDLSS by KuhakuNeko"
echo "------------------------------------------"
