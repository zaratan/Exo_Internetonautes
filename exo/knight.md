# Exo du cavalier

Aux échecs, le cavalier se déplace en L ([Page wiki](<https://en.wikipedia.org/wiki/Knight_(chess)#Movement>)).
Écrire un algorithme permettant de trouver le plus court chemin d'une case à une autre pour un cavalier.

## Input

Une case de l'échiquier est représentée par une lettre dans ["A", …, "H"] et un chiffre compris entre 1 et 8. (Voir la page Wikipédia ci-dessus pour la notation)
Ces derniers seront rangé dans un tableau à deux éléments.

Les deux paramètres seront une position indiquant l'origine du déplacement et une seconde indiquant la case finale à atteindre.

**Note** : On considèrera que les paramètres sont toujours des positions valides.

## Output

Sera attendu en sortie un Hash contenant deux choses:

- une clé `:count` indiquant le nombre minimal de coups
- une clé `:path` pointant vers un tableau de position successives nécessaires pour que le cavalier se rende à sa destination.

**Note** : Si il y a plusieurs solutions possibles, n'en donner qu'une seule.

## Exemple

`sol(["F", 3], ["E", 4]) #=> {count: 2, path: [["D", 2], ["E", 4]]}`
