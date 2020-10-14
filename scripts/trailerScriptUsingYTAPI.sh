#!/bin/bash
apiKey="AIzaSyDUhmowpXZRml-X2vpMpNdZ3VoXPBVs9yo"
cd /media/usb0/Films
allFilms=$(ls)


convertedToArray=($allFilms)
#echo ${convertedToArray[0]}
#json=$(curl "https://www.googleapis.com/youtube/v3/search?key=$apiKey&part=snippet&maxResults=1&q=${convertedToArray[0]}")
#echo $json
#id=$(jq --raw-output '.items[0].id.videoId' <<< "$json")
#echo "id of video: "$id
#cd ${convertedToArray[0]}
#link="https://www.youtube.com/watch?v=$id"
#youtube-dl -f mp4 -o "ba.mp4" $link
#ffmpeg -y -i "ba.mp4" -c copy "${convertedToArray[0]}-ba.mkv"
#rm "ba.mp4"

#echo "taille: "${#convertedToArray[@]}
#echo "first element: "${convertedToArray[0]}


if [ -f "/root/scripts/trailerDownloadErr.log" ]
then
	#start where it ends last time
	#get last line of file so it can starts to download from that video
	lastVideo=$(tail -1 /root/scripts/trailerDownloadErr.log)
	#echo $lastVideo
	for i in "${!convertedToArray[@]}"
	do
		if [[ "${convertedToArray[$i]}" = "$lastVideo" ]]
		then
			#echo $i;
			allFilms=("${convertedToArray[@]:$i}")
		fi
	done
        rm /root/scripts/trailerDownloadErr.log
fi
#printf '%s\n' "${allFilms[@]}"
#echo "taille: "${#allFilms[@]}
#echo "first element: "${allFilms[0]}


for directory in $allFilms
do
	#echo $directory
	json=$(curl "https://www.googleapis.com/youtube/v3/search?key=$apiKey&part=snippet&maxResults=1&q=$directory.bande.annonce")
	echo $json
	error403=$(jq --raw-output '.error.code' <<< "$json")
	if [ $error403="403" ]
	then
		echo "stop due to 403"
		echo "download stopped due to exceeded downloads, first video to download -> "$directory >> /root/scripts/trailerDownloadErr.log
		echo $directory >> /root/scripts/trailerDownloadErr.log
		#stop the download
		exit 1
	fi
	id=$(jq --raw-output '.items[0].id.videoId' <<< "$json") 
	link="https://www.youtube.com/watch?v=$id" 
	echo "ba de: "$directory" --> "$link
	cd $directory
	youtube-dl -f mp4 -o "ba.mp4" $link
	ffmpeg -y -i "ba.mp4" -c copy "$directory.trailer.mkv" >> /root/scripts/ffmpeg.log
	rm "ba.mp4"
	cd ..
done

