import 'package:chat_me/views/chat_screen.dart';
import 'package:chat_me/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LogInScreen extends StatefulWidget {
  static const String screenRoute = 'log_in_screen';
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreen();
}

class _LogInScreen extends State<LogInScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  bool isSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: isSpinner,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                height: 250,
                child: Image.asset('images/logo.png'),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: 340,
                child: TextField(
                  cursorHeight: 20,
                  onChanged: (value) {
                    email = value;
                  },
                  style: TextStyle(fontSize: 20, color: Colors.black),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    labelText: 'Enter your email',
                    labelStyle: TextStyle(fontSize: 16, fontFamily: 'JosefinSans', fontWeight: FontWeight.w800),
                    border: UnderlineInputBorder(
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 115, 237, 180),
                        width: 2,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 103, 185, 226),
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              SizedBox(
                width: 340,
                child: TextField(
                  obscureText: true,
                  cursorHeight: 20,
                  onChanged: (value) {
                    password = value;
                  },
                  style: TextStyle(fontSize: 20, color: Colors.black),
                  decoration: InputDecoration(
                    
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    labelText: 'Enter your password',
                    labelStyle: TextStyle(fontSize: 16, fontFamily: 'JosefinSans', fontWeight: FontWeight.w800 ),
                    border: UnderlineInputBorder(
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 115, 237, 180),
                        width: 2,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 103, 185, 226),
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              MyButton(
                title: 'Login',
                onPressed: () async {
                  try {
                    setState(() {
                      isSpinner = true;
                    });
                    final user = await _auth.createUserWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                    setState(() {
                      isSpinner = false;
                    });
                    Navigator.pushNamed(context, ChatScreen.screenRoute);
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
