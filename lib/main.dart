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
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  bool isFirstTime = sharedPreferences.getBool('isFirstTime') ?? true;
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(isFirstTime: isFirstTime),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool isFirstTime;
  const MyApp({super.key, required this.isFirstTime});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      title: 'ChatMe app',
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      initialRoute:
          isFirstTime ? WelcomeView.screenRoute : ChatScreen.screenRoute,
      routes: {
        WelcomeView.screenRoute: (context) => WelcomeView(),
        LogInScreen.screenRoute: (context) => LogInScreen(),
        SignUpScreen.screenRoute: (context) => SignUpScreen(),
        ChatScreen.screenRoute: (context) => ChatScreen(),
        EditYourProfile.screenRoute: (context) => EditYourProfile(),
      },
    );
  }
}
