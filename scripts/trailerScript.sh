#!/bin/bash
apiKey="AIzaSyDUhmowpXZRml-X2vpMpNdZ3VoXPBVs9yo"
cd /media/usb0/Films
allFilms=$(ls)





for directory in $allFilms
do
	cd $directory
	cmd=$(find . -name '*.nfo' | wc -l)
	#echo $directory
	#echo $cmd
	if [ $cmd = 1 ]
	then
		id=$(grep -oP '(?<=videoid=).*?(?=</trailer>)' < $directory'.nfo')
		link="https://www.youtube.com/watch?v=$id"
		#echo $link
		# '! -z' pour vérifier si la variable id contient bien qqch
		if [ ! -z $id ]
		then
			echo "ba de: "$directory" --> "$link
		        youtube-dl -f mp4 -o "ba.mp4" $link
			ffmpeg -y -i "ba.mp4" -c copy "$directory-trailer.mkv" >> /root/scripts/ffmpeg.log
		        rm "ba.mp4"
		fi
	fi
	#echo "ba de: "$directory" --> "$link
	#youtube-dl -f mp4 -o "ba.mp4" $link
	#ffmpeg -y -i "ba.mp4" -c copy "$directory.trailer.mkv" >> /root/scripts/ffmpeg.log
	#rm "ba.mp4"
	cd ..
done

