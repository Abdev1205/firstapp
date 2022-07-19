import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';


enum LoginScreen{
  SHOW_MOBILE_ENTER_WIDGET,
  SHOW_OTP_FORM_WIDGET
}
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
TextEditingController  phoneController = TextEditingController();
TextEditingController  otpController = TextEditingController();
LoginScreen currentState = LoginScreen.SHOW_MOBILE_ENTER_WIDGET;
FirebaseAuth _auth = FirebaseAuth.instance;
String verificationID = "";

void SignOutME() async{
  await _auth.signOut();
}
void signInWithPhoneAuthCred(AuthCredential phoneAuthCredential) async
{

  try {
    final authCred = await _auth.signInWithCredential(phoneAuthCredential);

    if(authCred.user != null)
    {

      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => HomePage()));
    }
  } on FirebaseAuthException catch (e) {

    print(e.message);
    ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text('Some Error Occured. Try Again Later')));
  }
}


showMobilePhoneWidget(context){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      
      SizedBox(
      height: 40.0,
                ),
      Image.asset(
                  "assets/images/login.png",
                  fit: BoxFit.cover,
                ),
      Text("Verify Your Phone Number" , style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold),),
      SizedBox(height: 7,),
      SizedBox(height: 20,),
      Container(
        padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
        child: Center(
          child: SingleChildScrollView(
          
          child:      
           TextField(
            

            controller: phoneController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12) ),
                hintText: "Enter Your PhoneNumber",
                labelText: "Phone Number",
            ),
          ),
        ),
      )),
      SizedBox(height: 20,),
      

      ElevatedButton
      
      (onPressed: ()  async{
        await _auth.verifyPhoneNumber(

            phoneNumber: "+91${phoneController.text}",
            verificationCompleted: (phoneAuthCredential) async{


            },
            verificationFailed: (verificationFailed){
              print(verificationFailed);
            },

            codeSent: (verificationID, resendingToken) async{
              setState(() {

                currentState = LoginScreen.SHOW_OTP_FORM_WIDGET;
                this.verificationID = verificationID;
              });
            },
            codeAutoRetrievalTimeout: (verificationID) async{

            }
            
        );
      }, child: Text("Send OTP")),
      SizedBox(height: 16,),
      Spacer()
    ],
  );
}


showOtpFormWidget(context){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
      height: 30.0,
                ),
      Image.asset(
                  "assets/images/otp.jpg",
                  fit: BoxFit.cover,
                ),
      Text("ENTER YOUR OTP" , style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold),),
      SizedBox(height: 7,),
      SizedBox(height: 20,),
      Container(
        padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
        child: Center(
          child: SingleChildScrollView(
          child:       TextField(

            controller: otpController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12) ),
                hintText: "Enter Your OTP"
            ),
          ),
        )),
      ),
      SizedBox(height: 20,),
      ElevatedButton(onPressed: () {

        AuthCredential phoneAuthCredential = PhoneAuthProvider.credential(verificationId: verificationID, smsCode: otpController.text);
        signInWithPhoneAuthCred(phoneAuthCredential);
      }, child: Text("Verify")),
      SizedBox(height: 16,),
      Spacer()
    ],
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentState == LoginScreen.SHOW_MOBILE_ENTER_WIDGET ? showMobilePhoneWidget(context) : showOtpFormWidget(context),
    );
  }
}