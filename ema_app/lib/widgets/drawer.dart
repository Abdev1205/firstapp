import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ema_app/utilis/route.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  accountName: Text("Emergency Medical Alert"),
                  accountEmail: Text("abhaym1205@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/logo.jpg"),
                  ),
                )),
                ListTile(
                  leading: Icon(
                  CupertinoIcons.house_fill,
                  color: Colors.black,),
                  title: Text("Home",style: TextStyle(color: Colors.black,fontSize: 20),),
                  ),
                ListTile(
                  leading: Icon(
                  CupertinoIcons.info_circle_fill,
                  color: Colors.black,),
                  title: Text("About Us",style: TextStyle(color: Colors.black,fontSize: 20),),
                  ),
                ListTile(
                  leading: Icon(
                  CupertinoIcons.arrowshape_turn_up_right_fill  ,
                  color: Colors.black,),
                  title: Text("Share Our App",style: TextStyle(color: Colors.black,fontSize: 20),),
                  ),
                ListTile(
                  leading: Icon(
                  CupertinoIcons.money_dollar_circle_fill   ,
                  color: Colors.black,),
                  title: Text("Donate",style: TextStyle(color: Colors.black,fontSize: 20),),
                  ),
                ListTile(
                  leading: Icon(
                  CupertinoIcons.gear_solid,
                  color: Colors.black,),
                  title: Text("Setting",style: TextStyle(color: Colors.black,fontSize: 20),),
                  ),
                ListTile(
                  leading: Icon(
                  CupertinoIcons.padlock_solid,
                  color: Colors.black,),
                  title: Text("Sign Up",style: TextStyle(color: Colors.black,fontSize: 20),),
                onTap: () {
                  Navigator.pushNamed(context, MyRoute.signinroute);
                },
                  ),
                ListTile(
                  leading: Icon(
                  CupertinoIcons.padlock_solid  ,
                  color: Colors.black,),
                  title: Text("Login",style: TextStyle(color: Colors.black,fontSize: 20),),
                onTap: () {
                  Navigator.pushNamed(context, MyRoute.login);
                },
                  ),
                ListTile(
                  leading: Icon(
                  CupertinoIcons.doc_checkmark_fill,
                  color: Colors.black,),
                  title: Text("T & C",style: TextStyle(color: Colors.black,fontSize: 20),),
                  ),
                ListTile(
                  leading: Icon(
                  CupertinoIcons.doc_checkmark_fill,
                  color: Colors.black,),
                  title: Text("Privacy Policy",style: TextStyle(color: Colors.black,fontSize: 20),),
                  ),
          ],
        ),
      ),
    );
  }
}
