import 'package:flutter_api_local/app/views/cadastro_produtos.dart';

import 'package:flutter/material.dart';
import 'package:flutter_api_local/routes/app_pages.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    title: 'Consumo API',
    debugShowCheckedModeBanner: false,
    getPages: AppPages.routes,
  ));
}
