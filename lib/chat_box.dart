import 'package:flutter/material.dart';

class ChatBox extends StatefulWidget {
  @override
  _ChatBoxState createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  final TextEditingController _textController = TextEditingController();
  final List<String> _messages = [];
  final List<String> _messages2 = [];
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Column(
//        mainAxisAlignment: MainAxisAlignment.end,
//        children: [
//          ListView.builder(
//            itemBuilder: (context, index) => Text(_messages[index]),
//            itemCount: _messages.length,
//            reverse: true,
//            shrinkWrap: true,
//          ),
//          Padding(
//            padding: EdgeInsets.all(50),
//            child: TextField(
//                decoration: InputDecoration(
//                  filled: true,
//                  fillColor: Colors.white,
//                  border: OutlineInputBorder(
//                      borderRadius: BorderRadius.all(Radius.circular(45)),
//                      borderSide: BorderSide.none),
//                  labelText: "Chat",
//                  hintText: "Envoyez un message",
//                  suffixIcon: Icon(Icons.send),
//                ),
//                keyboardType: TextInputType.text,
//                controller: _textController,
//                onSubmitted: (String text) {
//                  _messages.add(text);
//                  _textController.clear();
//                }
//                ),
//          ),
//                floatingActionButton: FloatingActionButton(
//        ],
//      ),
//    );
//  }
//}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0Xff6949FF)),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 5.0),
          child: Text('Discussion',
              style: TextStyle(
                  fontSize: 30,
                  color: Color(0Xff6949FF),
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold)),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) =>
                  Text('Vous:\n    ' + _messages[index]),
              itemCount: _messages.length,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
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
              controller: _textController,
              onSubmitted: (text) {
                setState(
                  () {
                    _messages.add(text);
                    _textController.clear();
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            final String text = _textController.text;
            _messages.add(text);
            _textController.clear();
          });
        },
        child: Icon(Icons.send),
      ),
    );
  }
}
