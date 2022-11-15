import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

Widget profileScreen(BuildContext context) {
  return ProfileScreen(
    providers: const [],
    actions: [
      SignedOutAction(((context) {
        Navigator.of(context).pushReplacementNamed('/home');
      }))
    ],
  );
}
