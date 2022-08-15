import 'package:flutter/material.dart';
import 'package:tragicomic/src/auth/components/custom_text_field.dart';
// ignore: depend_on_referenced_packages
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

//Máscara para TELEFONE
  final phone = MaskTextInputFormatter(
    mask:'(##)#####-####',
    filter: {'#': RegExp(r'[0-9]'),},
  );


  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      
      body: SingleChildScrollView( // Implementa uma rolagem na tela
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
                Container (
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 30,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    //borderRadius: BorderRadius.vertical(top: Radius.circular(45))
                  ),
                  child: Column (
                    crossAxisAlignment: CrossAxisAlignment.stretch, // ESTICA TODOS OS CAMPOS AO MÁXIMO NA TELA
                    children: [

                      //Nome do USUÁRIO
                      const CustomTextField(icon: Icons.person, label: 'Nome'),
                      //EMAIL user@email.com
                      const CustomTextField(
                        icon: Icons.email, label: 'Email'),
                      
                      //SENHA ********
                      const CustomTextField(
                        icon: Icons.lock, 
                        label: 'Senha',
                        isSecret: true,
                      ),
                      const CustomTextField(
                        icon: Icons.lock, 
                        label: 'Confirmar Senha',
                        isSecret: true,
                        ),
                      // TELEFONE (00) 00000-0000
                      CustomTextField(icon: Icons.phone, label: 'Telefone',
                      inputFormatters: [phone],
                      ),
      
                      SizedBox(
                        height: 45,
                        child: ElevatedButton(
                          style: 
                          ElevatedButton.styleFrom(  
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                          onPressed: () {}, 
                          child: const Text('Cadastrar',
                          style: TextStyle(
                            fontSize: 18, 
                          )
                          )
                        ),
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
                icon: const Icon(Icons.arrow_back_ios,
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