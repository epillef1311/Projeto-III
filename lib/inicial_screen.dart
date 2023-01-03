import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tragicomic/firebase_options.dart';
import 'package:tragicomic/src/auth/sign_in_screen.dart';

class InicialScreen extends StatelessWidget {
  const InicialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        body: FutureBuilder(
          future: Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform,
          ),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                return SignInScreen();
              default:
                return const Text('Loading...');
            }
          },
        ));
  }
}
