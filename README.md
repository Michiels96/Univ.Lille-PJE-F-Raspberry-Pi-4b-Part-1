# Cours 1 (14.09.2020)
- Mise en place du raspberry pi 4b
    - fait réference au(x) point(s):  
        - assemblage du matériel
- Installation de l'OS xBian sur la carte SD du raspberry
    - fait réference au(x) point(s):  
        - création de la carte sd
- Connexion du pc hôte au raspberry avec un cable ethernet via le protocole SSH
    - fait réference au(x) point(s):  
        - configuration du réseau 
        - configuration de ssh avec une clef cryptographique (à la place du mot de passe)
- Enlever le bouton 'Exit' du menu paramètres de la GUI Kodi
    - fait réference au(x) point(s):  
        - création d’une view spécifique « raspflix »
___
# Cours 2 (21.09.2020)
- Création d'un script qui s'exécutera tous les jours entre 3 heures et 4 heures du matin qui éxécute le script situé sur le répository gitlab du professeur puis qui push le résultat d'affichage et le concatène dans le fichier workload.log du dossier logs/
    - fait réference au(x) point(s): 
        - scripting de mise à jour journalière via un dépôt git
- Création d'un script qui s'exécute toutes les minutes et concatène le résultat d'affichage dans le fichier status.log qui lui ne sera pas déposé sur un repository mais restera sur le raspberry.
Ce script doit afficher la date, la température, la fréquence et le voltage du cpu et le 'Kodi status'.
    - fait réference au(x) point(s): 
        - scripting de monitoring thermique
- Connecter le disque dur et y créer les dossiers 'Films' et 'Series'
- Installer les paquets 'ffmpeg', 'tar', 'youtube-dl', 'Git' et 'wGet' sur le raspberry.
___
# Cours 3 (28.09.2020)
- Exécuter le script du professeur pour récuperer les Films et Séries puis les copier dans le disque dur dans leur répertoire respectifs
- Trouver un moyen de télécharger les trailers (bande d'annonce) des films et séries
    - fait réference au(x) point(s): 
        - récupération (automatisée/scriptée) des trailer de l’ensemble des films et séries sur le disque local
## Modifier l'interface graphique pour qu'après il y ai :
Niveau navigation : 
- Ne plus que laisser les catégories 'Movies', 'TV Shows', 'Weather' et 'Favourites'
    - fait réference au(x) point(s):  
        - création d’une view spécifique « raspflix »
- Installer l'add-on france.tv pour ensuite mettre chaque chaine dans la catégorie 'Favourites'
    - fait réference au(x) point(s): 
        - installation des chaines france.tv
- Installer un add-on fonctionnel pour la catégorie 'Weather'
    - fait réference au(x) point(s): 
        - création d’une view spécifique « raspflix »
- Renommer la catégorie 'Favourites' par 'TV' et remplacer le logo par celui de la catégorie supprimée 'live TV'
    - fait réference au(x) point(s): 
        - création d’une view spécifique « raspflix »
        
Niveau Affichage : (Pour les catégories 'Movies' et 'TV Shows')
- Lorsque le focus est sur une jaquette de la sous-catégorie 'Recently added movies'/'Unwatched movies'/'Random movies', ajouter la description au dessus partie gauche et la bande d'annonce au-dessus partie droite.
    - fait réference au(x) point(s): 
        - création d’une view spécifique « raspflix »
___
# Cours 4 (05.10.2020)
- Terminer le changement de GUI du cours 3
- Réussir à connecter la caméra au raspberry et créer un add-on et l'ajouter dans dans l'ancienne catégorie 'favourites' 
qui permet de visualiser tous les enregistrements situés sur le disque dur.
Il faut que la caméra puisse démarrer un enregistrement dès qu'elle détecte du mouvement.
    - fait réference au(x) point(s): 
        - création du système de video surveillance



