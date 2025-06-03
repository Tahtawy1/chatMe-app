import 'package:chat_me/views/chat_view.dart';
import 'package:chat_me/views/edit_your_profile.dart';
import 'package:chat_me/views/home_view.dart';
import 'package:chat_me/views/sign_up_view.dart';
import 'package:chat_me/views/log_in_view.dart';
import 'package:chat_me/views/verification_view.dart';
import 'package:chat_me/views/welcome_view.dart';
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
          isFirstTime ? 'sign_up_view' : 'chat_view',
      routes: {
        'welcome_view': (context) => WelcomeView(),
        'log_in_view': (context) => LogInView(),
        'sign_up_view': (context) => SignUpView(),
        'chat_view': (context) => ChatView(),
        'edit_your_profile': (context) => EditYourProfile(),
        'email_verified_view': (context) => VerificationView(),
        'home_view': (context) => HomeView(), 
      },
    );
  }
}