// ignore_for_file: prefer_const_constructors, prefer_final_fields, prefer_const_constructors_in_immutables, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:kherokhata/otp.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _controller = TextEditingController();
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
            )
          ]),
          Container(
            margin: EdgeInsets.all(10),
            width: double.infinity,
            child: FlatButton(
              color: Colors.blue,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => OTPScreen(_controller.text)));
              },
              child: Text(
                'Next',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
