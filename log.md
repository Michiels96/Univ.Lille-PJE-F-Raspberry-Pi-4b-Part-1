# Cours 1 (14.09.2020)
1. Mise en place du raspberry pi 4b

   J'ai pour ma part suivi ce tutoriel pour mettre en place le raspberry pi: www.okdo.com/getstarted
     1. 1 Déballage raspberry pi 4b
     1. 2 Collage des heatsinks sur le raspberry
     1. 3 Insertion du raspberry dans son boitier
     1. 4 Insertion de la carte micro sd dans le raspberry

___
2. Installation de l'OS xBian sur la carte SD du raspberry

   Le site web https://xbian.org/getxbian/ où j'ai téléchargé l'image d'xBian.
   J'ai du aller chercher sur internet un logiciel permettant de flasher l'image téléchargée sur ma carte micro SD, 
   j'ai utilisé raspberry pi imager.
    2. 1 Téléchargement de l'OS xbian depuis le site https://xbian.org/getxbian/ (version Raspberry Pi 4B).
    2. 2 Flash de l'image xbian sur la carte micro sd avec raspberry pi imager (commande 'dd' pour le faire manuellement sans soft. sur un sys. unix).
    2. 3 Branchement du cable hdmi dans le port 'hdmi 0' du raspberry et démarrage de celui-ci.
    2. 4 Boot d'xBian/Kodi 18.8
    2. 5 Exécution des commandes 'apt-get update' et 'apt-get upgrade' pour mettre à jour les paquets.
    2. 6 Changement du mdp du compte root pour plus de droits avec la commande 'sudo passwd root' 
        (l'utilisateur xBian fait partie du groupe sudo donc j'ai le droit)

