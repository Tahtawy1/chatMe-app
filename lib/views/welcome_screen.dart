import 'package:chat_me/views/widgets/welcome_view_body.dart';
import 'package:flutter/material.dart';

class WelcomeView extends StatelessWidget {
  static const String screenRoute = 'welcome_screen';
  const WelcomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WelcomeViewBody(),
    );
  }
}