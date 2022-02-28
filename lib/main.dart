import 'package:flutter/material.dart';
import 'package:flutter_map/src/my_controller.dart';

import 'package:flutter_map/src/screen/dashboard/dashboard_view.dart';
import 'package:flutter_map/src/screen/dashboard/dashboard_binding.dart';
import 'package:flutter_map/src/screen/home/home_view.dart';
import 'package:flutter_map/src/screen/login/login_view.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class Controller extends GetxController {
  var count = 0;

  void increment() {
    count++;
    update();
  }
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Controller());

    return GetMaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: [
      ],
      supportedLocales: [
        const Locale('en', 'US'), // 美国英语
        const Locale('vi', 'VN'), // 中文简体
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      getPages: [
        GetPage(name: '/', page: () => HomeView()),
        GetPage(name: '/login', page: () => Login()),
        GetPage(name: '/dashboard', page: () => DashBoard(), binding: DashBoardBinding())
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  MyController myController = Get.put(MyController());

  void _incrementCounter() {
    Get.find<MyController>().convertToUpperCase();
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Controller c = Get.put(Controller());
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Obx(() => Text("Clicks: ${myController.student.value.name}")),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            RaisedButton(onPressed: () {
              myController.convertToUpperCase();

              Get.find<MyController>().increment();
            }),

            GetBuilder<MyController>(
              init: MyController(),
              builder: (controller){
                return Container(
                  child: Text(
                   "The value is ${controller.count}"
                  ),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
