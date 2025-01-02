import 'package:flutter/material.dart';
import 'package:reserva_livros/Screens/main_screen.dart';
import 'package:reserva_livros/database/db_helper.dart';
import 'package:reserva_livros/models/book_model.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({super.key});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  List<BookModel> livros = [];
  @override
  void initState() {
    super.initState();
    _loadBooks();
  }

  Future<void> _loadBooks() async {
    List<BookModel> books = await DB.instance.getBooks();
    setState(() {
      livros = books;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => MainScreen()),
                  (Route<dynamic> route) => false,
                );
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            const Center(
              child: Text(
                "Livros Registrados",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: List.generate(livros.length, (index) {
          BookModel livro = livros[index];
          return Container(
            color: Colors.black12,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("Titulo: ${livro.title}",
                        style: const TextStyle(
                          fontSize: 20,
                        )),
                    Text("Autor: ${livro.writer}"),
                    Text(
                        "Disponibilidade: ${livro.avaliability == 0 ? "Disponível" : "Indisponivel"}"),
                    Text("Genero: ${identifyGender(livro.gender)}"),
                  ]),
            ),
          );
        }),
      ),
    );
  }

  String? identifyGender(int genderId) {
    switch (genderId) {
      case 1:
        return "ação";
      case 2:
        return "suspense";
      case 3:
        return "Romance";
      case 4:
        return "Crônica";
      case 5:
        return "Reportagem";
      case 6:
        return "Comédia";
      default:
        return "n sei oq aconteceu";
    }
  }
}
