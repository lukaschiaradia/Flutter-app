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

class FaqPage extends StatelessWidget {
  final List faqList = [
    {
      'title': 'Comment prendre un rendez-vous ?',
      'description': 'Lorem ipsum el pinco del crabejo',
    },
    {
      'title': 'Comment prendre un rendez-vous ?',
      'description': 'Lorem ipsum el pinco del crabejo',
    },
    {
      'title': 'Comment prendre un rendez-vous ?',
      'description': 'Lorem ipsum el pinco del crabejo',
    },
  ];
  @override
  Widget build(BuildContext contex) {
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
          child: Column(
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
                          hintText: "Ex: Comment dire à mon père gougniafier",
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
              Container(
                padding: EdgeInsets.all(10),
                color: Colors.white,
                child: Column(
                  children: [
                    Column(
                      children: faqList.map((faq) {
                        return faqCard(faq);
                      }).toList(),
                    ),
                  ],
                ),
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
          tilePadding: EdgeInsets.all(10),
          title: Text(
            faqData['title'],
            style: TextStyle(color: Colors.black),
          ),
          children: [
            Container(
              color: Colors.black12,
              padding: EdgeInsets.all(20),
              width: double.infinity,
              child: Text(faqData['description']),
            ),
          ],
        ),
      ],
    );
  }
}
