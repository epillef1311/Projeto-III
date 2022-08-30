import 'package:flutter/material.dart';
import 'package:tragicomic/loading.dart';
import 'package:tragicomic/src/auth/sign_up_screen.dart';
import 'package:tragicomic/src/home/creation.dart';
import 'package:tragicomic/src/home/menu.dart';
import 'package:tragicomic/src/auth/reset_password.dart';

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
          '/signUp': (context) => const SignUpScreen(),
          '/loading': (context) => const Loading(),
          '/menupage':(context) =>  const MenuPage(),
          '/NewCreation': (context) => const NewCreation(),
        });
  }
}
