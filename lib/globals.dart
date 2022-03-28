// ignore_for_file: prefer_const_literals_to_create_immutables

library kherokhata.globals;

import 'package:flutter/material.dart';

// appBarStyle() {
//   return Ink(
//     decoration: new BoxDecoration(
//       gradient: new LinearGradient(
//         colors: [
//           Colors.red[800],
//           Colors.red[600],
//         ],
//         begin: const FractionalOffset(0.0, 0.0),
//         end: const FractionalOffset(1.0, 0.0),
//         stops: [0.0, 1.0],
//         tileMode: TileMode.clamp,
//       ),
//     ),
//   );
// }

showAlertDialog(BuildContext context, String message) {
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Center(child: Text(message)),
    content: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const CircularProgressIndicator(),
      ],
    ),
  );

  // show the dialog
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

// Future<void> share(textorurl, subject) async {
//   await Share.share(
//     subject + ': ' + textorurl,
//     subject: subject,
//   );
// }

showSimpleSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(message),
    ),
  );
}

library project1.globals;

import 'package:flutter/material.dart';

appBarStyle() {
  return Ink(
    decoration: new BoxDecoration(
      gradient: new LinearGradient(
        colors: [
          Colors.green[800],
          Colors.lightGreen,
        ],
        begin: const FractionalOffset(0.0, 0.0),
        end: const FractionalOffset(1.0, 0.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp,
      ),
    ),
  );
}