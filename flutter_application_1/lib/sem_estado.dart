import 'package:flutter/material.dart';

class SemEstado extends StatelessWidget {
  const SemEstado({super.key, required this.data});

  final String data;

  @override
  Widget build(BuildContext context) {
    return Text(data);
  }
}