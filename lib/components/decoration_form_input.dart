import 'package:flutter/material.dart';

InputDecoration getDecorationInput(String label) {
  return InputDecoration(
      hintText: label,
      fillColor: Colors.white,
      filled: true,
      contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(64)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(64),
        borderSide: BorderSide(color: Colors.black, width: 2),
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(64),
          borderSide: BorderSide(color: Colors.blue.shade900, width: 4)));
}
