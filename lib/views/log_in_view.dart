import 'package:chat_me/views/views_body/log_in_view_body.dart';
import 'package:flutter/material.dart';

class LogInView extends StatelessWidget {
  static const String screenRoute = 'log_in_view';
  const LogInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LogInViewBody()
    );
  }
}