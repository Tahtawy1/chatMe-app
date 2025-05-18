import 'package:chat_me/views/chat_screen.dart';
import 'package:chat_me/views/edit_your_profile.dart';
import 'package:chat_me/views/sign_up_screen.dart';
import 'package:chat_me/views/log_in_screen.dart';
import 'package:chat_me/views/welcome_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(DevicePreview(enabled: !kReleaseMode, builder: (context) => MyApp()));
}

class MyApp extends StatelessWidget {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ChatMe app',
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      initialRoute:
          _auth.currentUser != null
              ? ChatScreen.screenRoute
              : WelcomeScreen.screenRoute,
      routes: {
        WelcomeScreen.screenRoute: (context) => WelcomeScreen(),
        LogInScreen.screenRoute: (context) => LogInScreen(),
        SignUpScreen.screenRoute: (context) => SignUpScreen(),
        ChatScreen.screenRoute: (context) => ChatScreen(),
        EditYourProfile.screenRoute: (context) => EditYourProfile(),
      },
    );
  }
}
