import 'package:chat_me/views/chat_view.dart';
import 'package:chat_me/views/email_verified_view.dart';
import 'package:chat_me/views/sign_up_screen.dart';
import 'package:chat_me/views/widgets/custom_button.dart';
import 'package:chat_me/views/widgets/custom_text.dart';
import 'package:chat_me/views/widgets/custom_text_field.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LogInScreen extends StatefulWidget {
  static const String screenRoute = 'log_in_view';
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreen();
}

class _LogInScreen extends State<LogInScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  final _auth = FirebaseAuth.instance;
  String? errMessage;
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
                        // onSaved: (value) {
                        //   email = value!;
                        // },
                        controller: email,
                      ),
                      if (errMessage != null)
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                errMessage!,
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
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
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot password?',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
              Text(
                'OR LOGIN WITH',
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
                    title: 'Log in',
                    width: 150,
                    onPressed: () async {
                      if (_keyForm.currentState!.validate()) {
                        try {
                          setState(() {
                            isSpinner = true;
                          });
                          final credential = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                email: email.text,
                                password: password.text,
                              );
                          setState(() {
                            isSpinner = false;
                            errMessage = null;
                          });
                          FirebaseAuth.instance.currentUser!.emailVerified
                              ? Navigator.pushNamed(context, 'chat_view')
                              : Navigator.pushNamed(context, 'email_verified_view');
                        } on FirebaseAuthException catch (e) {
                          String message =
                              'Incorrect email or password. Please try again';
                          setState(() {
                            isSpinner = false;
                            errMessage = message;
                          });
                        }
                      }
                    },
                  ),
                  SizedBox(width: 16),
                  CustomButton(
                    title: 'Sign up',
                    width: 150,
                    onPressed:
                        () => Navigator.pushNamed(
                          context,
                          SignUpScreen.screenRoute,
                        ),
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
