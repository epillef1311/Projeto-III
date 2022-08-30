import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tragicomic/src/auth/components/custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
 

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
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SingleChildScrollView(
        // Implementa uma rolagem na tela
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Column(
                children: [
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Cadastro de Novo Usuário',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  // CAMPOS DE CADASTRO DE USUÁRIO
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 30,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      //borderRadius: BorderRadius.vertical(top: Radius.circular(45))
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .stretch, // ESTICA TODOS OS CAMPOS AO MÁXIMO NA TELA
                      children: [
                        //Nome do USUÁRIO
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: TextField(
                            controller: _name,
                            enableSuggestions: false,
                            autocorrect: false,
                            decoration: const InputDecoration(hintText: 'Nome',
                            isDense: true,
                            icon: Icon(Icons.person_outline),),
                          ),
                        ),
                        //EMAIL user@email.com
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: TextField(
                              controller: _email,
                              enableSuggestions: false,
                              autocorrect: false,
                              keyboardType: TextInputType.emailAddress,
                              decoration:
                                  const InputDecoration(hintText: 'Email',
                                  isDense: true,
                                  icon: Icon(Icons.email_outlined),
                                ),
                            ),
                        ),

                        //SENHA ********
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: TextField(
                            controller: _password,
                            obscureText: true,
                            enableSuggestions: false,
                            autocorrect: false,
                            decoration: const InputDecoration(hintText: 'Senha',
                            isDense: true,
                            icon: Icon(Icons.lock_outline),
                            ),
                          ),
                        ),

                        //Resolver <<<<<<<<<<<<<<<<<<<<<
                        const CustomTextField(
                          icon: Icons.lock,
                          label: 'Confirmar Senha',
                          isSecret: true,
                        ),

                        // TELEFONE (00) 00000-0000
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: TextField(
                            controller: _telefone,
                            enableSuggestions: false,
                            autocorrect: false,
                            decoration:
                                const InputDecoration(hintText: 'Telefone',
                                isDense: true,
                                icon: Icon(Icons.phone_outlined),
                            ),
                          ),
                        ),

                        // CADASRTRAR
                        SizedBox(
                          height: 45,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),
                              onPressed: () async {
                                final name = _name.text;
                                final email = _email.text;
                                final password = _password.text;
                                final telefone = _telefone.text;
                                try {
                                  final UserCredential = await FirebaseAuth
                                      .instance
                                      .createUserWithEmailAndPassword(
                                          email: email, password: password);
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'weak password') {
                                    print('weak password');
                                  } else if (e.code == 'email-already-in-use') {
                                    print('email already in use');
                                  } else if (e.code == 'invalid-email') {
                                    print('invalid email');
                                  }
                                }
                                final user = FirebaseAuth.instance.currentUser;
                                await user?.sendEmailVerification();
                              },
                              child: const Text('Cadastrar',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ))),
                        )
                      ],
                    ),
                  ),
                ],
              ),

              //Responsável por posicionar o IconButton
              //10 abaixo da barra de notificações e da lateral esquerda;
              Positioned(
                left: 10,
                top: 10,
                //SafeArea:Fora da barra de notificações;
                child: SafeArea(
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/');
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
