# 🍊 Nutriti 📅 🛒

## Présentation

Nutriti est une application qui propose des repas pour la semaine à l'utilisateur selon ses objectifs et lui génère la liste des courses correspondante avec les quantités.

![Image of site](https://i.imgur.com/ClPuT20.jpg)

## Visite en ligne http://nutriti.herokuapp.com/

### Compte Administrateur
Connectez-vous avec :
login : lazyrabbit@yopmail.com |
password : 123456

Vous aurez ainsi accès à la partie "Dashboard Admin" depuis le menu déroulant de votre navbar

## Etat d'avancement du projet 

MVP fonctionnel : 
- l'application est capable de générer des repas sur une semaine et de proposer la liste des courses correspondantes.
- les administrateurs ont accès à un générateur de recettes leur permettant de construire des recettes saines sur la bases des aliments présents dans la table Ciqual
- Les utilisateurs peuvent également générer un repas seul ou une journée de repas unique.

### Schéma de la BDD

![Image of site](https://i.imgur.com/ETawP7B.png)


### Prochaines étapes
- continuer de compléter notre base de données de recettes
- améliorer le front et l'UI
- gérer l'envoi de la liste des courses par mail
- séparer le petit déjeuner des autres repas de la journée et le rendre configurable pour l'utilisateur
- générer les repas non plus de façon aléatoire, mais adaptés aux besoins de l'utilisateur
- prendre en compte les préférences de l'utilisateur (régimes spéciaux, allergies)

Certaines limites techniques nous empèchent de proposer une application plus intéressante économiquement parlant, voir ci-après.

### Limites

Notre site est basé sur les aliments de la tables Ciqual qui est un jeu de données produit par l'Agence nationale de sécurité sanitaire de l'alimentation, de l'environnement et du travail sur la composition nutritionnelle des aliments. 
C'est une référence pour les nutritionnistes toutefois les aliments présentés sont des aliments génériques et non des produits.

En nous basant sur la base Open Food Facts nous pourrions proposez bien plus qu'une liste de courses, notamment des drives prêt à emporter chez un distributeurs ! Malheuresement aucun des membres de notre équipe n'a d'ordinateur assez puissant pour ouvrir et manipuler cette immense base de données...


## :wrench: Installation en local

### Configuration
Entrez les commandes suivantes dans votre terminal préféré :

`git clone git@github.com:luca-montaigut/Nutriti.git`

`cd Nutriti`

`bundle install`

### Database creation

`rails db:create`

`rails db:migrate`

### Database initialisation

`rails db:seed`

## 🔥 Connexion au site

`rails server`

Une fois le server connecté, rendez-vous sur :

http://localhost:3000/

### (Rappel) Compte Administrateur
Connectez-vous avec :
login : lazyrabbit@yopmail.com |
password : 123456

Bonne visite !

## 🐰 Auteurs
Luca Montaigut : https://github.com/luca-montaigut

Marius Le Houezec Lacaze : https://github.com/MariusLHL

Baptiste Igier : https://github.com/BaptisteIg

Thibault Perchicot : https://github.com/Azaeps

### Notre mentor : 🧙‍♂️ Manuel Cartier https://github.com/neolectron

