#! /bin/sh
#youtubeDLSS by KuhakuNeko
#exit, DLdir, EXansaa, link, name, FLname, PLAnsaa, AULI

exit = 0

echo "Please enter the download directory..."
read DLdir
cd $DLdir
echo "Would you like to extract the mp3 from the video? type yes/no"
read EXansaa

echo "REMEMBER IF YOU DONT GIVE A LINK YOUTUBEDLSS WILL DOWNLOAD THE MOST POPULAR YOUTUBE RESULT FOR YOU"

while [ exit != 1 ]
do

	echo "You have a link or youll perform automatic search? type either 'auto' or 'link'"
	read AULI
	
		if [ $AULI = "auto" ]
		then
			echo "Enter the name of the song or video you would like to get"
			read name
			
			ytp
			x
			$name
			a
			y
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
			Youtube-dl –x –audio-format mp3 –o “$FLname.%(ext)s” $link
		else
			Youtube-dl –o “$FLname.%(ext)s” $link
		fi
	
	echo "DOWNLAOD DIRECTORY VIDEOS/MUSIC"
	ls | sort
	
	echo "would you like to play all the contents in the file or the song you downloaded? all/this/none"
	read PLAnsaa
	
		if [ $PLAnsaa = "all" ]
		then
			play $DLDir
		elif [ $PLAnsaa = "this" ]
		then
			play $DLDir/$FLname
		else
			echo "ok, though its good to listen to music..."
		fi
		
	echo "So would you like to exit or continue downloading? enter '0' for continue and '1' to exit"
	read EXansaa
	
done

echo "Thanks for using YoutubeDLSS by KuhakuNeko"