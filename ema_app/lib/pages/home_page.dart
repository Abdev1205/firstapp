import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("E M A"),
      ),
      body: Center(
        child: Container(child: Text("Hi Myself Abhay Mishra, I am App Devloper")),
      ),
      drawer: Drawer(),
    );
  }
}
