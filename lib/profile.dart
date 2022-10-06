import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _Collection = _firestore.collection('user');

class FirebaseCrud {
  static Stream<QuerySnapshot> readData() {
    CollectionReference notesCollection = _Collection;
    return notesCollection.snapshots();
  }
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    String usuario = "MAria Fernanda da Silv";
    String? email = FirebaseAuth.instance.currentUser?.email;
    var uid = FirebaseAuth.instance.currentUser!.uid;
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('users');

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 30,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        "Meu Perfil",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),

                const Padding(
                  padding: EdgeInsets.all(30),
                  child: Icon(
                    Icons.person_pin_outlined,
                    size: 80,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Usuário: ',
                        style: TextStyle(fontSize: 18),
                      ),
                      FutureBuilder<DocumentSnapshot>(
                        future: collectionReference.doc(uid).get(),
                        builder: (BuildContext context,
                            AsyncSnapshot<DocumentSnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return Text('ERRO');
                          }
                          if (snapshot.hasData && !snapshot.data!.exists) {
                            return Text('Not exist');
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            Map<String, dynamic> data =
                                snapshot.data!.data() as Map<String, dynamic>;
                            return Text("${data['uid']} ");
                          }
                          return Text('loadin');
                        },
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Email: ',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      email!,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),

                // SAIR
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    height: 45,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          side: const BorderSide(
                              width: 2, color: Colors.blueGrey),
                        ),
                        onPressed: () async {
                          Navigator.of(context).pushNamed('/');
                        },
                        child: const Text('Sair',
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 18,
                            ))),
                  ),
                ),

                // Deletar Conta
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    height: 45,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () async {
                          Navigator.of(context).pushNamed('/signUp');
                        },
                        child: const Text('Deletar conta',
                            style: TextStyle(
                              fontSize: 18,
                            ))),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
