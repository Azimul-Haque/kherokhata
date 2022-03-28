// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors, unused_local_variable, avoid_print, unused_field

import 'package:flutter/material.dart';
import 'package:kherokhata/globals.dart';

class ProfileEditPage extends StatefulWidget {
  // final String phone;
  // ProfileEditPage(this.phone);
  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cursor = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 1.5,
          height: 20,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );
    final preFilledWidget = Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 56,
          height: 3,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text('OTP ভেরিফিকেশন'),
        flexibleSpace: appBarStyle(),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.only(top: 70),
            child: Center(
              child: Text(
                'OTP ভেরিফিকেশন',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