___
3. Connexion du pc hôte au raspberry avec un cable ethernet via le protocole SSH

    J'ai, dans un premier temps, su me connecter en SSH à mon raspberry via Wifi par le biais dun réseau local de mon smartphone en suivant le guide
    de ce site (https://docs.dataplicity.com/docs/get-pi-connected-to-the-internet).
    3.1 J'ai installé par la suite le service SSH sur mon raspberry avec la commande 'sudo apt-get install ssh'
    3.2 et la commande 'sudo service ssh restart' pour démarrer/redémarrer le service
    La partie suivante décrit comme se connecter depuis un terminal d'un systeme unix au raspberry via le protocole SSH
    3.3 Dans le terminal distant, taper la commande 'ssh xbian@addrIpDuRaspberry' ("xbian" etant le nom de l'utilisateur)

    Après avoir réussi à me connecter via le protocole SSh en Wifi, j'ai tenté de le faire via Ethernet.
    3.4 Je suis allé dans le menu paramètres>xBian>System de la GUI Kodi
    3.5 Changé l''interface to configure' sur 'eth0' pour séléctionner la carte réseau ethernet
    3.6 'Type' sur 'Static'
    3.7 hardcodé 'IP Adress' avec la valeur '192.168.5.71'
    3.8 quitter le menu en sauvant les changements.

    Dès lors, il est possible de se connecter depuis une machine unix qui a une carte réseau qui est directement connectée via un cable ethernet 
    au raspberry via la commande 'ssh xbian@192.168.5.71'.
    Attention! L'addresse IP de la machine hote doit avoir une adresse IP qui fasse partie du même réseau que le raspberry.
    Il faut alors changer le fichier interfaces du dossier /etc/network/ de la machine hote pour configurer cela.
    Comme je n'ai pas les droits pour changer ce fichier quand je suis sur une machine de l'université 
    et que par la suite cela m'aurait ammené façe à d'autres problème de droits, j'ai depuis ce moment là
    utilisé mon PC portable windows pour me connecter en SSH à mon raspberry via le logiciel putty.
    J'ai donc configuré les paramètres de ma carte eth0 de mon windows pour me connecter via mon cable ethernet à mon raspberry.
    Adresse IP de mon windows= 192.168.5.70.

    3.9 Création d'une clé privée/publique SSH pour se connecter en tant que root sur mon raspberry.
    3.9.1 Commande 'ssh-keygen -t rsa -b 4096' pour préciser de créer une clé suivant l'algo RSA avec une taille de 4096.
    3.9.2 Les 2 fichiers qui viennent d'être crées doivent aller dans des répertoires différents.
            le fichier avec l'extension '.pub' doit être renommé en 'authorized_keys' et être placé dans /root/.ssh/
            L'autre fichier est la clé privée qui elle doit être utilisé pour se connecter à distance depuis ma machine windows via putty
            Pour le transfert du fichier, j'utilise le soft. WinSCP avec lequel je me connecte via le compte xBian 
            dont je connais le mot de passe 'raspberry'. 
            Dès lors je copie la clé privée pour le mettre dans un répertoire de mon PC Windows.
            Dès maintenant je peux me reconnecter à mon raspberry en tant que root via Putty ou WinSCP en précisant la clé privée.
    

4. Enlever le bouton 'Exit' du menu paramètres de la GUI Kodi

    Après plusieurs recherches sur internet comment modifier l'affichage de la GUI Kodi, 
    j'ai pu comprendre le fonctionnement interne de celui-ci avec les add-ons et plus spécifiquement l'add-on skin.estuary 
    qui joue le rôle d'add-on d'affichage (ou theme) pour Kodi.

    4.1 Pour enlever le bouton 'Exit' il faut aller dans le répertoire /usr/local/share/kodi/addons/skin.estuary/xml 
    et éditer le fichier DialogButtonMenu.xml. (avant toute manipulation, j'ai sauvegardé l'entièreté de l'add-on pour avoir un backup)
    4.2 Il faut ensuite remplacer la ligne '<visible>System.ShowExitButton</visible>' par '<visible>no</visible>'.
    (https://iwf1.com/how-to-remove-power-off-system-from-kodis-shutdown-menu)


# Cours 2 (21.09.2020)
- exécuter un script a une heure précise avec 'cron' dans '~/scripts/cron.sh'
- connexion du disque dur au raspberry
- installer les commandes tar, ffmpeg, youtube-dl, Git, wGet (tar et wget, déjà installés)
- exécuter un script qui sort a l'écran la temperature/fréquence cpu du raspberry '~/scripts/diag.sh'



étape 1:
1.1 création du script
1.1.1 création du dossier 'scripts' dans ~/ (commande #mkdir scripts)
1.1.2 création du fichier 'cron.sh' avec le contenu suivant:
#!/bin/bash
echo 'exécution de la commande #ls -l'
ls -l
1.1.3 autorisation de l'exécuter pour tt le monde, commande #chmod +x cron.sh
1.1.4 test pour voir si le script fonctionne, commande #./cron.sh

1.2 mise en place du démon 'cron'
1.2.1 ajout du script à l'exécution de cron => #crontab -e 
ajouter cette ligne en fin
* * * * * /root/scripts/cron.sh >> /root/scripts/cron.log 
(s'exécute ttes les minutes)

pour débugger une commande dans cron qui ne donne aucun résultat, on peut la débugger en terminant la commande par: 'commande > ~/err.txt 2>&1'

1.2.2 exécution du script à 03h00 + sleep qques sec. pour éviter une surcharge sur le repository du prof

- installer git 
#apt-get update 
et 
#apt-get install git
- faire attendre une durée aléatoire entre 0 et 3600 secondes => #sleep $((RANDOM % 3600))
le (&& permet d'exécuter la commande suivante uniquement si la précédente est réussie)

changer l'heure et la mettre à celle de bruxelles => #ln -sf /usr/share/zoneinfo/Europe/Brussels /etc/localtime
(https://www.systutorials.com/linux-setting-date-time-and-timezone/)

Pour exécuter un pull a partir d'un répertoire différent:
#git -C /root/scripts/git_scripts/pje-f-raspberry-pi-4b/ pull

Le problème c'est qu'il va nous demander à chaque fois notre username et passwd donc après avoir lancé la commande #git config --global credential.helper store
il faudra de nouveau exéctuer #git -C /root/scripts/git_scripts/pje-f-raspberry-pi-4b/ pull https://gitlab.univ-lille.fr/pierre.michiels.etu/pje-f-raspberry-pi-4b.git
là il nous demandera pour la dernière fois notre username et passwd (https://stackoverflow.com/questions/35942754/how-to-save-username-and-password-in-git-gitextension)

connexion au repository via SSH: https://www.youtube.com/watch?v=QaO9aWy4rmc

le premier script 'runit.sh' ressemble à ceci:
#!/bin/bash

echo "$(date) - alive $rpi_name" >> /log/workload.log

$rpi_name est une variable qui représente le nom hostname du raspberry, on l'ajoute en tant que variable dans #crontab -e

ligne a ajouter apres avoir lancé la commande #crontab -e 
=> 
GIT_PATH=/root/scripts/git_scripts/pje-f-raspberry-pi-4b
CORRECT_GIT_PATH=/root/scripts/git_scripts/pje-f
rpi_name=michiels_raspberry_4b
1 3 * * * git -C $CORRECT_GIT_PATH checkout pmichiels && git -C $CORRECT_GIT_PATH pull && bash $CORRECT_GIT_PATH/runit/runit.sh && git -C $CORRECT_GIT_PATH add . && git -C $CORRECT_GIT_PATH commit -m "commit `date +\%d-\%m-\%Y` - `date +\%H:\%M:\%S` michiels" && git -C $CORRECT_GIT_PATH push origin pmichiels



et avec le paragraphe de '#' on ajoute les variables suivantes:
rpi_name=michiels_raspberry_4b
CORRECT_GIT_PATH=/root/scripts/git_scripts/pje-f


2.0 connexion du disque dur au raspberry et créer les dossiers '/media/usb/Films' , '/media/usb/Series' , '/media/usb/video-clips'.
raspberry le monte automatiquement
commande pour lister les disques => #lsblk
/media/sda est le disque dur
/media/sda1 est la partition donc il faut créer les dossiers dans /media/sda1 qui nous mène dans ce cas ci au dossier '/media/usb0'
commande pour démonter le disque 'sda1' => #umount -l /dev/sda1 (vérifier avant si c'est bien 'sda1' avec la commande #lsblk)


3.0 exécuter un script qui sort a l'écran la temperature/fréquence cpu du raspberry '~/scripts/diag.sh'
- installation du paquet 'lm-sensors' => #apt-get install lm-sensors
- pour retirer une string de l'ouput de la commande #sensors => #sensors | grep -oP '(?<=temp1:).*'
(https://unix.stackexchange.com/questions/393948/how-to-search-and-extract-string-from-command-output)

sinon, pour la frequence et le voltage
freq=$(vcgencmd measure_clock arm)
volt=$(vcgencmd measure_volts)


Cours 3 (28.09.2020)
- modifier l'interface, coté navigation (partie gauche)
il faut faire en sorte qu'il n'y a plus que les catégories film, series, TV et météo restent (supprimer ou créer les catégories manquantes)
il faut en fait avoir un ou plusieurs fichiers xml (qui sont sur un repository) qui représentent le menu qu'on a envie d'avoir et un script qui git pull et remplace les fichiers de l'ancien menu et les replacent avec les fichiers xml du repository.

Pour faciliter le raffraichissement de la page, on utilise des raccourcis inscrits dans le fichier keymap.xml, (à créer et à mettre dans /home/xbian/.kodi/userdata/keymaps)
https://kodi.wiki/view/Archive:Foundation



Pour afficher plus que les catégories film, series, TV et météo, il faut aller dans le fichier Home.xml (/usr/local/share/kodi/addons/skin.estuary/xml/Home.xml) et mettre en commentaire les balises <item> et leur contenu à partir de la ligne avec "<control type="fixedlist" id="9000">"
(voir point 6 - https://kodi.wiki/view/Estuary_Modification)

- Il faut ajouter un addon pour la catégorie TV addon franceTV 
Il faut donc le télécharger depuis kodi et son dossier dans le système unix se trouve à: /home/xbian/.kodi/addons/plugin.video.francetv
(après l'exercice, j'ai appris qu'il m'est impossible de transferer l'addon france tv de la catégorie 'video' vers la catégorie 'TV')



- il faut aussi rediriger ce que le script du prof télécharge dans le disque dur /media/usb0/Films ou encore /media/usb0/Series etc.
comment faire:
exécuter les commandes=>

#wget -q https://www.grimaud.ovh/pjef/Films.tar -O tmp.tar >> logs/workload.log
#tar -xvf tmp.tar >> logs/workload.log
#rm tmp.tar >> logs/workload.log
#wget -q https://www.grimaud.ovh/pjef/Series.tar -O tmp.tar >> logs/workload.log
#tar -xvf tmp.tar >> logs/workload.log
#rm tmp.tar >> logs/workload.log

puis déplacer les dossiers Films et Series dans le disque dur (/media/usb0/)

dans chaque dossier on a un fichier mkv de taille 0 octet
un fichier nfo qui faudra mettre a jour qui contient ttes les infos du film
*-poster.jpg qui est la jaquette
*-fontart.jpg qui est l'image de fond
*actors ???
et en dernier, il faut télécharger de youtube le trailer du film avec la commande youtube-dl
j'ai appris que kodi peut repérer le trailer localement si celui ci à son nom qui se termine par '*-trailer.extension'
https://forum.kodi.tv/showthread.php?tid=164443
il faut ensuite apres avoir téléchargé le trailer, le convertir en fichier mkv avec la commande ffmpeg

Pour le téléchargement des trailers:
installer le paquet curl pour récuperer un résultat json de l'api et jq pour pouvoir retirer des informations a partir du résultat json.
- Créer un script bash:
-- qui va récuperer un fichier json qui contient les données (venant de l'API youtube) pour chaque film du dossier Films
-- récupère l'id de la 1ere video trouvée via la commande 'jq'
-- télécharge la video (via la commande 'youtube-dl, a installer depuis le dépot officiel car la version via 'apt' est obselète) 
avec le lien http qui contient donc l'id de la video youtube
https://doc.ubuntu-fr.org/youtube-dl
-- 

Il faut récupérer une clé API google pour pouvoir utiliser l'API "YouTube Data API" après avoir aussi activé cette API dans le projet google

Après discussion avec le professeur, il n'est pas obligatoire de passer par une API, les liens de bande d'annonce se trouvent deja dans le fichier .nfo du dossier du film.

Pour récupérer le string spécifique dans le fichier .nfo:
https://stackoverflow.com/questions/21077882/pattern-to-get-string-between-two-specific-words-characters-using-grep

Cours 4 (05.10.2020)
terminer le cours 3
- afficher les catégories film, series, TV et météo (TV devient en fait la catégorie favoris et il aura le logo de la cat. TV et toutes les chaines du plugin franceTV)

faire de la surveillance video et faire en sorte que la caméra s'active et enregistre des qu'il y a du mouvement.
Possibilité de voir en direct depuis la catégorie 'favorites'
https://opendomotech.com/videosurveillance-avec-raspberry-pi-et-motion/







