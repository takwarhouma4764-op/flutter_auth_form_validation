# Flutter Form & State Management 

[cite_start]Ce projet est une application Flutter de **Formulaire d'Authentification**, réalisée dans le cadre du TP 3. L'objectif principal est de maîtriser la gestion de l'état local et la validation des saisies utilisateur.

## 🚀 Objectifs du TP
Cette application démontre les concepts suivants :
- [cite_start]**StatefulWidget** : Gestion dynamique de l'interface et mise à jour de l'état avec `setState()`[cite: 14].
- [cite_start]**Form & TextFormField** : Utilisation des widgets de saisie avec gestion du focus[cite: 4, 11].
- [cite_start]**Validation** : Mise en place de validateurs pour l'email (format @) et le mot de passe (longueur minimale)[cite: 20].
- [cite_start]**Gestion de l'affichage** : Fonctionnalité pour masquer ou afficher le mot de passe via un bouton "œil"[cite: 16, 21].
- [cite_start]**Interaction utilisateur** : Utilisation de `GlobalKey<FormState>` pour soumettre le formulaire et afficher des messages de succès via une `SnackBar`[cite: 13, 19].

## 📸 Fonctionnalités
- [cite_start]**Validation en temps réel** : Les champs vérifient les erreurs dès la soumission[cite: 19, 20].
- [cite_start]**Toggle Password** : Icône interactive pour sécuriser la saisie du mot de passe[cite: 16, 21].
- [cite_start]**Design Material** : Utilisation de `InputDecoration` avec icônes, bordures arrondies et couleurs thématiques[cite: 16, 17].

## 🛠️ Installation et Lancement

1.  **Cloner le projet** :
    ```bash
    git clone [https://github.com/votre-utilisateur/flutter-auth-form-validation.git](https://github.com/votre-utilisateur/flutter-auth-form-validation.git)
    ```
2.  **Installer les dépendances** :
    ```bash
    flutter pub get
    ```
3.  **Lancer l'application** :
    ```bash
    flutter run
    ```

## 📝 Structure du Code
- [cite_start]`main.dart` : Configure le thème de l'application[cite: 7].
- [cite_start]`lib/pages/page_inscription.dart` : Contient la logique du `StatefulWidget`, les contrôleurs de texte et les fonctions de validation[cite: 8, 12].

## 🎓 Auteur
[cite_start]**Saidani Khaoula** - Programmation Mobile Cross-Platform[cite: 6].
