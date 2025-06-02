import 'package:chat_me/views/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class EmailVerifiedView extends StatefulWidget {
  const EmailVerifiedView({super.key});
  static const String screenRoute = 'email_verified_view';
  @override
  State<EmailVerifiedView> createState() => _EmailVerifiedViewState();
}

class _EmailVerifiedViewState extends State<EmailVerifiedView> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    bool isSpinner = false;
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: isSpinner,
        child: Container(
          padding: EdgeInsets.all(22),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [color1, color2]),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 100),
              Text(
                'Verification email sent',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Text(
                'Check your email & click the link to activate your account',
                style: TextStyle(fontSize: 17),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 82),
              SizedBox(
                height: 200,
                child: Image.asset('images/paper-plane.png'),
              ),
              Spacer(),
              SizedBox(height: 14),
              MaterialButton(
                height: 40,
                minWidth: 220,
                color: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'JosefinSans',
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    isSpinner = true;
                  });
                  user?.reload();
                  if (FirebaseAuth.instance.currentUser!.emailVerified) {
                    setState(() {
                      isSpinner = false;
                    });
                    Navigator.pushReplacementNamed(context, 'chat_view');
                  }
                },
              ),
              SizedBox(height: 36),
              TextButton(
                onPressed: () async {
                  await user?.sendEmailVerification();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Container(height: 30, child:  Text('Verification email resent.')),
                  ));
                },
                child: Text('Resend email'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}