import 'package:flutter_map/src/screen/home/home_binding.dart';
import 'package:flutter_map/src/screen/home/home_view.dart';
import 'package:get/get.dart';

import 'app_routes.dart';

class AppPages {

  AppPages._();

  static const INITIAL = Routes.MAIN;

  static final routes = [
    GetPage(
        page: () => HomeView(),
        name: Paths.HOME,
      binding: HomeBinding()
    ),
    GetPage(
        page: () => HomeView(),
        name: Paths.HOME,
        binding: HomeBinding()
    ),
    GetPage(
        page: () => HomeView(),
        name: Paths.HOME,
        binding: HomeBinding()
    )
  ];
}