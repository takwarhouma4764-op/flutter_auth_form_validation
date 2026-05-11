import 'package:flutter/material.dart';
import '../models/utilisateur.dart';
import 'page_recap.dart';
class PageInscription extends StatefulWidget {
  @override
  State<PageInscription> createState() => _PageInscriptionState();
}
class _PageInscriptionState extends State<PageInscription> {
  final _formKey         = GlobalKey<FormState>();
  final _nomController   = TextEditingController();
  final _emailController = TextEditingController();
  final _mdpController   = TextEditingController();
  String _niveau     = 'Débutant';
  bool   _newsletter = false;
  double _age        = 20;
  String _genre      = 'Homme';
  bool   _mdpVisible = false;
  @override
  void dispose() {
    _nomController.dispose();
    _emailController.dispose();
    _mdpController.dispose();
    super.dispose();
  }
  void _soumettre() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(context, MaterialPageRoute(
        builder: (_) => PageRecap(utilisateur: Utilisateur(
          nom: _nomController.text.trim(),
          email: _emailController.text.trim(),
          motDePasse: _mdpController.text,
          niveau: _niveau, newsletter: _newsletter,
          age: _age, genre: _genre,
        )),
      ));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inscription'), centerTitle: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildSectionTitle('Informations personnelles'), _buildChampNom(),
              SizedBox(height: 16),
              _buildChampEmail(),
              SizedBox(height: 16),
              _buildChampMdp(),
              SizedBox(height: 24),
              _buildSectionTitle('Profil'),
              _buildNiveau(),
              SizedBox(height: 16),
              _buildAge(),
              SizedBox(height: 16),
              _buildGenre(),
              SizedBox(height: 24),
              _buildSectionTitle('Préférences'),
              _buildNewsletter(),
              SizedBox(height: 32),
              _buildBoutonSoumettre(),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildSectionTitle(String titre) => Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Row(children: [
        Container(width: 4, height: 20,
            decoration: BoxDecoration(color: Colors.purple,
                borderRadius: BorderRadius.circular(2))),
        SizedBox(width: 10),
        Text(titre, style: TextStyle(fontSize: 16,
            fontWeight: FontWeight.bold, color: Colors.purple.shade700)),
      ]));
  Widget _buildChampNom() => TextFormField(
      controller: _nomController,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
          labelText: 'Nom complet', prefixIcon: Icon(Icons.person)),
      validator: (v) {
        if (v==null||v.trim().isEmpty) return 'Nom obligatoire';
        if (v.trim().length<3) return 'Minimum 3 caractères';
        return null;
      });
  Widget _buildChampEmail() => TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          labelText: 'Email', prefixIcon: Icon(Icons.email)),
      validator: (v) {
        if (v==null||v.isEmpty) return 'Email obligatoire';
        if (!RegExp(r'^[\w.-]+@[\w.-]+\.[a-z]{2,}$').hasMatch(v))
          return 'Format invalide';
        return null;
      });
  Widget _buildChampMdp() => TextFormField(
      controller: _mdpController,
      obscureText: !_mdpVisible,
      decoration: InputDecoration(
          labelText: 'Mot de passe', prefixIcon: Icon(Icons.lock),
          suffixIcon: IconButton(
              icon: Icon(_mdpVisible ? Icons.visibility_off : Icons.visibility),
              onPressed: () => setState(() => _mdpVisible = !_mdpVisible))),
      validator: (v) {
        if (v==null||v.isEmpty) return 'Mot de passe obligatoire';
        if (v.length<6) return 'Minimum 6 caractères';
        return null;
      });
  Widget _buildNiveau() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Niveau Flutter', style:
      TextStyle(fontSize:14,color:Colors.grey[700])),
      SizedBox(height:8),
      Container(padding: EdgeInsets.symmetric(horizontal:12),
          decoration: BoxDecoration(border:Border.all(color:Colors.grey.shade400),
              borderRadius:BorderRadius.circular(10)),
          child: DropdownButton<String>(value:_niveau,isExpanded:true,
              underline:SizedBox(),
              items:['Débutant','Intermédiaire','Avancé','Expert'].map((n)=>
                  DropdownMenuItem(value:n,child:Text(n))).toList(),
              onChanged:(v)=>setState(()=>_niveau=v!))),
    ]);
  }
  Widget _buildAge() => Column(
      crossAxisAlignment: CrossAxisAlignment.start, children: [
    Row(mainAxisAlignment:MainAxisAlignment.spaceBetween, children:[
      Text('Âge',style:TextStyle(fontSize:14,color:Colors.grey[700])),
      Text('${_age.round()} ans',style:TextStyle(
          fontWeight:FontWeight.bold,color:Colors.purple)),
    ]),
    Slider(value:_age, min:15, max:60, divisions:45,
        label:'${_age.round()} ans', activeColor:Colors.purple,
        onChanged:(v)=>setState(()=>_age=v)),
  ]);
  Widget _buildGenre() => Column(
      crossAxisAlignment: CrossAxisAlignment.start, children: [
    Text('Genre',style:TextStyle(fontSize:14,color:Colors.grey[700])),
    Row(children:['Homme','Femme'].map((g)=>Expanded(
        child:RadioListTile<String>(title:Text(g,style:TextStyle(fontSize:14)),
            value:g, groupValue:_genre, activeColor:Colors.purple,
            contentPadding:EdgeInsets.zero,
            onChanged:(v)=>setState(()=>_genre=v!)))).toList()),
  ]);
  Widget _buildNewsletter() => Container(
      decoration: BoxDecoration(
          color:_newsletter?Colors.purple.shade50:Colors.white,
          borderRadius:BorderRadius.circular(10),
          border:Border.all(color:_newsletter
              ?Colors.purple.shade300:Colors.grey.shade300)),
      child: CheckboxListTile(
          title:Text('Recevoir la newsletter'),
          subtitle:Text('Actualités Flutter chaque semaine',
              style:TextStyle(fontSize:12)),
          value:_newsletter, activeColor:Colors.purple,
          onChanged:(v)=>setState(()=>_newsletter=v!)));
  Widget _buildBoutonSoumettre() => ElevatedButton(
      onPressed: _soumettre,
      style: ElevatedButton.styleFrom(
          minimumSize:Size(double.infinity,52),
          shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(12)),
          backgroundColor:Colors.purple),
      child: Row(mainAxisAlignment:MainAxisAlignment.center, children:[
        Icon(Icons.check_circle_outline,color:Colors.white),
        SizedBox(width:8),
        Text('Créer mon compte',
            style:TextStyle(fontSize:16,color:Colors.white)),
      ]));
}