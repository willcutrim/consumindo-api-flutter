import 'package:flutter/material.dart';
import 'package:flutter_api_local/app/models/model_produtos.dart';

class EditarProduto extends StatefulWidget {
  const EditarProduto({Key? key}) : super(key: key);

  @override
  State<EditarProduto> createState() => _EditarProdutoState();
}

class _EditarProdutoState extends State<EditarProduto> {
  late Produtos produto;
  final _nome = TextEditingController();
  final _valor = TextEditingController();
  final _desc = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nome.text = produto.nome!;
    _valor.text = produto.preco!;
    _desc.text = produto.descricao!;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
