# Documentation

## Car Information: `mtcars`
Le dataset **mtcars**, intégré dans l'environnement R, propose des informations détaillées sur 32 modèles de voitures, issues des tests routiers publiés dans *Motor Trend* en 1973.

- **Colonnes principales** :
  - **mpg** : Miles par gallon (efficacité énergétique).
  - **cyl** : Nombre de cylindres.
  - **disp** : Cylindrée (en pouces cubes).
  - **hp** : Puissance (en chevaux vapeur, *hp*).
  - **drat** : Rapport d'engrenage à l'arrière.
  - **wt** : Poids (en milliers de livres).
  - **qsec** : Temps sur un quart de mile (en secondes).
  - **vs** : Type de moteur (0 = en V, 1 = en ligne).
  - **am** : Type de boîte de vitesses (0 = automatique, 1 = manuelle).
  - **gear** : Nombre de rapports avant.
  - **carb** : Nombre de carburateurs.

Ces variables permettent d'explorer diverses analyses, comme la comparaison des performances selon le type de moteur ou l'efficacité énergétique.

---

## Statistics

### Statistiques descriptives
Les statistiques descriptives permettent de résumer les principales caractéristiques d'un jeu de données. Voici les mesures couramment utilisées :

- **Min** : La valeur minimale observée.
- **1st Qu** : La première quartile (25e centile), indiquant que 25 % des données sont inférieures à cette valeur.
- **Median** : La médiane (50e centile), divisant les données en deux parties égales.
- **Mean** : La moyenne, représentant la valeur moyenne des données.
- **3rd Qu** : La troisième quartile (75e centile), indiquant que 75 % des données sont inférieures à cette valeur.
- **Max** : La valeur maximale observée.

Ces mesures aident à comprendre la répartition des données et à identifier des valeurs extrêmes.

---

## Regression

La régression est une méthode statistique utilisée pour modéliser la relation entre une ou plusieurs variables indépendantes (*predictors*) et une variable dépendante (*outcome*).

### Types de régression
- **Régression linéaire simple** : Analyse de la relation entre une variable indépendante et une variable dépendante.
- **Régression linéaire multiple** : Prend en compte plusieurs variables indépendantes pour prédire une variable dépendante.

### Exemple : Régression sur le dataset `mtcars`
Une régression linéaire simple peut être utilisée pour analyser la relation entre la puissance (**hp**) et la consommation d'essence (**mpg**) :

- **Modèle** : `mpg ~ hp`
- **Résultat attendu** : La pente négative indiquera que plus une voiture est puissante, plus sa consommation d'essence est élevée.

Les coefficients, l'intercept, et les statistiques (p-valeur, R²) permettent d'évaluer la qualité de la relation.

---

## Tests d'hypothèses

Les tests d'hypothèses permettent de vérifier des affirmations statistiques sur un jeu de données.

### Exemple : Test de Student (t-test)
Le test de correlation de kendall est utilisé pour déterminer s'il y a une corrélation (un lien) entre mpg et hp

- **Hypothèses** :
  - \( H_0 \) : il y a une corrélation entre la consommation (mpg) et la puissance (hp).

  - \( H_1 \) : il n'y a pas de corrélation entre la consommation (mpg) et la puissance (hp).
=- **Interprétation** :
  - Une p-valeur inférieure à 0,05 signifie qu'il n'y a pas de corrélation significative au seuil de 5 %.

### Autres tests courants
- **Test du khi-deux** : Pour tester l'indépendance entre deux variables catégoriques.
- **ANOVA** : Pour comparer les moyennes entre plus de deux groupes.

---

## Conclusion
Cette documentation présente les principaux datasets, statistiques descriptives, et analyses possibles, notamment la régression et les tests d'hypothèses. Elle fournit une base solide pour explorer et analyser les données de manière efficace.
