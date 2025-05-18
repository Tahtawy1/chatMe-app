import 'package:chat_me/views/edit_your_profile.dart';
import 'package:chat_me/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpScreen extends StatefulWidget {
  static const String screenRoute = 'registration_screen';
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreen();
}

class _SignUpScreen extends State<SignUpScreen> {
  final _auth = FirebaseAuth.instance;
  late String name;
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
                height: 300,
                child: Image.asset('images/logo.png'),
              ),
              SizedBox(height: 30),
              SizedBox(height: 10),
              SizedBox(
                width: 340,
                child: TextField(
                  onChanged: (value) {
                    name = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Enter your name',
                    labelStyle: TextStyle(fontSize: 16, fontFamily: 'JosefinSans', fontWeight: FontWeight.w800 ),
                    border: UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 103, 185, 226),
                        width: 2,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 115, 237, 180),
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 340,
                child: TextField(
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Enter your email',
                    labelStyle: TextStyle(fontSize: 16, fontFamily: 'JosefinSans', fontWeight: FontWeight.w800 ),
                    border: UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 103, 185, 226),
                        width: 2,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 115, 237, 180),
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: 340,
                child: TextField(
                  obscureText: true,
                  cursorHeight: 20,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    labelText: 'Enter your password',
                    labelStyle: TextStyle(fontSize: 16, fontFamily: 'JosefinSans', fontWeight: FontWeight.w800 ),
                    border: UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 103, 185, 226),
                        width: 2,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 115, 237, 180),
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              MyButton(
                // color: const Color.fromARGB(255, 115, 237, 180),
                title: 'Register',
                onPressed: () async {
                  try {
                    setState(() {
                      isSpinner = true;
                    });
                    final newUser = await _auth.createUserWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                    setState(() {
                      isSpinner = false;
                    });
                    Navigator.pushReplacementNamed(context, EditYourProfile.screenRoute);
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
