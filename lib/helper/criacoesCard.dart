import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tragicomic/criacoes.dart';

class CriacoesCard extends StatelessWidget {
  final Criacoes _criacoes;
  var uid = FirebaseAuth.instance.currentUser!.uid;
  CriacoesCard(this._criacoes);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text('${_criacoes.titulo}'),
                ),
                Spacer(),
                IconButton(
                    onPressed: () {
                      print('tap tap');
                      final collection = FirebaseFirestore.instance
                          .collection('criacao')
                          .doc(uid)
                          .collection('criacoes')
                          .doc("${_criacoes.titulo}")
                          .delete()
                          .then((doc) => print('project deleted'));

                      Navigator.pop(context);
                      Navigator.of(context).pushNamed('/myCreation');
                    },
                    icon: const Icon(Icons.delete))
              ],
            ),
            Row(
              children: [
                Text(
                    'Diretor: ${_criacoes.director}, Ator principal: ${_criacoes.mainActor}'),
                Spacer(),
                Text('${_criacoes.duration} min')
              ],
            )
          ],
        ),
      ),
    ));
  }
}
