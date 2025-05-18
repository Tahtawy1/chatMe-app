import 'package:flutter/material.dart';

class PhoneMaket extends StatelessWidget {
  const PhoneMaket({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      shape: BoxShape.circle,
      color: Colors.transparent,
      elevation: 50,
      shadowColor: Colors.black,
      borderRadius: BorderRadius.circular(100),
      child: SizedBox(
        height: 500,
        child: Image.asset('images/Maket.png'),
      ),
    );
  }
}
