import 'package:flutter/material.dart';
import 'package:flutter_application_1/carrinho2.dart';
import 'package:flutter_application_1/carrinho2_arguments.dart';
import 'package:flutter_application_1/my_change_notfier.dart';
import 'package:provider/provider.dart';

class Carrinho extends StatefulWidget {
  const Carrinho({super.key});

  @override
  State<Carrinho> createState() => _CarrinhoState();
}

class _CarrinhoState extends State<Carrinho> {
  @override
  Widget build(BuildContext context) {
    MyChangeNotfier myChangeNotfier = context.read();

    const TextStyle estiloTexto = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );

    return ListenableBuilder(
      listenable: myChangeNotfier,
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          title: Row(
            spacing: 8,
            children: [
              Text(
                myChangeNotfier.carrinho.isNotEmpty
                    ? myChangeNotfier
                          .carrinho //
                          .map((e) => e.preco)
                          .reduce((value, element) => value + element)
                          .toStringAsFixed(2)
                    : 'Sem produtos no carrinho',
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Text('Largura da tela: ${MediaQuery.of(context).size.width.toStringAsFixed(2)}'),
              ),
              RadioGroup(
                groupValue: myChangeNotfier.childAspectRatio,
                onChanged: (value) {
                  myChangeNotfier.onChanged(value);
                },
                child: Row(
                  spacing: 8,
                  children: [
                    Radio.adaptive(value: 1.0),
                    Text('1 / 1'),

                    Radio.adaptive(value: 4 / 3),
                    Text('4/3'),
                    Radio.adaptive(value: 16 / 9),
                    Text('16/9'),
                  ],
                ),
              ),
            ],
          ),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Column(
          children: [
            ElevatedButton(
              // onPressed: () => Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) => Carrinho2(),
              //   ),
              // ),
              onPressed: () => Navigator.of(context).pushNamed('/carrinho2'),
              child: Text('Navegar Carrinho 2'),
            ),
            ElevatedButton(
              onPressed: () =>
                  Navigator.of(
                    context,
                  ).pushReplacementNamed(
                    '/carrinho2',
                    arguments: Carrinho2Arguments(totalProdutosCarrinho: myChangeNotfier.carrinho.length),
                  ),
              child: Text('Navegar Carrinho 2 (pushReplacement)'),
            ),

            Expanded(
              child: GridView.count(
                childAspectRatio: myChangeNotfier.childAspectRatio,
                crossAxisCount: 2,
                children: myChangeNotfier.produtos.map(
                  (e) {
                    // return Text(e.descricao);
                    final bool produtoPresenteNoCarrinho = myChangeNotfier
                        .carrinho //
                        .where((element) => element.id == e.id)
                        .isNotEmpty;
                    return LayoutBuilder(
                      builder: (context, constraints) => GestureDetector(
                        onTap: () {
                          setState(() {
                            produtoPresenteNoCarrinho ? myChangeNotfier.carrinho.remove(e) : myChangeNotfier.carrinho.add(e);
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 8.0,
                            children: [
                              Text('Largura do componente: ${constraints.maxWidth}'),
                              Text('Altura do componente: ${constraints.maxHeight}'),
                              Text(
                                e.id.toString(),
                                style: estiloTexto,
                              ),
                              Text(
                                e.descricao,
                                style: estiloTexto,
                              ),
                              Text(
                                e.preco.toStringAsFixed(2),
                                style: estiloTexto,
                              ),
                              produtoPresenteNoCarrinho
                                  ? Icon(Icons.shopping_cart_outlined, color: Colors.green)
                                  : Icon(Icons.cancel, color: Colors.red),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
