import 'package:flutter/material.dart';
import 'package:flutter_application_1/carrinho.dart';
import 'package:flutter_application_1/carrinho2.dart';
import 'package:flutter_application_1/carrinho2_arguments.dart';
import 'package:flutter_application_1/formulario_produto.dart';
import 'package:flutter_application_1/my_change_notfier.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (contex) => MyChangeNotfier()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => Carrinho(),
      //   '/carrinho2': (context) => Carrinho2(),
      // },
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
         return MaterialPageRoute(
            builder: (context) {
              return Carrinho(
                
              );
            },
          ); 
        }
        if (settings.name == '/carrinho2') {
          final args = settings.arguments as Carrinho2Arguments;

          return MaterialPageRoute(
            builder: (context) {
              return Carrinho2(
                totalProdutosCarrinho: args.totalProdutosCarrinho,
              );
            },
          );
        }
        if (settings.name == '/formulario-produto'){
           return MaterialPageRoute(
            builder: (context) {
              return FormularioProduto();
            },
          );
        }
      },
    );
  }
}
