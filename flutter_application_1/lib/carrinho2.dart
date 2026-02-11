import 'package:flutter/material.dart';
import 'package:flutter_application_1/my_change_notfier.dart';
import 'package:provider/provider.dart';

class Carrinho2 extends StatefulWidget {
  const Carrinho2({super.key, required this.totalProdutosCarrinho});

  final int totalProdutosCarrinho;

  @override
  State<Carrinho2> createState() => _Carrinho2State();
}

class _Carrinho2State extends State<Carrinho2> {
  @override
  Widget build(BuildContext context) {
    var myChangeNotifier = context.read<MyChangeNotfier>();
    return ListenableBuilder(
      listenable: myChangeNotifier,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Carrinho 2'),
          ),
          body: Column(
            children: [
              Text(myChangeNotifier.childAspectRatio.toString()),
              ElevatedButton(
                 onPressed: () => Navigator.of(context).pushNamed('/carrinho'),           
                child: Row(
                  children: [
                    Icon(Icons.arrow_back),
                    Text('Voltar'),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
