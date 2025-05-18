import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

late User signedInUser; // This will give us the email

class ChatScreen extends StatefulWidget {
  static const String screenRoute = 'chat_screen';
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreen();
}

class _ChatScreen extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  String? messageText; // This will give us the message
  final fieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        signedInUser = user;
        print(signedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 103, 185, 226),
        title: Container(
          padding: EdgeInsets.only(right: 10),
          height: 60,
          child: Row(
            children: [
              Image.asset('images/logoWithBorder.png'),
              Text(
                'ChatMe',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _auth.signOut();
              Navigator.pop(context);
            },
            icon: Icon(Icons.close, color: Colors.black),
          ),
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset('images/layer.jpg', fit: BoxFit.cover),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MessageStreem(firestore: _firestore),

                Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 300,
                        child: TextField(
                          controller: fieldController,
                          onChanged: (value) {
                            messageText = value;
                          },
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            fillColor: Color.fromARGB(255, 103, 185, 226),
                            filled: true,
                            hintText: 'Message',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: BorderSide(
                                color: const Color.fromARGB(255, 103, 185, 226),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: BorderSide(
                                color: const Color.fromARGB(255, 103, 185, 226),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 103, 185, 226),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: IconButton(
                          onPressed: () {
                            fieldController.clear();
                            _firestore.collection('message').add({
                              'sender': signedInUser.email,
                              'text': messageText,
                              'time': FieldValue.serverTimestamp(),
                            });
                          },
                          icon: Icon(Icons.send_rounded, size: 25),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MessageStreem extends StatelessWidget {
  const MessageStreem({super.key, required FirebaseFirestore firestore})
    : _firestore = firestore;

  final FirebaseFirestore _firestore;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('message').orderBy('time').snapshots(),
      builder: (context, snapshot) {
        List<MessageLine> messageWidgits = [];

        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        final messages = snapshot.data!.docs.reversed;
        for (var message in messages) {
          final messageText = message.get('text');
          final messageSender = message.get('sender');
          final currentUser = signedInUser.email;
          messageWidgits.add(
            MessageLine(
              sender: messageSender,
              text: messageText,
              isMe: currentUser == messageSender,
            ),
          );
        }

        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            children: messageWidgits,
          ),
        );
      },
    );
  }
}

class messageStreem extends StatelessWidget {
  const messageStreem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class MessageLine extends StatelessWidget {
  const MessageLine({super.key, this.text, this.sender, required this.isMe});
  final String? text;
  final String? sender;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            '$sender',
            style: TextStyle(color: Colors.black45, fontSize: 12),
          ),
          Material(
            borderRadius: BorderRadius.only(
              topRight: isMe ? Radius.circular(0) : Radius.circular(25),
              topLeft: isMe ? Radius.circular(25) : Radius.circular(0),
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25),
            ),
            elevation: 2,
            color:
                isMe ? const Color.fromARGB(255, 115, 237, 180) : Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: Text('$text', style: TextStyle(fontSize: 15)),
            ),
          ),
        ],
      ),
    );
  }
}
