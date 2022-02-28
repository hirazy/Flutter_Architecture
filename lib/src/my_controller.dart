import 'package:get/get.dart';

import 'data/model/student.dart';

class MyController extends GetxController {
  // var student = Student();
  //
  // void convertToUpperCase(){
  //   student.name.value = student.name.value.toUpperCase();
  // }
  int get count => _counter;

  int _counter = 0;

  var countX = 0.obs;

  var countPlus = 0.obs;

  var student = Student(name: "Tom", age: 25).obs;

  void convertToUpperCase() {
    student.update((student) {
      student!.name = student.name.toString().toUpperCase();
    });
  }

  void increment() async {
    await Future<int>.delayed(const Duration(seconds: 5));
    _counter++;
    update([]);
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onInit() {
    super.onInit();

    // called every time when the value of count variable changes
    ever(countX, (_) => print(countX));

    ever(countPlus, (_) => print(countX));

    // Called every time when the value of any variable from the list changes
    everAll([countX],(_) => print(countX));

    once(countX, (_) => print(countX));

    debounce(countX, (_) => print("When the user stop typing for 1 sec value of countX"));

    interval(countX, (_) => print("Ignore all changes"), time: Duration(seconds: 3));
  }

  @override
  void onClose() {
    _counter = 0;
    super.onClose();
  }
}
