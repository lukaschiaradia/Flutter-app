import 'package:Notario/faq_page.dart';
import 'package:Notario/main.dart';
import 'package:flutter/material.dart';
import 'api.dart';


class ChatBox extends StatefulWidget {
  @override
  _ChatBoxState createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  final TextEditingController _textController = TextEditingController();
  final List<String> _messages = [];
  final List<String> _messages2 = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FaqPage()),
            );
          },
        ),
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
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Column(
          children: [
            Display_chat(),
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
                      api_add_message(receiver: receiver_id, message: text);
                      _textController.clear();
                      chats_list = Future(() => api_get_chats());
                      chats_list.then((value) {
                        chats_list = value;
                        chat_List = create_chat_list(chats_list);
                        chat_id = Future(() => api_get_chat(chat_List[0]['chat_id']));
                        chat_id.then((value) {
                          receiver_id = chat_List[0]['id_receiver'];
                          chat_with_messages = value;
                          all_messages = create_messages_list(chat_with_messages);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ChatBox()),
                          );
                        });
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            final String text = _textController.text;
            api_add_message(receiver: receiver_id, message: text);
            _textController.clear();
            chats_list = Future(() => api_get_chats());
            chats_list.then((value) {
              chats_list = value;
              chat_List = create_chat_list(chats_list);
              chat_id = Future(() => api_get_chat(chat_List[0]['chat_id']));
              chat_id.then((value) {
                receiver_id = chat_List[0]['id_receiver'];
                chat_with_messages = value;
                all_messages = create_messages_list(chat_with_messages);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatBox()),
              );
              });
            });
          });
        },
        child: Icon(Icons.send),
      ),
    );
  }
}

class Display_chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) =>
                    Row(
                        mainAxisAlignment: user_id == all_messages[index]['sender'] ? MainAxisAlignment.end : MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 200,
                          decoration: BoxDecoration(
                            color: user_id == all_messages[index]['sender'] ? blue_color : Color.fromARGB(255, 216, 216, 216),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          margin: EdgeInsets.all(10),
                          child: Container(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              all_messages[index]['message'],
                              style: TextStyle(
                                fontSize: 20,
                                color: user_id == all_messages[index]['sender'] ? Color.fromARGB(255, 255, 255, 255) : Color.fromARGB(255, 0, 0, 0)
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                itemCount: all_messages.length,
              ),
            );
}
}

