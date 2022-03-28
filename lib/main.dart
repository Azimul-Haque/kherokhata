// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kherokhata/extra/privacy.dart';
import 'package:kherokhata/home.dart';
import 'package:kherokhata/profileedit.dart';

import 'login.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   Firebase.initializeApp();
//   runApp(MaterialApp(
//     home: MyApp(),
//     debugShowCheckedModeBanner: false,
//   ));
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Khero Khata',
      theme: ThemeData(
        primarySwatch: Colors.green,
        // fontFamily: 'Kalpurush',
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => InitializerWidget(),
        '/profileedit': (context) => ProfileEditPage(),
        // '/favorites': (context) => FavoritesPage(),
        // '/qstnanswer': (context) => QuestionAnswerPage(),
        // '/constitution': (context) => ConstituionPage(),
        // '/history': (context) => HistoryPage(),
        // '/exam': (context) => ExamPage(),
        // '/ammendments': (context) => AmmendmentsPage(),
        '/privacy': (context) => PrivacyPage(),
      },
    );
  }
}

class InitializerWidget extends StatefulWidget {
  const InitializerWidget({Key? key}) : super(key: key);

  @override
  _InitializerWidgetState createState() => _InitializerWidgetState();
}

class _InitializerWidgetState extends State<InitializerWidget> {
  late FirebaseAuth _auth;

  // late User _user;

  String uid = '0';

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _auth = FirebaseAuth.instance;
    uid = _auth.currentUser?.uid ?? '0';
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : uid == '0'
            ? LoginScreen()
            : Home();
  }
}
