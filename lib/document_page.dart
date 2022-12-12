import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'delayed_animation.dart';
import 'main.dart';
import 'package:open_file/open_file.dart';
import 'package:file_picker/file_picker.dart';

class DocumentPage extends StatefulWidget {
  const DocumentPage();

  @override
  _DocumentPageState createState() => _DocumentPageState();
}

class _DocumentPageState extends State<DocumentPage> {

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyStatefulWidget(),
      bottomNavigationBar: BottomNavigationBar(
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
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class Document extends StatefulWidget {
  const Document();

  @override
  _DocumentState createState() => _DocumentState();
}

class _DocumentState extends State<Document> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        children: [
          DelayedAnimation(
                delay: 200,
                child: Container(
                  height: 100,
                  margin: EdgeInsets.only(
                    top: 100,
                    bottom: 0,
                  ),
                  child: Text(
                    "Mes Documents",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 30,
                      color: blue_color,
                    )
                  ),
                ),
          ),
          MyStatefulWidget(),
        ],
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final ScrollController _controllerOne = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: _controllerOne,
      thumbVisibility: true,
      child: GridView.builder(
        controller: _controllerOne,
        itemCount: 9,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Center(
             child: Column(
            children: [
            DelayedAnimation(
                delay: 300,
                child: Container(
                  margin: EdgeInsets.only(
                    top: 50,
                    bottom: 0,
                  ),
                  height: 90,
                  child: Image.asset('images/pdf.png'),
                )
              ),
            ],
             ),
          );
        },
      ),
    );
  }
}

void openFile(PlatformFile file) {
  OpenFile.open(file.path);
}