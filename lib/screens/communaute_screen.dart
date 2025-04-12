import 'package:flutter/material.dart'; 
      import 'package:premier_projet/widgets/bottomNav.dart'; 
      import 'package:premier_projet/modeles/personne.dart';
import 'package:premier_projet/widgets/menuDrawer.dart';
      class PageCommunaute extends StatefulWidget { 
         PageCommunauteState createState() => PageCommunauteState(); 
      } 
      class PageCommunauteState extends State<PageCommunaute> { 
        List<Personne> listePersonnes = [ 
          Personne(1, 'Jean Dupont', 'Développeur', 771234567, 'assets/images/a cute little puppy chasing after butterflies in a majestic garden.png'), 
          Personne(2, 'Marie Curie', 'Scientifique', 787654321, 'assets/images/a cute straight aesthetic nose.png'), 
          Personne(3, 'Émile Zola', 'Écrivain', 702233445, 'assets/images/une carte banquaire bleu de nuit dans un fond vert gris avec des ornements.png'), 
          Personne(4, 'Claude Monet', 'Peintre', 765667788, 'assets/images/pretty blue eyes on chocolate skin.png'), 
          Personne(5, 'Sophie Marceau', 'Actrice', 775788990, 'assets/images/a pair of elegant white and blue wedges that are more open, not completely closed on the feet.png'), 
        ];
        @override 
        Widget build(BuildContext context) { 
          return Scaffold( 
            drawer: MenuDrawer(),
             bottomNavigationBar: BottomNav( 
               indexSelection: 1, 
            ), 
          appBar: AppBar( 
          backgroundColor: Colors.lightGreen, 
                centerTitle: true, 
                title: const Text( 
                 "Page Communauté", 
                 style: TextStyle( 
                     fontSize: 18, 
                     fontWeight: FontWeight.bold, 
                     color: Colors.white, 
                ), 
          )), 
         body: builListView());
        }

ListTile getLisTile(int index, BuildContext context, String item) { 
    Personne pers = listePersonnes[index]; 
    return ListTile( 
      title: Text("${pers.nom}"), 
      subtitle: Text(pers.metier + " Tel.:${pers.telephone}"), 
      leading: CircleAvatar( 
        backgroundImage: NetworkImage(pers.imageProfil), 
      ), 
      trailing: IconButton( 
        icon: Icon( 
          Icons.delete, 
          color: Colors.red, 
        ), 
        onPressed: () { 
          setState(() { 
            listePersonnes.removeAt(index); 
          }); 
          ScaffoldMessenger.of(context).showSnackBar(SnackBar( 
            content: Text('$item a été supprimé de la liste'), 
            // Optional duration 
          )); 
        }, 
      ), 
      onTap: () { 
        showDialog( 
            context: context, 
            builder: (BuildContext context) => 
                getAlertDialogInfosPersonne(pers, context)); 
      }, 
    ); 
  } 

ListView builListView () {
            return ListView.separated(
              itemCount: listePersonnes.length,
              itemBuilder: (context, index) { 
                final pers = listePersonnes.elementAt(index);
                final item = listePersonnes.elementAt(index).nom;

                return Container(
                  key: Key(pers.id.toString()),
                  child: getLisTile(index, context, item),
                );
              },
              separatorBuilder: (BuildContext context, int index) => const Divider(
                color: Colors.grey,
              ),
            );
          }
  }  

  AlertDialog getAlertDialogInfosPersonne(Personne pers, BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 93, 132, 201),
      title: Text("Détail des informations",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
      content: getAlerDialogsDetailInfos(pers),
      actions: [
        TextButton(onPressed: () {
          Navigator.pop(context);
        }, 
        child: Text("OK", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),)),
      ],
    );
  }

getAlerDialogsDetailInfos(Personne pers) { 
    return SingleChildScrollView( 
        child: Column( 
      crossAxisAlignment: CrossAxisAlignment.start, 
      children: [ 
        Center( 
          child: Column( 
            children: [ 
              CircleAvatar( 
                backgroundImage: NetworkImage(pers.imageProfil), 
                radius: 90, 
              ), 
              Text( 
                pers.nom, 
                textAlign: TextAlign.center, 
                textScaleFactor: 2.0, 
                style: TextStyle(color: Colors.white), 
              ), 
              Text( 
                pers.metier, 
                textAlign: TextAlign.center, 
                textScaleFactor: 2.0, 
                style: TextStyle(color: Colors.white), 
              ), 
              Text( 
                pers.telephone.toString(), 
                textAlign: TextAlign.center, 
                textScaleFactor: 2.0, 
                style: TextStyle(color: Colors.white), 
              ), 
            ], 
          ), 
        ) 
      ], 
    ));}