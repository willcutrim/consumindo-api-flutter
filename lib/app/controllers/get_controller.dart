import 'package:flutter_api_local/app/controllers/services.dart';
import 'package:flutter_api_local/app/models/model_produtos.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Produtos produtos = Produtos();

  // Future id = deleteProduto(produtos.id.toString());

  final delete = Get.delete();
}
