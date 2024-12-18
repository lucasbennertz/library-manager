import 'package:reserva_livros/models/gender_model.dart';

class BookModel {
  int? bookId;
  String title;
  String writer;
  GenderModel gender;
  int avaliability;

  BookModel(
      this.bookId, this.title, this.writer, this.gender, this.avaliability);
}