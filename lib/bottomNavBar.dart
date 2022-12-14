import 'package:Notario/main.dart';
import 'package:flutter/material.dart';
import 'profil_page.dart';
import 'document_page.dart';
import 'planning_page.dart';
import 'api.dart';

class ButtonNavBar extends StatefulWidget {
  const ButtonNavBar();

  @override
  _ButtonNavBarState createState() => _ButtonNavBarState();
}

class _ButtonNavBarState extends State<ButtonNavBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DocumentPage()),
            );
          } else if (index == 1) {
            rdv_list = Future(() => api_get_planning(token: token));
            rdv_list.then((value) {
              rdv_list = value;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Planning()),
              );
            });
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DocumentPage()),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Profil()),
            );
          }
        });
      },
    );
  }
}
