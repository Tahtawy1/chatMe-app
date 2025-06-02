import 'package:chat_me/views/chat_view.dart';
import 'package:chat_me/views/email_verified_view.dart';
import 'package:chat_me/views/log_in_screen.dart';
import 'package:chat_me/views/widgets/custom_button.dart';
import 'package:chat_me/views/widgets/custom_text.dart';
import 'package:chat_me/views/widgets/custom_text_field.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpScreen extends StatefulWidget {
  static const String screenRoute = 'sign_up_view';
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreen();
}

class _SignUpScreen extends State<SignUpScreen> {
  final _auth = FirebaseAuth.instance;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();

  bool isSpinner = false;
  AutovalidateMode autovalidate = AutovalidateMode.onUserInteraction;
  final GlobalKey<FormState> _keyForm = GlobalKey();

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
                height: 200,
                child: Image.asset('images/logo.png'),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: 340,
                child: Form(
                  key: _keyForm,
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: CustomText(
                          text: 'Name',
                          size: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      CustomTextField(
                        hintText: 'Enter your name',
                        keyboardType: TextInputType.text,
                        autovalidate: autovalidate,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'please enter your name';
                          }
                          return null;
                        },
                        controller: name,
                      ),
                      SizedBox(height: 14),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: CustomText(
                          text: 'Email adress',
                          size: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      CustomTextField(
                        hintText: 'Enter your email',
                        keyboardType: TextInputType.emailAddress,
                        autovalidate: autovalidate,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please enter your email';
                          }
                          if (!EmailValidator.validate(value!)) {
                            return 'Invalid email format';
                          }
                          return null;
                        },
                        controller: email,
                      ),
                      SizedBox(height: 14),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: CustomText(
                          text: 'Password',
                          size: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      CustomTextField(
                        hintText: 'Enter your password',
                        isPasswordField: true,
                        keyboardType: TextInputType.visiblePassword,
                        autovalidate: autovalidate,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please enter your password';
                          }
                          if (value!.length < 8) {
                            return 'Password must be at least 8 characters';
                          }
                          return null;
                        },
                        controller: password,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
              Text(
                'OR SIGN IN WITH',
                style: TextStyle(fontSize: 16, color: Colors.grey[400]),
              ),
              SizedBox(height: 5),
              IconButton(
                onPressed: () {},
                icon: FaIcon(FontAwesomeIcons.google, size: 36),
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    title: 'Sign up',
                    width: 150,
                    onPressed: () async {
                      print(email.text);
                      if (_keyForm.currentState!.validate()) {
                        _keyForm.currentState!.save();
                        try {
                          setState(() {
                            isSpinner = true;
                          });
                          final user = await _auth
                              .createUserWithEmailAndPassword(
                                email: email.text,
                                password: password.text,
                              );
                          await FirebaseAuth.instance.currentUser!.sendEmailVerification();
                          setState(() {
                            isSpinner = false;
                          });
                        } catch (e) {
                          print(e);
                        }
                      }
                        Navigator.pushReplacementNamed(
                          context,
                          EmailVerifiedView.screenRoute,
                        );
                    },
                  ),
                  SizedBox(width: 16),
                  CustomButton(
                    title: 'Login',
                    width: 150,
                    onPressed: () {
                      () => Navigator.pushNamed(context, 'log_view');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
