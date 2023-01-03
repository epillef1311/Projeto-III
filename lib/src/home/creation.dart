import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewCreation extends StatefulWidget {
  const NewCreation({Key? key}) : super(key: key);

  @override
  State<NewCreation> createState() => _NewCreationState();
}

class _NewCreationState extends State<NewCreation> {

  final times = ['30', '60', '90', '120', '180'];
  String genre = 'Ação';
  String director = 'The best director';
  String actor = 'The greater actor';
  String time = '30';

  late final TextEditingController _actor;
  late final TextEditingController _times;
  late final TextEditingController _director;
  late final TextEditingController _title;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _actor = TextEditingController();
    _times = TextEditingController();
    _director = TextEditingController();
    _title = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _actor.dispose();
    _times.dispose();
    _director.dispose();
    _title.dispose();
    super.dispose();
  }

  var uid = FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          // Implementa uma rolagem na tela
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: Stack(children: [
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
                              child:
                                  Icon(Icons.movie_filter_outlined, size: 30),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 40),
                              child: Text(
                                'Nova Criação',
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
                        Padding(
                          padding: EdgeInsets.only(bottom: 15),
                          child: TextFormField(
                            controller: _title,
                            enableSuggestions: false,
                            autocorrect: false,
                            decoration: InputDecoration(
                              hintText: 'Título do projeto',
                              isDense: true,
                              icon: Icon(
                                Icons.create_outlined,
                                size: 22,
                              ),
                            ),
                          ),
                        ),

                        //Gênero
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(10),
                              child: Icon(Icons.favorite_border),
                            ),
                            const Text('Gênero:',
                                style: TextStyle(fontSize: 18)),
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

                                // Array list of items
                                items: times.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                // After selecting the desired option,it will
                                // change button value to selected value
                                onChanged: (String? newValue) {
                                  setState(() {
                                    time = newValue!;
                                  });
                                },
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
                                  final title = _title.text;
                                  final director = _director.text;
                                  final actor = _actor.text;

                                child: const Text('Salvar resultados',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ))),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
