import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

Widget signInScreen(BuildContext context) {
  return SignInScreen(
    actions: [
      ForgotPasswordAction((context, email) {
        Navigator.of(context)
            .pushNamed('/forgot-password', arguments: {'email': email});
      }),
      AuthStateChangeAction((context, state) {
        if (state is SignedIn || state is UserCreated) {
          var user = (state is SignedIn)
              ? state.user
              : (state as UserCreated).credential.user;
          if (user == null) {
            return;
          }
          if (state is UserCreated) {
            user.updateDisplayName(user.email!.split('@')[0]);
          }
          if (!user.emailVerified) {
            user.sendEmailVerification();
            const snackBar = SnackBar(
                content: Text(
                    'Por favor, verique a mensagem de confirmação enviada para o seu email'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
          Navigator.of(context).pushReplacementNamed('/home');
        }
      }),
    ],
  );
}
