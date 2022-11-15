import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'data/application_state.dart';
import 'screens/forgot_password_screen.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/sign_in_screen.dart';

class LabelOverrides extends DefaultLocalizations {
  const LabelOverrides();

  @override
  String get signInText => 'Entrar';

  @override
  String get registerHintText => 'Não tem uma conta?';

  @override
  String get forgotPasswordButtonLabel => 'Esqueceu a senha?';

  @override
  String get registerText => 'Cadastre-se';

  @override
  String get passwordInputLabel => 'Senha';

  @override
  String get signInActionText => 'Entrar';

  @override
  String get emailIsRequiredErrorText => 'Insira seu email';
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ChangeNotifierProvider(
    create: (context) => ApplicationState(),
    builder: (context, child) => const App(),
  ));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Meetup',
      theme: ThemeData(
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
              highlightColor: Colors.deepPurple,
            ),
        primarySwatch: Colors.deepPurple,
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomeScreen(),
        '/sign-in': (context) => signInScreen(context),
        '/forgot-password': (context) => forgotPasswordScreen(context),
        '/profile': (context) => profileScreen(context),
      },
      localizationsDelegates: [
        FirebaseUILocalizations.withDefaultOverrides(const LabelOverrides()),
      ],
    );
  }
}
