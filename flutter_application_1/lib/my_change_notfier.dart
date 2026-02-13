import 'package:flutter/material.dart';
import 'package:flutter_application_1/produto.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MyChangeNotfier extends ChangeNotifier {
  List<Produto> produtos = [];
  List<Produto> carrinho = [];
  double childAspectRatio = 1.0;

  void onChanged(double? value) {
    if (value != null) {
      childAspectRatio = value;
      notifyListeners();
    }
  }

  Future<void> fetchProductsFromSupabase() async{
    final supabase = Supabase.instance.client;
    produtos.clear();
    produtos.addAll(
      (await supabase.from('produtos').select() as List).map(
        (element) {
          return Produto(
            id: element['id'],
            descricao: element['descricao'], 
            preco: element['preco'],
          );
        },
      ).toList(),
    );
    notifyListeners();
  }
  Future<void> insertProfuctsIntoSupabase({required Produto produtos}) async{
    final supabase = Supabase.instance.client;
    await supabase.from('produtos').insert({
      'id': produtos.id,
      'descricao': produtos.descricao,
      'preco': produtos.preco,
    });
  }
}
