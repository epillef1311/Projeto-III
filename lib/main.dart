import 'package:flutter/material.dart';
import 'package:tragicomic/inicial_screen.dart';
import 'package:tragicomic/src/auth/sign_up_screen.dart';

import 'src/auth/sign_in_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const TragiComic());
}

class TragiComic extends StatelessWidget {
  const TragiComic({Key? key}) : super(key: key);

  // This widget is the root of our application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        debugShowCheckedModeBanner: false,

        //Definindo rotas no APP
        initialRoute: '/',
        routes: {
          '/': (context) => SignInScreen(),
          '/signUp': (context) => SignUpScreen(),
          '/inicialScreen': (context) => const InicialScreen(),
        });
  }
}
