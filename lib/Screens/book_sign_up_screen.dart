import 'package:flutter/material.dart';
import 'package:reserva_livros/Screens/main_screen.dart';
import 'package:reserva_livros/components/decoration_form_input.dart';

class BookSignUpScreen extends StatefulWidget {
  const BookSignUpScreen({super.key});

  @override
  State<BookSignUpScreen> createState() => _BookSignUpScreenState();
}

class _BookSignUpScreenState extends State<BookSignUpScreen> {
  final _formKey = GlobalKey<FormState>();
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
                        (Route<dynamic> route) => false);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  )),
              const Center(
                  child: Text(
                "Cadastro de Livros",
                style: TextStyle(color: Colors.white),
              ))
            ],
          ),
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  "assets/cadastroLivrosLogo.webp",
                  width: 128,
                  height: 256,
                ),
                SizedBox(
                  height: 18,
                ),
                TextFormField(
                  decoration: getDecorationInput("Titulo"),
                  validator: (String? value) {
                    if (value == null) {
                      return "O titulo não pode ser vazio";
                    }
                    if (value.length < 2) {
                      return "O titulo é muito curto";
                    }
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  decoration: getDecorationInput("Autor"),
                  validator: (String? value) {
                    if (value == null) {
                      return "O nome do autor não pode ser vazio";
                    }
                    if (value.length < 2) {
                      return "O nome do autor é muito curto";
                    }
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  decoration: getDecorationInput("Genero"),
                  validator: (String? value) {
                    if (value == null) {
                      return "A genero não pode ser vazio";
                    }
                    if (value.length < 5) {
                      return "O nome do genero é muito curto";
                    }
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  decoration: getDecorationInput("Disponibilidade"),
                ),
                SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {
                    ButtonPressed();
                  },
                  child: const Text(
                    "Cadastrar Livro",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  ButtonPressed() {
    if (_formKey.currentState!.validate()) {
      print("Válido");
    } else {
      print("Form Inválido");
    }
  }
}
