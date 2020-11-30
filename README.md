# Execice - Construire une application de blog type "Medium" ou "Ghost"

Le but de cet exercice est de parcourir les différentes étapes aboutissant à la création d'une application de blog, empruntant beaucoup à [Medium](https://medium.com/) et [Ghost](https://demo.ghost.io/) (plate-forme de blogging Open Source basée sur Node.js).

Il est possible d'envisager les aspects front-end et back-end de façon relativement séparée... Même s'ils finiront par se rejoindre ! Justement... Réfléchir à ce qu'on va vouloir afficher sur le front-end peut amorcer la réflexion sur ce qu'on aura besoin de mettre en place du côté du backend.

Quelques différences avec Medium et Ghost (si vous connaissez l'un et/ou l'autre) :

* Les articles ne seront pas liés à des "sous-blogs" comme sur Medium,
* Un article ne pourra avoir qu'un auteur,
* Un article appartiendra à une et une seule catégorie (_topic_ ou _category_),
* Un article pourra en revanche avoir zéro à plusieurs tags associés,
* Un article pourra être mis dans des "articles aimés/favoris" par un utilisateur,
* Un article pourra être mis dans une liste "à lire" par un utilisateur
* Un utilisateur pourra "suivre" (_follow_) un autre utilisateur

## "Carte" du site

### Page d'accueil

Sur la page d'accueil, on va vouloir afficher :

* (optionnel) un "hero", c'est-à-dire une bannière en pleine largeur, prenant 1/3 à 1/2 de la hauteur d'affichage (les frameworks CSS majeurs proposent un composant tout indiqué pour cela : [Bootstrap](https://getbootstrap.com/docs/4.5/components/jumbotron/), [Bulma](https://bulma.io/documentation/layout/hero/))
* (optionnel) des articles mis en valeur en haut de page
* une liste d'articles (les plus récents, les plus lus, les plus appréciés... à déterminer)

Le fichier `mockup/index.html` donne une idée de ce à quoi pourrait ressembler une version simple de la page d'accueil.

Chaque article de la page d'accueil comporte plusieurs liens :

* vers les articles d'un auteur
* vers les articles d'une catégorie
* vers les détails de l'article

Dans un premier temps, on va s'occuper surtout du dernier.

### Détails d'un article

La page de détails d'un article (voir `mockup/some-post/index.html`) affiche quelques informations en plus :

* Le contenu complet de l'article
* Les tags associés à cet article
* Le nombre de "likes"
* Le nombre de commentaires, et les commentaires eux-mêmes (pour information : Medium ne charge pas les commentaires par défaut, mais ici on va considérer qu'on les charge directement)

## Exercice - Modélisation

À partir des maquettes, il s'agit :

1. D'imaginer la forme des données JSON que le serveur devrait nous transmettre pour pouvoir afficher chacune des deux pages (accueil et détails d'un article).
2. De modéliser la base de données