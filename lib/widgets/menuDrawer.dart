import 'dart:io'; 
import 'package:flutter/material.dart'; 
import 'package:premier_projet/main.dart'; 
import 'package:premier_projet/screens/communaute_screen.dart'; 
import 'package:url_launcher/url_launcher.dart';

class MenuDrawer extends StatelessWidget { 
  MenuDrawer({Key? key}); 
  @override 
  Widget build(BuildContext context) { 
    return Drawer( 
      child: ListView( 
        children: [ 
          DrawerHeader( 
            child: Center( 
              child: CircleAvatar( 
                backgroundImage: AssetImage("assets/images/wp2301613.webp"), 
                radius: 90, 
              ), 
            ), 
            decoration: BoxDecoration( 
                gradient: LinearGradient( 
              colors: [Colors.white, Colors.deepPurpleAccent], 
            )), 
          ), 
          ListTile( 
            title: Text("Accueil"), 
            leading: Icon(Icons.home), 
            onTap: () { 
              Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => PageAccueil())); 
            }, 
          ), 
          ListTile( 
            title: Text("Communauté"), 
            leading: Icon(Icons.person), 
            onTap: () { 
              Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => PageCommunaute())); 
            }, 
          ), 
          ListTile(
            title: Text("Service Client"),
            leading: Icon(Icons.call),
            onTap: () {
              appeler();
            },
          ),
          ListTile( 
            title: Text("Quitter"), 
            leading: Icon(Icons.exit_to_app), 
            onTap: () { 
              exit(0); 
            }, 
          ), 
        ], 
      ), 
    );}
appeler() async { 
var numeroSerciceClient = "+221 77 205 17 79"; 
launch("tel:"+ numeroSerciceClient); 
}    
} 