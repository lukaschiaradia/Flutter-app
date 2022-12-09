import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'delayed_animation.dart';
import 'main.dart';
import 'name_page.dart';

class PasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DelayedAnimation(
                delay: 200,
                child: Container(
                  height: 100,
                  margin: EdgeInsets.only(
                    top: 40,
                    bottom: 0,
                  ),
                  child: Text(
                    "Entrez votre mot de passe",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize:25,
                    )
                  ),
                ),
            ),
            SizedBox(height: 35),
            PasswordForm(),
            SizedBox(height: 35),
            DelayedAnimation(
                delay: 300,
                child: Container(
                  height: 50,
                  margin: EdgeInsets.only(
                    top: 0,
                    bottom: 100,
                  ),
                  child: Image.asset(
                    "images/progression4.png",
                  ),
                ),
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
                    child: Text("Continuer", textScaleFactor: 1.5,),
                    onPressed: () {},
                  ),
                )
              ),
          ],
        ),
      )
    );
  }
}

class PasswordForm extends StatefulWidget {
  const PasswordForm();

  @override
  _PasswordFormState createState() => _PasswordFormState();
}

class _PasswordFormState extends State<PasswordForm> {
  var _obscureText1 = true;
  var _obscureText2 = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        children: [
          SizedBox(height: 30),
            DelayedAnimation(
              delay: 300,
              child: TextField(
                obscureText: _obscureText1,
                decoration: InputDecoration(
                  labelText: 'Mot de passe',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText1 == false ? Icons.visibility_off : Icons.visibility,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText1 = !_obscureText1;
                      });
                      }
                  ),
                ),
              )
            ),
            SizedBox(height: 30),
            DelayedAnimation(
              delay: 300,
              child: Container(
                margin: EdgeInsets.only(
                  top: 0,
                  bottom: 130,
                ),
                child: TextField(
                  obscureText: _obscureText2,
                  decoration: InputDecoration(
                    labelText: 'Confirmer le mot de passe',
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText2 == false ? Icons.visibility_off : Icons.visibility,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText2 = !_obscureText2;
                        });
                      },
                    ),
                  ),
                )
              )
            ),
        ],
      ),
    );
  }
}