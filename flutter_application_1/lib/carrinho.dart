import 'package:flutter/material.dart';
import 'package:flutter_application_1/produto.dart';

class Carrinho extends StatefulWidget {
  const Carrinho({super.key});

  @override
  State<Carrinho> createState() => _CarrinhoState();
}

class _CarrinhoState extends State<Carrinho> {
  List<Produto> produtos = [];
  List<Produto> carrinho = [];

  @override
  void initState() {
    super.initState();
    produtos = [
      Produto(id: 1, descricao: 'Coxinha', preco: 7.0),
      Produto(id: 2, descricao: 'Pão de queijo', preco: 7.5),
      Produto(id: 3, descricao: 'Suco de Laranja', preco: 5.0),
      Produto(id: 4, descricao: 'Refrigerante', preco: 6.0),
      Produto(id: 5, descricao: 'Brigadeiro', preco: 4.0),
    ];
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle estiloTexto = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );
    const TextStyle estiloPreco = TextStyle(
      fontSize: 16,
      color: Colors.grey,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          carrinho.isEmpty
              ? 'Total: R\$ 0.00'
              : 'Total: R\$ ${carrinho.map((e) => e.preco).reduce((value, element) => value + element).toStringAsFixed(2)}',
        ),
      ),

      body: GridView.count(
        crossAxisCount: 2,
        children: produtos.map((e) {
          final bool produtoEmCarrinho = carrinho.where((element) => element.id == e.id).isNotEmpty;
          return GestureDetector(
            onTap: () {
              setState(() {
                if (produtoEmCarrinho == false) {
                  carrinho.add(e);
                } else {
                  carrinho.remove(e);
                }
              });
            },
            child: Container(
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.orangeAccent),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                spacing: 8,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    e.descricao,
                    style: estiloTexto,
                  ),
                  Text(
                    'R\$ ${e.preco.toStringAsFixed(2)}',
                    style: estiloPreco,
                  ),
                  produtoEmCarrinho
                      ? Icon(Icons.remove_shopping_cart, color: Colors.red) //
                      : Icon(Icons.add_shopping_cart),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
