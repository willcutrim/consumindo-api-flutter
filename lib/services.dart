import 'package:flutter/material.dart';
import 'package:flutter_api_local/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_api_local/model_produtos.dart';

// Listando todos os produtos
Future<List<Produtos>> pegarProdutos() async {
  var url = Uri.parse('http://127.0.0.1:8000/api/produtos/');
  var response = await http.get(url);
  final status = response.statusCode;
  final body = response.body;

  if (status == 200) {
    List listaProdutos = jsonDecode(body);
    return listaProdutos.map((json) => Produtos.fromJson(json)).toList();
  } else {
    throw Exception('Deu B.O');
  }
}

// Excluindo produtos por ID
Future deleteProduto(
  String id,
) async {
  var url = Uri.parse('http://127.0.0.1:8000/api/produtos/${id}/');
  var response = await http.delete(url);
  if (response.statusCode == 204) {
    print('sucesso!');
  } else {
    throw "deu merda";
  }
}

Future<dynamic> cadastroProdutos(
    String _nome, String _desc, String _valor) async {
  var url = Uri.parse('http://127.0.0.1:8000/api/produtos/');
  var response = await http.post(
    url,
    body: {
      "nome": _nome,
      "descricao": _desc,
      "preco": _valor,
    },
  );
  if (response.statusCode == 201) {
    final List<dynamic> decodedJson = jsonDecode(response.body);
    final Map<String, dynamic> responseString = jsonDecode(response.body);
    print(decodedJson.length);
    return decodedJson.map((json) => Produtos.fromJson(json)).toString();
  } else {
    throw Exception('errorr');
  }
}
