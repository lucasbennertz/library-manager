import 'package:flutter/material.dart';
import 'package:reserva_livros/Screens/main_screen.dart';
import 'package:reserva_livros/Screens/student_sign_up_screen.dart';

void main() {
  runApp(MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MainScreen());
  }
}
