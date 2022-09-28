import 'package:flutter/material.dart';
import 'package:flutter_api_local/app/controllers/services.dart';
import 'package:flutter_api_local/app/models/model_produtos.dart';
import 'package:flutter_api_local/app/views/cadastro_produtos.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Produtos>> produtos;

  @override
  void initState() {
    super.initState();
    produtos = pegarProdutos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('produtos'),
      ),
      body: Center(
        child: FutureBuilder<List<Produtos>>(
          future: produtos,
          builder: (context, snapchot) {
            if (snapchot.hasData) {
              return ListView.builder(
                itemCount: snapchot.data!.length,
                itemBuilder: (context, index) {
                  var produtos = snapchot.data![index];
                  return ListTile(
                    title: Text(produtos.nome!),
                    subtitle: Text(produtos.descricao!),
                    trailing: IconButton(
                      onPressed: () async {
                        final Produtos _produto =
                            await deleteProduto(produtos.id.toString());
                      },
                      icon: Icon(
                        Icons.delete,
                      ),
                    ),
                  );
                },
              );
            } else if (snapchot.hasError) {
              return Text(snapchot.error.toString());
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => CadastroPage(), fullscreenDialog: true);
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
