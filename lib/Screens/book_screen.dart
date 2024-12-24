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
          return ListTile(
            title: Text("Titulo: ${livro.title}"),
            subtitle: Text("Autor: ${livro.writer}"),
          );
        }),
      ),
    );
  }
}
