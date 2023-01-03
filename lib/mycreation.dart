import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tragicomic/criacoes.dart';
import 'package:tragicomic/helper/criacoesCard.dart';

class MyCreation extends StatefulWidget {
  const MyCreation({super.key});
  @override
  State<MyCreation> createState() => _MycreationState();
}

var uid = FirebaseAuth.instance.currentUser!.uid;
Stream collectionStream =
    FirebaseFirestore.instance.collection('criacao').snapshots();
Stream documentStream = FirebaseFirestore.instance
    .collection('criacao')
    .doc(uid)
    .collection('criacoes')
    .snapshots();

class _MycreationState extends State<MyCreation> {
  final Stream<QuerySnapshot> _userStream =
      FirebaseFirestore.instance.collection('user').snapshots();

  List<Object> _listCriacao = [];

  @override
  didChangeDependencies() {
    super.didChangeDependencies();
    getUserCriacaoList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: ListView.builder(
          itemCount: _listCriacao.length,
          itemBuilder: (context, index) {
            return CriacoesCard(_listCriacao[index] as Criacoes);
          },
        ),
      ),
    );
  }

  Future getUserCriacaoList() async {
    var data = await FirebaseFirestore.instance
        .collection('criacao')
        .doc(uid)
        .collection('criacoes')
        .get();

    setState(() {
      _listCriacao =
          List.from(data.docs.map((doc) => Criacoes.fromSnapshot(doc)));
    });
  }
}
