import 'package:chat_me/views/views_body/sign_up_view_body.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  static const String screenRoute = 'sign_up_view';
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor: Colors.white,
      body: SignUpViewBody()
    );
  }
}