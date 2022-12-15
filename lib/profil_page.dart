import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'welcome_page.dart';
import 'bottomNavBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'document_page.dart';

class Profil extends StatelessWidget {
  const Profil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: null,
            ),
            ListTile(
              title: Text('text'),
              contentPadding: const EdgeInsets.only(left: 50.0),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DocumentPage()));
              },
            ),
            ListTile(
              title: Text('text'),
            ),
            ListTile(
              title: Text('text'),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Color(0Xff6949FF)),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text('Mon Profil',
              style: TextStyle(
                  color: Color(0Xff6949FF),
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold)),
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('images/shrek.jpeg'),
                ),
                Text('Andrew Ainsley',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text('30 ans',
                    style: TextStyle(color: Colors.black, fontSize: 15)),
                DefaultTextStyle(
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 100),
                          Text('Email'),
                          Text('andrew.ainsley@yourdomain.com',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 45),
                          Text('Téléphone'),
                          Text('06 XX XX XX XX',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 45),
                          Text('Mon notaire'),
                          Text('M. PATOCHE',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 45),
                          Text('Notario ID'),
                          Text('965794584358369',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: ButtonNavBar(),
    );
  }
}

class ProfilPage extends StatefulWidget {
  const ProfilPage();

  @override
  ProfilPageState createState() => ProfilPageState();
}

class ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
