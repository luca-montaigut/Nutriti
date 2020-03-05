# 🍽️ Nutriti 📅

## 1. Présentation

Une appli qui te propose des repas pour la semaine selon tes objectifs et génère la liste des courses correspondante avec les quantités.

## 2. Parcours utilisateur

Le moins de paramétrage possible pour être direct dans le concret

L'utilisateur entre ses informations :

- 🆔 taille + poids (=calcul de l'IMC) 

- 🏃 activité physique (nulle, modérée, régulière, intense ...) 

- 🎯 objectif : maigrir, grossir ou seulement équilibrer ses repas)

L'appli génère une semaine de repas type avec les quantités et la liste de courses 

L'utilisateur voit son planning de repas

Il peut cliquer sur les repas pour les modifier (ex : changer un aliment qu'il n'aime pas etc...)

Il peut s'envoyer sa liste de courses par mail ou l'imprimer

Fonctionnalités avancées : 

- Tuto cuisson aliments / recettes

- Possibilité d'associer les aliments avec des produits de supermarché pour générer un drive prêt a emporter 

Loin dans le futur : 🗺️ applicable à divers pays (langue + aliments et recettes locales)

## 3. Concrètement et techniquement

L'appli doit apprendre de l'utilisateur : possibilité de paramétrer les aliments petit à petit

- ne pas me proposer (j'aime pas)

- ne plus me le proposer pendant quelques temps (j'en ai trop mangé dernièrement)

- augmenter la fréquence (j'en voudrais plus souvent, quitte à diminuer un aliment de la même catégorie)

- etc...

Les régimes alimentaires doivent être pris en compte : végétarien 🥬, végétalien 🥕, religieux 🧕 etc...

L'appli doit proposer des aliments de saison et si possible locaux 

L'appli doit proposer des programmes sur :
- 1 repas
- 1 jour
- 1 semaine
- 2 semaines
- 1 mois

💰 Modèle économique : appli gratuite + feature additionnelle payante

### 3.1. Base de données
* Utilisateurs
* Aliments et/ou Recette complète ? (pour proposer autre chose que des combinaisons d'aliments simples)
* Planning

### 3.2. Front

Bootstrap avec ou sans thème + sûrement du Javascript mais nous n'avons pas encore vu le cours dessus

### 3.3. Backend

Rails, Devise, Letter-Opener, Table Print, Mailjet

### 3.4. Mes besoins techniques

La partie qui m'inquiète le plus concerne la création des repas et les relations de la base de données.

L'appli a été pensée de base pour mobile. Je n'ai pas spécialement d'idées pour la charte graphique du front.

## 4. La version minimaliste mais fonctionnelle qu'il faut avoir livré la première semaine

MVP = L'appli génère des repas (équilibrés ou non) et une liste de courses sans prise en compte des régimes particuliers et du paramétrage des aliments + compte utilisateur

## 5. La version que l'on présentera au jury

Paramétrage des aliments pour s'adapter à l'utilisateur + "beau" front

## 6. Notre mentor
🧙‍♂️ Manuel Cartier https://www.linkedin.com/in/manucartier
