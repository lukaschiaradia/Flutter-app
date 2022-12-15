
import 'package:flutter/material.dart';

class ChatBox extends StatefulWidget {
  @override
  _ChatBoxState createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
                    alignment: Alignment.bottomRight,
                    padding: EdgeInsets.only(left: 30, right: 70),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(45)),
                            borderSide: BorderSide.none),
                        labelText: "Chat",
                        hintText: "Envoyez un message",
                        suffixIcon: Icon(Icons.send),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
      ),
    );
  }
}
          