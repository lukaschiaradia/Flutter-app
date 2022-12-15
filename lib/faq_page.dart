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
                            'Recherchez des articles pour trouver votre réponse',
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
                                  "Ex: Comment dire à mon père gougniafier",
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
                          child: Text('Questions fréquentes',
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
                                            "L'usufruit est le droit d'occuper un bien sans en être propriétaire.",
                                          ),
                                        ),
                                      ],
                                    ),
                                    ExpansionTile(
                                      backgroundColor: Colors.black12,
                                      tilePadding:
                                          EdgeInsets.fromLTRB(30, 10, 0, 0),
                                      title: Text(
                                        "- Qu'est-ce que la nue-propriété ?",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      children: [
                                        Container(
                                          color: Colors.black26,
                                          padding: EdgeInsets.all(20),
                                          width: double.infinity,
                                          child: Text(
                                            "La nue-propriété est un droit qui permet de disposer d'une chose mobilière ou immobilière.",
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
                                        "- Comment se déroule la signature du compromis de vente ?",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      children: [
                                        Container(
                                          color: Colors.black26,
                                          padding: EdgeInsets.all(20),
                                          width: double.infinity,
                                          child: Text(
                                            "Le compromis de vente est le premier document qui atteste juridiquement de l'accord de transaction immobilière entre l'acheteur et le vendeur d'un bien immobilier.",
                                          ),
                                        ),
                                      ],
                                    ),
                                    ExpansionTile(
                                      backgroundColor: Colors.black12,
                                      tilePadding:
                                          EdgeInsets.fromLTRB(30, 10, 0, 0),
                                      title: Text(
                                        "- Combien coûte un compromis de vente ?",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      children: [
                                        Container(
                                          color: Colors.black26,
                                          padding: EdgeInsets.all(20),
                                          width: double.infinity,
                                          child: Text(
                                            "Le compromis de vente est rédigé par un cabinet notarial selon les indications qui lui ont été fournies par les parties prenantes à la transaction immobilière.\nCe travail qui permet de s'assurer de la conformité juridique et légale des termes du document est rémunéré.\nSon tarif est d'environ 300 € qui sont payés par l'acheteur en même temps que les frais de notaire.",
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
                                        "- Comment créer un compte notario ?",
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
                                        "- Comment me connecter à mon compte ?",
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ChatBox()),
                                  );
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
