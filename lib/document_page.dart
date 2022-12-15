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
  final List pdfList = [
    {
      'title': 'Example',
    },
    {
      'title': 'Example',
    },
    {
      'title': 'Example',
    },
    {
      'title': 'Example',
    },
  ];
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
        child: Container(
          padding: EdgeInsets.all(10),
          color: Colors.white,
          child: Column(
            children: [
              Column(
                children: pdfList.map((pdf) {
                  return pdfCard(pdf);
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

class pdfCard extends StatelessWidget {
  final Map pdfData;
  final ScrollController _controllerOne = ScrollController();
  pdfCard(this.pdfData);
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: _controllerOne,
      thumbVisibility: true,
      child: GridView.builder(
        controller: _controllerOne,
        itemCount: 1,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: Container(
                margin: EdgeInsets.fromLTRB(10, 30, 10, 30),
                height: 150,
                width: 150,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
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
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ImageIcon(
                            size: 80,
                            AssetImage("images/pdf.png"),
                            color: Colors.black,
                          ),
                          Text(
                            "pdfData['title']",
                            style: GoogleFonts.roboto(
                                fontSize: 10, color: Colors.black),
                          ),
                        ],
                      ),
                      onTap: () {
                        OpenFile.open("images/zebi.pdf");
                      },
                    ),
                  ),
                )),
          );
        },
      ),
    );
  }
}
