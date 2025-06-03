import 'package:chat_me/widgets/custom_button.dart';
import 'package:chat_me/widgets/custom_search.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  static const String screenRoute = 'home_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, //show search bar
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 103, 185, 226),
        title: Container(
          padding: EdgeInsets.only(right: 10, bottom: 10),
          height: 60,
          child: Row(
            children: [
              Image.asset('images/logoWithBorder.png'),
              Text(
                'ChatMe',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
              ),
              Spacer(),
              Container(
                alignment: Alignment.center,
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: color2,
                ),
                child: IconButton(
                  onPressed: () {
                    showSearch(context: context, delegate: CustomSearch());
                  },
                  icon: Icon(Icons.search, size: 25, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 5, top: 5, bottom: 5),
        child: ListView(
          children: [
            SizedBox(
              height: 80,
              child: Card(
                child: ListTile(
                  leading: Image.asset('images/google.png'),
                  title: Text('Taha Sabry'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}