import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late final TextEditingController _name;
  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController _telefone;

  @override
  void initState() {
    _name = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();
    _telefone = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _password.dispose();
    _telefone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //O contexto é a tela
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.blueGrey,

      // Oraginzar o body em colunas
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Icon(
                      Icons.movie_filter_outlined,
                      size: 40,
                    ),
                  ),
                  //NOME DO APP
                  Text.rich(TextSpan(
                      style: TextStyle(
                        fontSize: 30,
                      ),
                      children: [
                        TextSpan(
                            text: 'Tragicomic',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            )),
                      ])),
                ],
              )),
              //O container crescerá ao máximo para acomodoar seus filhos,
              //o  EXPANDED acima irá crescer o máximo que puder sem atraplhar o container;
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 30,
                ),

                decoration: const BoxDecoration(color: Colors.white),

                //Faz a parte branca da tela com cantos arredondados
                //borderRadius: BorderRadius.vertical(top: Radius.circular(45))),

                child: Column(
                  // Estica todos os botões
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    //Nome do usuário
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: TextField(
                        controller: _email,
                        enableSuggestions: false,
                        autocorrect: false,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: 'Email',
                          isDense: true,
                          icon: Icon(Icons.email_outlined),
                        ),
                      ),
                    ),

                    // Senha
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: TextField(
                        controller: _password,
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: const InputDecoration(
                          hintText: 'Senha',
                          isDense: true,
                          icon: Icon(Icons.lock_outline),
                        ),
                      ),
                    ),

                    // BOTÂO PARA ENTRAR
                    SizedBox(
                      height: 45,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          )),
                          onPressed: () async {
                            final email = _email.text;
                            final password = _password.text;
                            try {
                              final UserCredential = await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                      email: email, password: password);
                              Navigator.of(context).pushNamed('/menupage');
                              //print(UserCredential);
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'user-not-found') {
                                print('user not found');
                              } else if (e.code == 'wrong-password') {
                                print('wrong password');
                              }
                            }
                          },
                          child: const Text(
                            'Acessar',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          )),
                    ),

                    //Esqueceu senha?
                    Align(
                      alignment: Alignment.centerLeft,
                      //Padding: Espaçamento entre o texto 'esqueci sinha' e os botões.
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Esqueceu a senha?',
                            style: TextStyle(
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ),
                    ),

                    // DIVISOR COM 'ou'
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: const [
                          Expanded(
                            child: Divider(
                              color: Colors.blueGrey,
                              thickness: 2,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Text('ou'),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.blueGrey,
                              thickness: 2,
                            ),
                          ),
                        ],
                      ),
                    ),

                    //Botão: CRIAR CONTA
                    SizedBox(
                      height: 45,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            side: const BorderSide(
                              width: 2,
                              color: Colors.blueGrey,
                            )),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/signUp');
                        },
                        child: const Text(
                          'Criar Conta',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
