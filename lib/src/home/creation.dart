import 'package:flutter/material.dart';

class NewCreation extends StatefulWidget {
  const NewCreation({Key? key}) : super(key: key);

  @override
  State<NewCreation> createState() => _NewCreationState();
}

class _NewCreationState extends State<NewCreation> {
  
  final genres = ['Ação','Aventura', 'Comédia', 'Drama', 'Ficção', 'Horror', 'Musical', 'Romance'];
  final directors = ['diretor 1', 'diretor 2','diretor 3'];
  final actors =['ator A', 'ator B', 'atriz Y', 'atriz Z'];
  final times = ['30', '60', '120', '180'];
  String genre = 'Ação';
  String director = 'The best director';
  String actor = 'The greater actor';
  String time = '30';
  

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

                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                      //LOGO
                        Row(
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
                              child: Text('Nova Criação',
                              style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20, 
                                      fontWeight: FontWeight.bold,
                                 ),
                              
                               ),
                             ),
                           ],
                        ),
                      ],
                    ),
                  ),
                  // CAMPOS DE ATRIBUTOS
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
                      crossAxisAlignment: CrossAxisAlignment.stretch, 
                      children: [
                        //Nome do USUÁRIO
                        const Padding(
                          padding: EdgeInsets.only(bottom: 15),
                          child: TextField(
                            //controller: _title,
                            enableSuggestions: false,
                            autocorrect: false,
                            decoration: InputDecoration(hintText: 'Título do projeto',
                            isDense: true,
                            icon: Icon(Icons.create_outlined, size: 22,),),
                          ),
                        ),

                      //Gênero
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(Icons.favorite_border),
                          ),
                          const Text('Gênero:', style: TextStyle(fontSize: 18)),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: DropdownButton(
                                // Initial Value
                                value: genre,
                                // Down Arrow Icon
                                icon: const Icon(Icons.keyboard_arrow_down),   
                                // Array list of items
                                items: genres.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                // After selecting the desired option,it will
                                // change button value to selected value
                                onChanged: (String? newValue) {
                                  setState(() {
                                    genre = newValue!;
                                  });
                                },
                              ),
                          ),
                        ],
                      ),
                    //Diretor
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Icon(Icons.manage_accounts_rounded),
                            ),
                            Text('Diretor(a):', style: TextStyle(fontSize: 18),),
                                  ],
                                ),
                              ),
                      //Estrela Principal
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Icon(Icons.star_border_purple500),
                            ),
                            Text('Estrela principal:', style: TextStyle(fontSize: 18),),
                          ],
                        ),
                      ),
                      
                      //Duração
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Icon(Icons.timelapse_rounded),
                            ),
                            Text('Duração do filme:', style: TextStyle(fontSize: 18),),
                          ],
                        ),
                      ),

              // GERAR RESULTADOS
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: SizedBox(
                            height: 45,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                onPressed: () async {
                                  Navigator.of(context).pushNamed('/results');
                                },

                                child: const Text('Gerar resultados',
                                    style: TextStyle(
                                      fontSize: 18,))),
                          ),
                        )                   
                      ],
                    ),
                  ),
                ],
              ),
            ]
          ),
        ),
      ),
    );
  }
}