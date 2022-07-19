import 'package:flutter/material.dart';
import 'package:ema_app/widgets/drawer.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("E M A"),
      ),
      body: Container(
        child: Column(
          children: [
            
      Image.asset(
                  "assets/images/logo.jpg",
                  fit: BoxFit.cover,
                ),
            
          ],
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
