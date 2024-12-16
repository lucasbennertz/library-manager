import 'package:flutter/material.dart';
import 'package:reserva_livros/Screens/main_screen.dart';
import '../components/decoration_form_input.dart';

class StudentSignUpScreen extends StatefulWidget {
  StudentSignUpScreen({super.key});

  @override
  State<StudentSignUpScreen> createState() => _StudentSignUpScreenState();
}

class _StudentSignUpScreenState extends State<StudentSignUpScreen> {
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
              "Cadastro de Alunos",
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
                "assets/estudanteLogo.png",
                width: 256,
              ),
              SizedBox(
                height: 36,
              ),
              TextFormField(
                decoration: getDecorationInput("Nome"),
                validator: (String? value) {
                  if (value == null) {
                    return "O nome não pode ser vazio";
                  }
                  if (value.length < 2) {
                    return "O nome é muito curto";
                  }
                },
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                decoration: getDecorationInput("Matricula"),
                validator: (String? value) {
                  if (value == null) {
                    return "A matricula não pode ser vazio";
                  }
                  if (value.length < 5) {
                    return "A matricula deve haver no minimo 5 caracteres";
                  }
                },
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                decoration: getDecorationInput("Email"),
                validator: (String? value) {
                  if (value == null) {
                    return "O email não pode ser vazio";
                  }
                  if (value.length < 5) {
                    return "O email deve haver no minimo 5 caracteres";
                  }
                  if (value.contains("@")) {
                    return "O email não é valido";
                  }
                },
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
                  "Cadastrar Aluno",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  ButtonPressed() {
    if (_formKey.currentState!.validate()) {
      print("Válido");
    } else {
      print("Form Inválido");
    }
  }
}
