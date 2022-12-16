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

class DocumentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Color(0Xff6949FF)),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 5.0),
          child: Text('Mes documents',
              style: TextStyle(
                  fontSize: 30,
                  color: Color(0Xff6949FF),
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold)),
        ),
      ),
      body: SingleChildScrollView(
        child: Wrap(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(60, 0, 55, 0),
              child: Wrap(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(45)),
                            borderSide: BorderSide.none),
                        hintText: "Ex: Rechercher un document",
                        suffixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Wrap(
              spacing: 30,
              runSpacing: 30,
              children: [
                Container(alignment: Alignment.center, child: pdfCard())
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: ButtonNavBar(),
    );
  }
}

class pdfCard extends StatelessWidget {
  final List pdfList = [
    {'title': 'Acte de vente', 'path': 'images/pdf.png'},
    {'title': 'Contrat de mariage', 'path': 'images/pdf.png'},
    {'title': 'Promesse d\'achat', 'path': 'images/pdf.png'},
    {'title': 'Inventaire de bien', 'path': 'images/pdf.png'},
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> containers = [];
    for (int i = 0; i < pdfList.length; i++) {
      containers.add(
        Container(
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 30, 0, 30),
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Center(
              child: Container(
                height: 60,
                margin: EdgeInsets.fromLTRB(20, 10, 20, 30),
                child: InkWell(
                  child: Wrap(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: ImageIcon(
                          size: 50,
                          AssetImage(pdfList[i]['path']),
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
                        child: Text(
                          pdfList[i]['title'],
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    OpenFile.open("images/zebi.pdf");
                  },
                ),
              ),
            ),
          ),
        ),
      );
    }
    return Column(
      children: containers,
    );
  }
}
