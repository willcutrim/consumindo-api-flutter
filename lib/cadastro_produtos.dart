import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_api_local/model_produtos.dart';
import 'package:flutter_api_local/services.dart';
import 'package:http/http.dart' as http;

import 'main.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final _nome = TextEditingController();
  final _valor = TextEditingController();
  final _desc = TextEditingController();

  late Produtos _produtos;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _nome,
              cursorColor: Colors.white,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10)),
                label: Padding(
                  padding: EdgeInsetsDirectional.only(start: 10),
                  child: Text(
                    'Nome do produto',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _desc,
              cursorColor: Colors.white,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10)),
                label: Padding(
                  padding: EdgeInsetsDirectional.only(start: 10),
                  child: Text(
                    'Descrição',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _valor,
              cursorColor: Colors.white,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10)),
                label: Padding(
                  padding: EdgeInsetsDirectional.only(start: 10),
                  child: Text(
                    'Valor',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final String nome = _nome.text;
          final String desc = _desc.text;
          final String valor = _valor.text;

          final Produtos produtos = await cadastroProdutos(nome, desc, valor);

          setState(() {
            _produtos = produtos;
          });
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
