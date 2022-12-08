import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'delayed_animation.dart';
import 'main.dart';
import 'name_page.dart';

class WelcomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: 60,
            horizontal: 30,
          ),
          child: Column(
            children: [
              DelayedAnimation(
                delay: 200,
                child: Container(
                  height: 170,
                  child: Image.asset('images/notario.png'),
                )
              ),
              DelayedAnimation(
                delay: 300,
                child: Container(
                  height: 400,
                  child: Image.asset('images/shrek.jpeg'),
                )
              ),
              DelayedAnimation(
                delay: 500,
                child: Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: blue_color,
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: Text("S'inscrire", textScaleFactor: 1.5,),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NamePage()),
                      );
                    },
                  ),
                )
              ),
              DelayedAnimation(
                delay: 500,
                child: Container(
                  height: 400,
                  margin: EdgeInsets.only(
                    top: 30,
                    bottom: 20,
                  ),
                  child: Text(
                    "J'ai déjà un compte",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Color.fromARGB(255, 134, 133, 133),
                      fontSize: 16,
                    )
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
