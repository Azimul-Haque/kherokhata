import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'login.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   Firebase.initializeApp();
//   runApp(MaterialApp(
//     home: MyApp(),
//     debugShowCheckedModeBanner: false,
//   ));
// }

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  var materialApp = MaterialApp(
    title: 'Khero Khata',
    theme: ThemeData(
      primarySwatch: Colors.green,
      // fontFamily: 'Kalpurush',
    ),
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => LoginScreen(),
      // '/formpage': (context) => FormPage(),
      // '/favorites': (context) => FavoritesPage(),
      // '/qstnanswer': (context) => QuestionAnswerPage(),
      // '/constitution': (context) => ConstituionPage(),
      // '/history': (context) => HistoryPage(),
      // '/exam': (context) => ExamPage(),
      // '/ammendments': (context) => AmmendmentsPage(),
      // '/exams': (context) => ExamsPage(),
    },
  );
  return runApp(materialApp);
}

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return LoginScreen();
//   }
// }
