import 'package:get/get.dart';


class Message extends Translations{
  late String text;

  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'hello': 'Hello'
    },
  };
}