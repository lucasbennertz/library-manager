import 'package:flutter/material.dart';
import 'package:reserva_livros/Screens/main_screen.dart';
import 'package:reserva_livros/components/decoration_form_input.dart';
import 'package:reserva_livros/database/db_helper.dart';
import 'package:reserva_livros/models/disponibility_model.dart';
import 'package:reserva_livros/models/gender_model.dart';

class BookSignUpScreen extends StatefulWidget {
  const BookSignUpScreen({super.key});

  @override
  State<BookSignUpScreen> createState() => _BookSignUpScreenState();
}

class _BookSignUpScreenState extends State<BookSignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  List<GenderModel> generos = [];
  GenderModel? generoSelecionado;
  DisponibilityModel? disponibilidadeSelecionada;
  List<DisponibilityModel> disponibilidade = [
    DisponibilityModel(0, "Disponivel"),
    DisponibilityModel(1, "Indisponivel")
  ];
  @override
  void initState() {
    super.initState();
    _loadGenders();
  }

  /// Método assíncrono para carregar os gêneros
  Future<void> _loadGenders() async {
    try {
      // Aguarda o retorno da lista de gêneros
      List<GenderModel> genders = await DB.instance.getGenders();
      setState(() {
        generos = genders; // Atualiza o estado com os gêneros carregados
      });
    } catch (e) {
      print("Erro ao carregar gêneros: $e");
    }
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
                "Cadastro de Livros",
                style: TextStyle(color: Colors.white),
              ),
            ),
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
              const SizedBox(height: 18),
              TextFormField(
                decoration: getDecorationInput("Titulo"),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "O título não pode ser vazio";
                  }
                  if (value.length < 2) {
                    return "O título é muito curto";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: getDecorationInput("Autor"),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "O nome do autor não pode ser vazio";
                  }
                  if (value.length < 2) {
                    return "O nome do autor é muito curto";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),

              // Dropdown para os gêneros
              generos.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : DropdownButtonFormField<GenderModel>(
                      value: generoSelecionado,
                      decoration: getDecorationInput("Gênero"),
                      items: generos.map((GenderModel genero) {
                        return DropdownMenuItem<GenderModel>(
                          value: genero,
                          child: Text(genero.genderName),
                        );
                      }).toList(),
                      onChanged: (GenderModel? newValue) {
                        setState(() {
                          generoSelecionado = newValue;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return "Por favor, selecione um gênero";
                        }
                        return null;
                      },
                    ),
              const SizedBox(
                height: 8,
              ),
              DropdownButtonFormField<DisponibilityModel?>(
                  value: disponibilidadeSelecionada,
                  decoration: getDecorationInput("Disponibilidade"),
                  items:
                      disponibilidade.map((DisponibilityModel disponibilidade) {
                    return DropdownMenuItem<DisponibilityModel?>(
                      value: disponibilidade,
                      child: Text(disponibilidade.disponibilityName),
                    );
                  }).toList(),
                  onChanged: (DisponibilityModel? newValue) {
                    setState(() {
                      disponibilidadeSelecionada = newValue;
                    });
                  }),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  ButtonPressed();
                },
                child: const Text(
                  "Cadastrar Livro",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void ButtonPressed() {
    if (_formKey.currentState!.validate()) {
      print("Formulário válido");
      print("Gênero selecionado: ${generoSelecionado?.genderName}");
    } else {
      print("Formulário inválido");
    }
  }
}
