import 'package:flutter/material.dart';
import 'package:flutter_application_1/produto.dart';

class MyChangeNotfier extends ChangeNotifier {
  List<Produto> produtos = [
    Produto(id: 1, descricao: 'Coxinha', preco: 7.0),
    Produto(id: 2, descricao: 'Pão de queijo', preco: 7.5),
    Produto(id: 3, descricao: 'Suco de Laranja', preco: 5.0),
    Produto(id: 4, descricao: 'Refrigerante', preco: 6.0),
    Produto(id: 5, descricao: 'Brigadeiro', preco: 4.0),
  ];
  List<Produto> carrinho = [];
  double childAspectRatio = 1.0;

  void onChanged(double? value) {
    if (value != null) {
      childAspectRatio = value;
      notifyListeners();
    }
  }
}
