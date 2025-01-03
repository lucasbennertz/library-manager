import 'package:flutter/material.dart';
import 'package:reserva_livros/Screens/book_screen.dart';
import 'package:reserva_livros/Screens/book_sign_up_screen.dart';
import 'package:reserva_livros/Screens/student_sign_up_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            Center(
                child: Text(
              "Seja Bem-vindo",
              style: TextStyle(color: Colors.white, fontSize: 24),
            )),
            Text(
              "Sistema de gerenciamento de bibliotecas",
              style: TextStyle(color: Colors.white, fontSize: 14),
            )
          ],
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              "assets/livroLogo.webp",
              width: 128,
              height: 128,
            ),
            SizedBox(
              height: 32,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StudentSignUpScreen()),
                      (Route<dynamic> route) => false);
                },
                child: const Text(
                  "Ir para cadastro de Alunos",
                  style: TextStyle(color: Colors.white),
                )),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BookSignUpScreen()),
                      (Route<dynamic> route) => false);
                },
                child: const Text(
                  "Ir para cadastro de Livros",
                  style: TextStyle(color: Colors.white),
                )),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => BookScreen()),
                      (Route<dynamic> route) => false);
                },
                child: const Text(
                  "Ir para Biblioteca",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
