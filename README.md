# Project 

Créer une application qui :

 1. Affiche un écran d’accueil avec un texte et un bouton.
 2.  Au clic sur le bouton, j’arrive sur un autre écran contenant une jauge de progression en pourcentage en bas de l’écran avec un message au dessus.
 3. Cette jauge doit se remplir à 100% en 60 secondes :
4. Toutes les 10 secondes elle doit faire un appel à une API météo pour 5 villes :
- 0 secondes Rennes
- à 10 secondes Paris
- à 20 secondes Nantes
- etc pour Bordeaux et Lyon
- Par exemple l’api  [https://openweathermap.org/current](https://openweathermap.org/current), ou une autre API de météo de votre choix

5. Un message d’attente est affiché pour faire patienter l’utilisateur :
- 3 messages qui doivent tourner toutes les 6 secondes (sans limite de temps)
-- Nous téléchargeons les données…
-- C’est presque fini…
-- Plus que quelques secondes avant d’avoir le résultat…

6. Gérer les erreurs d’API
7. Lorsque la jauge est remplie elle affiche les résultats obtenus sous forme d’un tableau de 5 lignes (une ligne par ville) sur le même écran (au-dessus de la jauge par exemple)
 -  Afficher à minima le nom de la ville, la température, la couverture nuageuse (sous forme d’un picto par exemple)

8. La jauge se transforme en bouton « Recommencer »
9. Il est possible de faire back pour revenir à l’écran d’accueil

> Afin de nous faire un retour rapide, vous êtes libre de prendre des raccourcis.  **Merci dans ce cas de signaler ces raccourcis en commentaire dans votre code**. Ceci afin pour nous d’identifier une volonté d’être rapide par rapport à un manque de rigueur.
> 
> Ce test est prévu pour 3 heures. Si vous n’arrivez pas à terminer le test, ce n’est pas éliminatoire, faites le maximum avec le meilleur niveau de qualité.
