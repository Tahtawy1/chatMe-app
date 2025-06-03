import 'package:chat_me/views/views_body/verification_view_body.dart';
import 'package:flutter/material.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key});
  static const String screenRoute = 'email_verified_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VerificationViewBody()
    );
  }
}
