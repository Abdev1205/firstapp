// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: 60.0,
          ),
          Image.asset(
            "assets/images/login.png",
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "Welcome To E M A",
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 32.0,
            ),
            child: Column(children: [
              TextFormField(
                  decoration: InputDecoration(
                hintText: "Enter Your Phone Number",
                labelText: "Phone Number",
              )),
              TextFormField(
                  decoration: InputDecoration(
                hintText: "Enter Your Name",
                labelText: "Name",
              )),
              SizedBox(
                height: 30.0,
              ),
              ElevatedButton(
                  child: Text("Login"),
                  style: TextButton.styleFrom(),
                  onPressed: () {
                    print("all working");
                  }),
            ]),
          )
        ],
      ),
    );
  }
}
