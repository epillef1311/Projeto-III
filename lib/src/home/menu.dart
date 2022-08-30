import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        // Coluna para todos os filhos
        children: [
          //coluna para textos do topo
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                       
                       Padding(
                         padding: EdgeInsets.fromLTRB(0, 40, 20, 0),
                         //LOGO ICON
                         child: Icon(Icons.movie_filter_outlined, size: 30),
                       ),
                       Padding(
                         padding: EdgeInsets.only(top: 40),
                         child: Text('Tragicomic',
                         style: TextStyle(
                                color: Colors.black,
                                fontSize: 25, 
                                fontWeight: FontWeight.bold,
                           ),
                         
                         ),
                       ),
                      ],
                    ),
                  ),

                  Column(
                    children: const [
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Text('Bem vindo, usuário!',
                    style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,),),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text('O que deseja fazer?',
                    style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,),),
                  ),
                  ],
                
                   ),
                ],
                ),

              // Botões
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                      children: [
                      IconButton(onPressed: () {
                      Navigator.of(context).pushNamed('/');
                  },
                  icon: const Icon(Icons.credit_score_sharp,
                  size: 40,
                  ),),
              
                  const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text('Nova Criação',
                      style: TextStyle(
                        fontSize: 18, ),
                        ),
                       ),
                      ],
                   ),
                    ),
                   Column(
                    children: [
                    IconButton(onPressed: () {
                    Navigator.of(context).pushNamed('/NewCreation');
                  },
                  icon: const Icon(Icons.trending_up_rounded,
                  size: 40,
                  ),),
              
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text('Tendências',
                    style: TextStyle(
                      fontSize: 18, ),
                      ),
                     ),
                    ],
                   ),
                  ],
              
                ),
              ),

              Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                children: [
                IconButton(onPressed: () {
                Navigator.of(context).pushNamed('/');
              },
              icon: const Icon(Icons.person_pin_circle_outlined,
              size: 40,
              ),),
  
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text('Meu Perfil',
                style: TextStyle(
                  fontSize: 18, ),
                  ),
                 ),
                ],
               ),
              ),
               Column(
              children: [
              IconButton(onPressed: () {
              Navigator.of(context).pushNamed('/');
              },
              icon: const Icon(Icons.my_library_books_rounded,
              size: 40,
              ),),
  
              const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text('Minhas Criações',
              style: TextStyle(
                fontSize: 18, ),
                ),
               ),
              ],
               ),
              ],

               ),

            ],
          )
        ],
      )

    );
  }
}