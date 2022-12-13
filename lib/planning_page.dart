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

class Planning extends StatelessWidget {
  final List rdvList = [
    {
      'title': 'Signature Acte de Vente',
      'date': '22/11/2022',
      'time': '10:30',
    },
    {
      'title': 'Remplir contrat de mariage',
      'date': '05/01/2023',
      'time': '14:00',
    },
    {
      'title': 'Signature du testament',
      'date': '19/01/2023',
      'time': '08:45',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          color: Colors.white,
          child: Column(
            children: [
              Container(
                color: Colors.white,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Mes rendez-vous',
                      style: TextStyle(
                        fontSize: 30,
                        color: blue_color,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: rdvList.map((rdv) {
                  return rdvCard(rdv);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ButtonNavBar(),
    );
  }
}

class rdvCard extends StatelessWidget {
  final Map rdvData;
  rdvCard(this.rdvData);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 230,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0Xff313131),
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
      child: Column(
        children: [
          Container(
            height: 60,
            decoration: BoxDecoration(
              color: blue_color,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18), topRight: Radius.circular(18)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ImageIcon(
                  size: 30,
                  AssetImage("images/planning-white.png"),
                  color: Colors.white,
                ),
                Text(rdvData['date'],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    )),
                ImageIcon(
                  size: 30,
                  AssetImage("images/time.png"),
                  color: Colors.white,
                ),
                Text(rdvData['time'],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    )),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 60, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(rdvData['title'],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PlanningPage extends StatefulWidget {
  const PlanningPage();

  @override
  PlanningPageState createState() => PlanningPageState();
}

class PlanningPageState extends State<PlanningPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
