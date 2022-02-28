import 'package:get/get.dart';

import 'dashboard_controller.dart';

class DashBoardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashBoardController>(() => DashBoardController());
  }
}