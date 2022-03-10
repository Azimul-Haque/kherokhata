// ignore_for_file: prefer_const_constructors, prefer_final_fields, prefer_const_constructors_in_immutables, deprecated_member_use, unnecessary_null_comparison, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kherokhata/home.dart';
import 'package:kherokhata/otp.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState

    super.initState();
    // Firebase.initializeApp();
    // print('TEST FROM DEVICE...');
    var uid = FirebaseAuth.instance.currentUser?.uid ?? 0;
    if (uid != 0) {
      print('User is signed in!');
      // Navigator.pushAndRemoveUntil(context,
      //     MaterialPageRoute(builder: (context) => Home()), (route) => false);
      Route route = MaterialPageRoute(builder: (context) => Home());
      Navigator.push(context, route);
    }
    // FirebaseAuth.instance.authStateChanges().listen((event) {
    //   (User user) {
    //     if (user == null) {
    //       print('User is currently signed out!');
    //       Navigator.pushAndRemoveUntil(
    //           context,
    //           MaterialPageRoute(builder: (context) => OTPScreen('01555333222')),
    //           (route) => false);
    //     } else {
    //       print('User is signed in!');
    //       // User user = FirebaseAuth.instance.currentUser;
    //       // print(user);
    //       Navigator.pushAndRemoveUntil(
    //           context,
    //           MaterialPageRoute(builder: (context) => Home()),
    //           (route) => false);
    //     }
    //   };
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Phone Auth'),
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(children: [
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.only(top: 70),
              child: Center(
                child: Text(
                  'খেরোখাতা',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Center(
                child: Text(
                  'ব্যবহার শুরু করতে মোবাইল নম্বর দিন',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, right: 20, left: 20),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'মোবাইল নম্বর',
                  prefix: Padding(
                    padding: EdgeInsets.all(4),
                    child: Text('+88'),
                  ),
                ),
                maxLength: 11,
                keyboardType: TextInputType.phone,
                controller: _controller,
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                  elevation: MaterialStateProperty.all(1),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => OTPScreen(_controller.text)));
                },
                child: Text(
                  'পরবর্তী',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ]),
          // Container(
          //   margin: EdgeInsets.all(20),
          //   width: double.infinity,
          //   child: FlatButton(
          //     color: Colors.blue,
          //     onPressed: () {
          //       Navigator.of(context).push(MaterialPageRoute(
          //           builder: (context) => OTPScreen(_controller.text)));
          //     },
          //     child: Text(
          //       'Next',
          //       style: TextStyle(color: Colors.white),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
