import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'delayed_animation.dart';
import 'main.dart';
import 'package:open_file/open_file.dart';
import 'package:file_picker/file_picker.dart';
import 'profil_page.dart';
import 'bottomNavBar.dart';
import 'api.dart';
import 'chat_box.dart';

List<dynamic> create_faq_list(List faqlist) {
  List<dynamic> faq_List = [];
  for (int x = 0; x < faqlist.length; x++) {
    faq_List = [
      ...faq_List,
      {
        'title': faqlist[x]['title'],
        'description': faqlist[x]['description'],
      }
    ];
  }

  return faq_List;
}

class FaqPage extends StatelessWidget {
  final List faqList = create_faq_list(faq_list);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Color(0Xff6949FF)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          height: 1512,
          width: double.infinity,
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: 300,
                    width: double.infinity,
                    color: blue_color,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                          child: Text(
                            'Foire aux Questions',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(25, 25, 0, 0),
                          child: Text(
                            'Recherchez des articles pour trouver votre r??ponse',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(30),
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(45)),
                                  borderSide: BorderSide.none),
                              hintText:
                                  "Ex: Comment dire ?? mon p??re gougniafier",
                              suffixIcon: Icon(Icons.search),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Text('Questions fr??quentes',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        color: Colors.white,
                        child: Column(
                          children: [
                            ExpansionTile(
                              tilePadding: EdgeInsets.all(10),
                              title: Text(
                                'Succession',
                                style: TextStyle(color: Colors.black),
                              ),
                              children: [
                                Column(
                                  children: [
                                    ExpansionTile(
                                      backgroundColor: Colors.black12,
                                      tilePadding:
                                          EdgeInsets.fromLTRB(30, 10, 0, 0),
                                      title: Text(
                                        "- Qu'est-ce que l'usufruit ?",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      children: [
                                        Container(
                                          color: Colors.black26,
                                          padding: EdgeInsets.all(20),
                                          width: double.infinity,
                                          child: Text(
                                            "L'usufruit est le droit d'occuper un bien sans en ??tre propri??taire.",
                                          ),
                                        ),
                                      ],
                                    ),
                                    ExpansionTile(
                                      backgroundColor: Colors.black12,
                                      tilePadding:
                                          EdgeInsets.fromLTRB(30, 10, 0, 0),
                                      title: Text(
                                        "- Qu'est-ce que la nue-propri??t?? ?",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      children: [
                                        Container(
                                          color: Colors.black26,
                                          padding: EdgeInsets.all(20),
                                          width: double.infinity,
                                          child: Text(
                                            "La nue-propri??t?? est un droit qui permet de disposer d'une chose mobili??re ou immobili??re.",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            ExpansionTile(
                              tilePadding: EdgeInsets.all(10),
                              title: Text(
                                'Vente',
                                style: TextStyle(color: Colors.black),
                              ),
                              children: [
                                Column(
                                  children: [
                                    ExpansionTile(
                                      backgroundColor: Colors.black12,
                                      tilePadding:
                                          EdgeInsets.fromLTRB(30, 10, 0, 0),
                                      title: Text(
                                        "- Comment se d??roule la signature du compromis de vente ?",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      children: [
                                        Container(
                                          color: Colors.black26,
                                          padding: EdgeInsets.all(20),
                                          width: double.infinity,
                                          child: Text(
                                            "Le compromis de vente est le premier document qui atteste juridiquement de l'accord de transaction immobili??re entre l'acheteur et le vendeur d'un bien immobilier.",
                                          ),
                                        ),
                                      ],
                                    ),
                                    ExpansionTile(
                                      backgroundColor: Colors.black12,
                                      tilePadding:
                                          EdgeInsets.fromLTRB(30, 10, 0, 0),
                                      title: Text(
                                        "- Combien co??te un compromis de vente ?",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      children: [
                                        Container(
                                          color: Colors.black26,
                                          padding: EdgeInsets.all(20),
                                          width: double.infinity,
                                          child: Text(
                                            "Le compromis de vente est r??dig?? par un cabinet notarial selon les indications qui lui ont ??t?? fournies par les parties prenantes ?? la transaction immobili??re.\nCe travail qui permet de s'assurer de la conformit?? juridique et l??gale des termes du document est r??mun??r??.\nSon tarif est d'environ 300 ??? qui sont pay??s par l'acheteur en m??me temps que les frais de notaire.",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            ExpansionTile(
                              tilePadding: EdgeInsets.all(10),
                              title: Text(
                                'Support Technique',
                                style: TextStyle(color: Colors.black),
                              ),
                              children: [
                                Column(
                                  children: [
                                    ExpansionTile(
                                      backgroundColor: Colors.black12,
                                      tilePadding:
                                          EdgeInsets.fromLTRB(30, 10, 0, 0),
                                      title: Text(
                                        "- Comment cr??er un compte notario ?",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      children: [
                                        Container(
                                          color: Colors.black26,
                                          padding: EdgeInsets.all(20),
                                          width: double.infinity,
                                          child: Text(
                                            "Cliquez sur l'icone profil et rentrez vos informations personnelles.",
                                          ),
                                        ),
                                      ],
                                    ),
                                    ExpansionTile(
                                      backgroundColor: Colors.black12,
                                      tilePadding:
                                          EdgeInsets.fromLTRB(30, 10, 0, 0),
                                      title: Text(
                                        "- Comment me connecter ?? mon compte ?",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      children: [
                                        Container(
                                          color: Colors.black26,
                                          padding: EdgeInsets.all(20),
                                          width: double.infinity,
                                          child: Text(
                                            "Cliquez sur l'icone profil, puis sur 'sign-in' et rentrez vos identifiants de connexion.",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 16,
                        bottom: 0,
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                child: Icon(Icons.chat),
                                onPressed: () {
                                  chats_list = Future(() => api_get_chats());
                                  chats_list.then((value) {
                                    chats_list = value;
                                    chat_List = create_chat_list(chats_list);
                                    chat_id = Future(() => api_get_chat(chat_List[0]['chat_id']));
                                    chat_id.then((value) {
                                      receiver_id = chat_List[0]['id_receiver'];
                                      chat_with_messages = value;
                                      all_messages = create_messages_list(chat_with_messages);
                                      print("Cr??ation de la liste des messages == OK");
                                      print(all_messages);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => ChatBox()),
                                      );
                                    });
                                  });
                                },
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ButtonNavBar(),
    );
  }
}

class faqCard extends StatelessWidget {
  final Map faqData;
  faqCard(this.faqData);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(
          backgroundColor: Colors.black12,
          tilePadding: EdgeInsets.fromLTRB(30, 10, 0, 0),
          title: Text(
            faqData['title'],
            style: TextStyle(color: Colors.black),
          ),
          children: [
            Container(
              color: Colors.black26,
              padding: EdgeInsets.all(20),
              width: double.infinity,
              child: Text(
                faqData['description'],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
