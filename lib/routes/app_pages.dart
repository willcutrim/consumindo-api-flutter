import 'package:flutter_api_local/app/views/home_page.dart';

import 'package:flutter_api_local/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => MyHomePage(),
    ),
  ];
}
