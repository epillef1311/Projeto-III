import 'package:flutter/material.dart';
import 'package:tragicomic/src/auth/components/custom_text_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

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

                    //NOME DO APP
                    Text.rich(
                      TextSpan(
                        style: TextStyle(
                          fontSize: 40,
                        ),
                        children: [
                          TextSpan(
                            text: 'Tragicomic',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            )
                          ),
                        ]
                      )
                    ),
                    
                  ],
                )
              ),
      //O container crescerá ao máximo para acomodoar seus filhos,
      //o  EXPANDED acima irá crescer o máximo que puder sem atraplhar o container;
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 30,
              ),
      
              decoration: const BoxDecoration(
                color: Colors.white),
      
                //Faz a parte branca da tela com cantos arredondados
                //borderRadius: BorderRadius.vertical(top: Radius.circular(45))),
      
              child: Column(
                // Estica todos os botões
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //Nome do usuário
                  const CustomTextField(
                    icon: Icons.person,
                    label: 'Usuário',
                  ),
      
                  // Senha
                  const CustomTextField(
                    icon: Icons.lock,
                    label: 'Senha',
                    isSecret: true,
                  ),
                  
                  // BOTÂO PARA ENTRAR
                  SizedBox (
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),)
                      ),
                      onPressed:(){
                        Navigator.of(context).pushNamed('/inicialScreen');
                      }, 
                      child: const 
                      Text('Acessar', style: TextStyle(fontSize: 18,
                      ),)
                    ),
                   ),
                  
                  //Esqueceu senha?
                    Align(
                      alignment: Alignment.centerLeft,
                      //Padding: Espaçamento entre o texto 'esqueci sinha' e os botões.
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: TextButton(
                          onPressed: (){},
                          child: const Text ('Esqueceu a senha?', 
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
                    child: Row (
                      children:const[
                        Expanded (
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
                        borderRadius: BorderRadius.circular(18),),
                        side: const BorderSide(
                        width: 2,
                        color: Colors.blueGrey,
                      )
                    ),
                    onPressed: (){
                      Navigator.of(context).pushNamed('/signUp');
                    }, 
                    child: const Text('Criar Conta',
                    style: TextStyle(
                      fontSize: 18,
                    ),),),),
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