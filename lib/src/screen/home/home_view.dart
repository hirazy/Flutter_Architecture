import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/src/data/model/message.dart';
import 'package:flutter_map/src/screen/home/home_controller.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  @override
  HomeViewState createState() {
    return HomeViewState();
  }
}

class HomeViewState extends State<HomeView> {
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {

    HomeController controller =
        Get.put(HomeController(), tag: 'instance_1', permanent: true);
    
    Get.lazyPut(() => HomeController());

    return GetMaterialApp(
      translations: Message(),
      locale: Locale('en', 'US'),
      fallbackLocale: Locale('en', 'US'),
      title: "Internationalization",
      home: Scaffold(
        body: Column(
          children: [

            RaisedButton(onPressed: (){
              _homeController.changeLanguage('hi', 'IN');
              // context.read<>().();
              Get.find<HomeController>(tag: 'instance_1').changeLanguage('', '');
            })
          ],
        ),
      ),
    );
  }
}
