// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors, unused_local_variable, avoid_print, unused_field

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kherokhata/globals.dart';
import 'package:kherokhata/home.dart';
import 'package:pinput/pinput.dart';

class OTPScreen extends StatefulWidget {
  final String phone;
  OTPScreen(this.phone);
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  late String _verificationCode;
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: const Color.fromRGBO(43, 46, 66, 1),
    borderRadius: BorderRadius.circular(50.0),
    border: Border.all(
      color: const Color.fromRGBO(126, 203, 224, 1),
    ),
  );

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _verifyPhone();
  }

  @override
  Widget build(BuildContext context) {
    const borderColor = Color.fromRGBO(30, 60, 87, 1);
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 24,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        color: Colors.amber[50],
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(10),
        // backgroundBlendMode: BlendMode.clear,
      ),
    );
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
      // appBar: AppBar(
      //   title: Text('OTP ভেরিফিকেশন'),
      // ),
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
          Container(
            margin: EdgeInsets.only(top: 20, right: 20, left: 20),
            child: Center(
              child: Text(
                '+88${widget.phone} নম্বরে পাঠানো ছয় ডিজিটের কোডটি নিচের ঘরে লিখুন।',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 35, left: 35),
            child: Pinput(
              length: 6,
              focusedPinTheme: defaultPinTheme,
              pinAnimationType: PinAnimationType.slide,
              focusNode: _pinPutFocusNode,
              cursor: cursor,
              showCursor: true,
              onTap: () {
                print('Tap: Tapping...');
              },
              onCompleted: (pin) async {
                // print('Working...');
                try {
                  await FirebaseAuth.instance
                      .signInWithCredential(PhoneAuthProvider.credential(
                          verificationId: _verificationCode, smsCode: pin))
                      .then((value) async {
                    if (value.user != null) {
                      showSimpleSnackBar(
                          context, 'সফলভাবে লগইন সম্পন্ন হয়েছে!');
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                          (route) => false);
                    }
                  });
                } catch (e) {
                  FocusScope.of(context).unfocus();
                  // _scaffoldkey.currentState!
                  //     .showSnackBar(SnackBar(content: Text('invalid OTP')));
                  showSimpleSnackBar(context, 'সঠিক নয়! আবার চেষ্টা করুন।');
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   SnackBar(
                  //     behavior: SnackBarBehavior.floating,
                  //     content: Text('invalid OTP'),
                  //   ),
                  // );
                }
              },
            ),
          )
        ],
      ),
    );
  }

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+88${widget.phone}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                  (route) => false);
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verficationID, int? resendToken) {
          setState(() {
            _verificationCode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 120));
  }
}
