import 'package:flutter/material.dart';
import '../models/utilisateur.dart';
class PageRecap extends StatelessWidget {
  final Utilisateur utilisateur;
  const PageRecap({Key? key, required this.utilisateur}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Récapitulatif'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            // Icône de succès
            Container(
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.purple.shade50,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.check_circle, color: Colors.purple, size: 64),
            ),
            SizedBox(height: 16),
            Text('Inscription réussie !',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Voici vos informations',
                style: TextStyle(color: Colors.grey)),
            SizedBox(height: 32),
            // Tableau de récapitulatif
            _buildInfoCard(context),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => Navigator.popUntil(
                  context, (r) => r.isFirst),  // retour à la 1ère page
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 48),
                backgroundColor: Colors.purple,
              ),
              child: Text('Retour à l accueil',
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildInfoCard(BuildContext context) {
    final infos = [
      ['Nom',         utilisateur.nom],
      ['Email',       utilisateur.email],
      ['Niveau',      utilisateur.niveau],
      ['Âge',         '${utilisateur.age.round()} ans'],
      ['Genre',       utilisateur.genre],
      ['Newsletter',  utilisateur.newsletter ? 'Oui' : 'Non'],
    ];
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(
          color: Colors.black.withOpacity(0.07),
          blurRadius: 8, offset: Offset(0, 2),
        )],
      ),
      child: Column(
        children: infos.asMap().entries.map((entry) {
          final i = entry.key;
          final info = entry.value;
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            decoration: BoxDecoration(
              color: i.isEven ? Colors.grey.shade50 : Colors.white,
              borderRadius: i == 0
                  ? BorderRadius.vertical(top: Radius.circular(12))
                  : i == infos.length - 1
                  ? BorderRadius.vertical(bottom: Radius.circular(12))
                  : BorderRadius.zero,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(info[0], style: TextStyle(
                    color: Colors.grey[600], fontSize: 14)),
                Text(info[1], style: TextStyle(
                    fontWeight: FontWeight.w600, fontSize: 14)),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
