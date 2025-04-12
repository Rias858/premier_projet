import 'package:flutter/material.dart';
import 'package:premier_projet/screens/login_screen.dart';
import 'package:premier_projet/widgets/bottomNav.dart';
import 'package:premier_projet/widgets/menuDrawer.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Première application",
      home: LoginScreen(),
    );
  }
}

class PageAccueil extends StatefulWidget { 
  PageAccueilState createState() => PageAccueilState();
}
class PageAccueilState extends State<PageAccueil> {
  int _nbrelikes = 0;
  int _nbredislikes = 0;
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
        drawer: MenuDrawer(),
        bottomNavigationBar: BottomNav(indexSelection: 0),
        appBar: AppBar(
            centerTitle: true, 
            title: const Text( 
              "Page Accueil", 
              style: TextStyle( 
                fontSize: 20, 
                fontWeight: FontWeight.bold, 
                color: Colors.white, 
              ), 
            ), backgroundColor: Colors.deepPurpleAccent,
            ), 
        body:  SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/images/wp2301613.webp"),
              Padding(padding: const EdgeInsets.all(19),
              child: Text('Rencontrez Fallou, le roi autoproclamé des gaffes technologiques !'
                    'Avec ses talents comiques aussi aiguisés qu un couteau émoussé,'
                    'il navigue maladroitement à travers les méandres de la technologie,' 
                    'semant chaos et hilarité sur son passage.'
                    'Armé d\'un humour aussi imprévisible que ses clics malencontreux,' 
                    'Fallou transforme chaque tentative de résolution de problème en un spectacle comique inoubliable.' 
                    'Mais malgré ses maladresses, son esprit jovial et sa capacité à rire de lui-même font de lui un compagnon de travail apprécié,'
                    'apportant une touche de légèreté à chaque situation.'
                    'Dans le monde complexe de la tech,'
                    'Fallou est le clown bien-aimé, toujours prêt à faire rire et à transformer les erreurs en anecdotes mémorables,',
                    softWrap: true, 
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                   Column( 
                    mainAxisSize: MainAxisSize.min, 
                    mainAxisAlignment: MainAxisAlignment.center, 
                    children: [ 
                      IconButton( 
                        icon: Icon(Icons.thumb_up), 
                        color: Colors.blue,
                        iconSize: 50, 
                        onPressed: () { 
                           setState(() { 
                             _nbrelikes++; 
                           }); 
                        }, 
                      ), 
                      Padding( 
                        padding: const EdgeInsets.only(top: 8), 
                        child: Text( 
                          "${_nbrelikes}", 
                          style: TextStyle( 
                              fontSize: 20, 
                              fontWeight: FontWeight.w400, 
                              color: Colors.red), 
                        ), 
                      ), 
                    ], 
                  ), 
            Column( 
                    mainAxisSize: MainAxisSize.min, 
                    mainAxisAlignment: MainAxisAlignment.center, 
                    children: [ 
                      IconButton( 
                        icon: Icon(Icons.thumb_down), 
                        color: Colors.red,
                        iconSize: 50, 
                        onPressed: () { 
                          setState(() { 
                            _nbredislikes++; 
                          }); 
                        }, 
                      ), 
                      Padding( 
                        padding: const EdgeInsets.only(top: 8), 
                        child: Text( 
                          "${_nbredislikes}", 
                          style: TextStyle( 
                              fontSize: 20, 
                              fontWeight: FontWeight.w400, 
                              color: Colors.red), 
                        ), 
                      ), 
                    ],)
                ],
              )
            ],
          ),
        ), 
      );
  } 
} 
