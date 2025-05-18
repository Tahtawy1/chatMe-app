import 'package:chat_me/views/widgets/my_button.dart';
import 'package:flutter/material.dart';

class EditYourProfile extends StatefulWidget {
  static const String screenRoute = 'EditYourProfile';

  @override
  State<EditYourProfile> createState() => _EditYourProfileState();
}

class _EditYourProfileState extends State<EditYourProfile> {
  String username = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            height: 300,
            child: Image.asset('images/logo.jpg'),
          ),
          SizedBox(height: 10),
          SizedBox(
            width: 300,
            child: TextField(
              onChanged: (value) {
                username = value;
              },
              style: TextStyle(fontSize: 18, fontFamily: 'JosefinSans'),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Enter your name',
                hintStyle: TextStyle(
                  fontFamily: 'JosefinSans',
                  color: Colors.black26,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(0),
                    topLeft: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 103, 185, 226),
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(0),
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 115, 237, 180),
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          MaterialButton(
            onPressed: () {},
            child: Container(
              height: 55,
              width: 250,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [color1, color2],),
              ),
            ),
          ),
          // MyButton(color: Color.lerp(color1, color2, mix)!, title: 'Continue', onPressed: ()=> ChatScreen.screenRoute),
        ],
      ),
    );
  }
}
