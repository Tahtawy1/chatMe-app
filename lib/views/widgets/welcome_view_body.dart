import 'package:chat_me/views/log_in_screen.dart';
import 'package:chat_me/views/widgets/custom_button.dart';
import 'package:chat_me/views/widgets/custom_text.dart';
import 'package:chat_me/views/widgets/phone_maket.dart';
import 'package:flutter/material.dart';

class WelcomeViewBody extends StatelessWidget {
  const WelcomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(text: 'Welcome to ', size: 26, fontWeight: FontWeight.normal,),
            Text(
              'ChatMe ',
              style: TextStyle(
                color: color2,
                fontSize: 30,
                fontFamily: 'JosefinSans',
                fontWeight: FontWeight.bold,
                shadows: [Shadow(color: Colors.black, offset: Offset(2, 3))],
              ),
            ),
            CustomText(text: 'app!', size: 26, fontWeight: FontWeight.normal,),
          ],
        ),
        SizedBox(height: 5),
        CustomText(text: 'Start chatting with your friends now. 💬!', size: 19, fontWeight: FontWeight.normal,),
        SizedBox(height: 15),
        PhoneMaket(),
        SizedBox(height: 10),
        CustomText(text: 'Get Started', size: 24, fontWeight: FontWeight.bold,),
        SizedBox(height: 10),
        CustomButton(
          title: 'Log in',
          onPressed:
              () => Navigator.pushReplacementNamed(
                context,
                LogInScreen.screenRoute,
              ),
        ),
        SizedBox(height: 10),
        CustomButton(
          title: 'Sign up',
          width: 200,
          onPressed:
            () => Navigator.pushReplacementNamed(
              context,
              LogInScreen.screenRoute,
          ),
        ),
      ],
    );
  }
}