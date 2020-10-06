# Cours 1 (14.09.2020)
- Mise en place du raspberry pi 4b
- Installation de l'OS xBian sur la carte SD du raspberry
- Connexion du pc hôte au raspberry avec un cable ethernet via le protocole SSH
- Enlever le bouton 'Exit' du menu paramètres de la GUI Kodi
___
# Cours 2 (21.09.2020)
- Création d'un script qui s'exécutera tous les jours entre 3 heures et 4 heures du matin qui exécute le script situé sur le répository gitlab du professeur puis qui push le résultat d'affichage et le concatène dans le fichier workload.log du dossier logs/
- Création d'un script qui s'exécute toutes les minutes et concatène le résultat d'affichage dans le fichier status.log qui lui ne sera pas déposé sur un repository mais restera sur le raspberry.
Ce script doit afficher la date, la température, la fréquence du cpu et le 'Kodi status'.
- Connecter le disque dur et y créer les dossiers 'Films' et 'Series'
- Installer les paquets 'ffmpeg', 'tar', 'youtube-dl', 'Git' et 'wGet' sur le raspberry.
___
# Cours 3 (28.09.2020)
- Exécuter le script du professeur pour récuperer les Films et Séries puis les copier dans le disque dur dans leur répertoire respectifs
- Trouver un moyen de télécharger les trailers (bande d'annonce) des films et séries
## Modifier l'interface graphique pour qu'après il y ai:
Niveau navigation: 
- Ne plus que laisser les catégories 'Movies', 'TV Shows', 'Weather' et 'Favourites'
- Installer l'add-on france.tv pour ensuite mettre chaque chaine dans la catégorie 'Favourites'
- Installer un add-on fonctionn,el pour la catégorie 'Weather'
- Renommer la catégorie 'Favourites' par 'TV' et remplacer le logo par celui de la catégorie supprimée 'live TV'
Niveau Affichage: (Pour les catégories 'Movies' et 'TV Shows')
- Lorsque le focus est sur une jaquette de la sous-catégorie 'Recently added movies'/'Recently added episodes', ajouter la description au dessus partie gauche et la bande d'annonce au-dessus partie droite.





