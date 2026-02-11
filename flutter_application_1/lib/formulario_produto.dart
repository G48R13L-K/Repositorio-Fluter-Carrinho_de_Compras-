

import 'package:flutter/material.dart';
import 'package:flutter_application_1/my_change_notfier.dart';
import 'package:flutter_application_1/produto.dart';
import 'package:provider/provider.dart';

class FormularioProduto extends StatefulWidget {
  const FormularioProduto({super.key});

  @override
  State<FormularioProduto> createState() => _FormularioProdutoState();
}

class _FormularioProdutoState extends State<FormularioProduto> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController descricaoController = TextEditingController();
  final TextEditingController precoController = TextEditingController();
  final FormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulario produtos"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: FormKey,
          child: Column(
            spacing: 8,
            children: [
              TextFormField(
                controller: idController,
                decoration: InputDecoration(
                  labelText: 'Id',
                  border: OutlineInputBorder()
                ),
                validator: (value){
                  if(int.tryParse(value ?? '') == null){
                    return 'Id do produto deve ser um número inteiro.';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: descricaoController,
                decoration: InputDecoration(
                  labelText: 'Descrição do produto',
                  border: OutlineInputBorder()
                ),
                validator: (value){
                  if(value != null){
                    if(value.isEmpty){
                      return 'A descrição não pode estar vazia.';
                    }
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: precoController,
                decoration: InputDecoration(
                  labelText: 'Preço',
                  border: OutlineInputBorder()
                ),
                validator: (value){
                  if(double.tryParse(value ?? '') == null){
                    return 'O preço do produto deve ser um número decimal.';
                  }
                  final preco = double.parse(value!);
                  if(preco < 0){
                    return 'O preço não pode ser negativo.';
                  }
                  return null;
                },
              ),

              ElevatedButton(onPressed: () {
                // print('Id: ${idController.text}');
                // print('Descrição: ${descricaoController.text}');
                // print('Preço: ${precoController.text}');
                if(FormKey.currentState!.validate()){
                  context.read<MyChangeNotfier>().produtos.add(Produto(id: int.parse(idController.text),
                    descricao: descricaoController.text,
                    preco: double.parse(precoController.text)
                  )
                  ); 
              }
              }, 
               child: Text('Submeter')
              )
            ],
          ),
        ),
      )
    );
  }
}