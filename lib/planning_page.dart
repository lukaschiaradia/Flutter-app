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
import 'package:intl/intl.dart';

List<dynamic> create_planning_list(List rdvList) {
  List<dynamic> planningList = [];
  for (int x = 0; x < rdvList.length; x++) {
    planningList = [
      ...planningList,
      {
        'title': rdvList[x]['name'],
        'date': DateFormat('dd/MM/yyyy')
            .format(DateTime.parse(rdvList[x]['begin'])),
        'time': DateFormat('HH:mm').format(DateTime.parse(rdvList[x]['begin'])),
        'description': rdvList[x]['description'],
      }
    ];
  }
  return planningList;
}

class Planning extends StatelessWidget {
  final List rdvList = create_planning_list(rdv_list);
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
          child: Text('Mes rendez-vous',
              style: TextStyle(
                  fontSize: 30,
                  color: Color(0Xff6949FF),
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold)),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          color: Colors.white,
          child: Column(
            children: [
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
      margin: EdgeInsets.all(15),
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
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    )),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 25, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(rdvData['title'],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 40, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(rdvData['description'],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    )),
              ],
            ),
          )
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
