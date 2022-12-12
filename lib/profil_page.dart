import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'delayed_animation.dart';
import 'main.dart';
import 'document_page.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage();

  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: blue_color,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(
                size: 40,
                AssetImage("images/folder-white.png"),
                color: Color.fromARGB(255, 0, 0, 0),
            ),
            label: 'Documents',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
                size: 40,
                AssetImage("images/planning-white.png"),
                color: Color.fromARGB(255, 0, 0, 0),
            ),
            label: 'Agenda',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
                size: 40,
                AssetImage("images/tchat.png"),
                color: Color.fromARGB(255, 0, 0, 0),
            ),
            label: 'FAQ',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
                size: 40,
                AssetImage("images/profil-white.png"),
                color: Color.fromARGB(255, 0, 0, 0),
            ),
            label: 'Profil',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            if (index == 3) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilPage()),
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DocumentPage()),
              );
            }
          });
        },
      ),
    );
  }
}

class Profil extends StatefulWidget {
  const Profil();

  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        children: [
          DelayedAnimation(
                delay: 200,
                child: Container(
                  height: 100,
                  margin: EdgeInsets.only(
                    top: 100,
                    bottom: 0,
                  ),
                  child: Text(
                    "Profil",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 30,
                      color: blue_color,
                    )
                  ),
                ),
          ),
          MyStatefulWidget(),
        ],
      ),
    );
  }
}