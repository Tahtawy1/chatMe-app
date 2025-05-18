import 'package:chat_me/views/log_in_screen.dart';
import 'package:chat_me/views/sign_up_screen.dart';
import 'package:chat_me/views/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeViewBody extends StatelessWidget {
  const WelcomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to ',
              style: TextStyle(color: Colors.black, fontSize: 26),
            ),
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
            Text('app!', style: TextStyle(color: Colors.black, fontSize: 26)),
          ],
        ),
        SizedBox(height: 5),
        Text(
          'Start chatting with your friends now. 💬!',
          style: TextStyle(color: Colors.black, fontSize: 19),
        ),
        SizedBox(height: 15),
        PhysicalModel(
          shape: BoxShape.circle,
          color: Colors.transparent,
          elevation: 50,
          shadowColor: Colors.black,
          borderRadius: BorderRadius.circular(100),
          child: SizedBox(
            height: 500,
            child: Image.asset('images/Maket.png'),
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Get Started',
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'JosefinSans',
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 10),
        MyButton(
          title: 'Log in',
          onPressed:
              () => Navigator.pushReplacementNamed(
                context,
                LogInScreen.screenRoute,
              ),
        ),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(30),
          ),
          child: MaterialButton(
            elevation: 5,
            onPressed: () async {
              SharedPreferences sharedPreferences =
                  await SharedPreferences.getInstance();
              await sharedPreferences.setBool('isFirstTime', false);
              Navigator.pushReplacementNamed(
                context,
                SignUpScreen.screenRoute,
              );
            },
            minWidth: 200,
            height: 38,
            child: Text(
              'Sign up',
              style: TextStyle(fontSize: 18, fontFamily: 'JosefinSans'),
            ),
          ),
        ),
      ],
    );
  }
}
