import 'package:get/get.dart';

class Translate extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'title': 'Counter Click Number',
          'hello': 'Hello',
        },
        'tr_TR': {
          'title': 'Sayaç Tıklama Sayısı',
          'hello': 'Merhaba',
        },
      };
}
