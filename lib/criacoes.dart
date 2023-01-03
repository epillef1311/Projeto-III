class Criacoes {
  String? mainActor;
  String? director;
  String? duration;
  String? genero;
  String? titulo;

  Criacoes();

  Map<String, dynamic> toJson() => {
        'Ator principal': mainActor,
        'Diretor': director,
        'Duração': duration,
        'Genero': genero,
        'Titulo': titulo
      };

  Criacoes.fromSnapshot(snapshot)
      : mainActor = snapshot.data()['Ator principal'],
        director = snapshot.data()['Diretor'],
        duration = snapshot.data()['Duração'],
        genero = snapshot.data()['Genero'],
        titulo = snapshot.data()['Titulo'];
}
