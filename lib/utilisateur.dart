// Classe de données pour stocker les infos du formulaire
class Utilisateur {
  final String nom;
  final String email;
  final String motDePasse;
  final String niveau;
  final bool newsletter;
  final double age;
  final String genre;
  Utilisateur({
    required this.nom,
    required this.email,
    required this.motDePasse,
    required this.niveau,
    required this.newsletter,
    required this.age,
    required this.genre,
  });
}