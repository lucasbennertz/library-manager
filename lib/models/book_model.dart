import 'package:reserva_livros/models/gender_model.dart';

class BookModel {
  int? bookId;
  String title;
  String writer;
  int gender;
  int avaliability;

  BookModel(
      this.bookId, this.title, this.writer, this.gender, this.avaliability);

  BookModel.fromMap(Map<String, dynamic> map)
      : bookId = map["idLivros"],
        title = map["tituloLivros"],
        writer = map["autorLivros"],
        gender = map["generoLivros"],
        avaliability = map["disponibilidadeLivros"];
}
