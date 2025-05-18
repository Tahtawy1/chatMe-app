import 'package:flutter/material.dart';

Color color1 = const Color.fromARGB(255, 103, 185, 226);
Color color2 = const Color.fromARGB(255, 115, 237, 180);
class MyButton extends StatelessWidget {
  const MyButton({super.key , required this.title, required this.onPressed});
  final String title;
  final VoidCallback onPressed;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [color1, color2]),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.black)
      ),
      child: MaterialButton(
      elevation: 5,
      onPressed: onPressed,
      minWidth: 220,
      height: 40,
        child: Text(title, style: TextStyle(fontSize: 20, fontFamily: 'JosefinSans'),),),);
  }
}
