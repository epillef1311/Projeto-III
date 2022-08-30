import 'package:flutter/material.dart';

class NewCreation extends StatefulWidget {
  const NewCreation({Key? key}) : super(key: key);

  @override
  State<NewCreation> createState() => _NewCreationState();
}

class _NewCreationState extends State<NewCreation> {
  
  final genres = ['Ação', 'Aventura', 'Comédia', 'Drama', 'Ficção', 'Horror', 'Musical', 'Romance'];
  String? value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 50,
        title: const Text('Nova criação', style: TextStyle(
          fontSize: 30,
           ),
         ),
      ),
      body: 
      Column(

      ),
    );
  
  }
}