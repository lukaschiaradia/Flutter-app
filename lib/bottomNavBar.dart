import 'package:Notario/main.dart';
import 'package:flutter/material.dart';
import 'profil_page.dart';
import 'document_page.dart';
import 'planning_page.dart';
import 'faq_page.dart';
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
            faq_list = Future(() => api_get_questions());
            faq_list.then((value) {
              faq_list = value;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FaqPage()),
              );
            });
            //chats_list = Future(() => api_get_chats());
            //chats_list.then((value) {
            //  chats_list = value;
            //  print("Récupérer les chats == OK");
            //  chat_List = create_chat_list(chats_list);
            //  print(chat_List);
            //  print("Création de la liste des chats == OK");
            //  chat_id = Future(() => api_get_chat(chat_List[0]['chat_id']));
            //  chat_id.then((value) {
            //    chat_with_messages = value;
            //    print("Récupérer les messages d'un chat == OK");
            //    print(chat_with_messages);
            //    all_messages = create_messages_list(chat_with_messages);
            //    print("Création de la liste des messages == OK");
            //    print(all_messages);
            //    Navigator.push(
            //      context,
            //      MaterialPageRoute(builder: (context) => FaqPage()),
            //  );
            //  });
            //});
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
