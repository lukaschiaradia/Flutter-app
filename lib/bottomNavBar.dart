import 'package:Notario/main.dart';
import 'package:flutter/material.dart';

class ButtonNavBar extends StatelessWidget {
  const ButtonNavBar({
    Key? key,
    required int currentIndex,
  }) : _currentIndex = currentIndex, super(key: key);

  final int _currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      unselectedItemColor: Colors.grey,
      selectedItemColor: blue_color,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(IconData(0xe2a3, fontFamily: 'MaterialIcons')),
          label: 'Documents',
        ),
        BottomNavigationBarItem(
          icon: Icon(IconData(0xf051f, fontFamily: 'MaterialIcons')),
          label: 'Agenda',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'FAQ',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'Profil',
        ),
      ],
      onTap: (index) {
        //setState(() {
        //  _currentIndex = index;
        //});
      },
    );
  }
}