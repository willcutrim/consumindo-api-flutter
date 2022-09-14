import 'package:flutter_api_local/cadastro_produtos.dart';

import 'package:flutter/material.dart';
import 'package:flutter_api_local/model_produtos.dart';
import 'package:flutter_api_local/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

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
                  Produtos produtos = snapchot.data![index];
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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CadastroPage()),
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
