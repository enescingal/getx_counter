// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  var _counter = 0.obs;

  int counterValue() {
    return _counter.value;
  }

  void newCounterValue(newValue) {
    _counter.value = newValue;
  }

  get counter => _counter.value;

  set counter(newValue) => _counter.value = newValue;

  void increase() {
    counter = counter + 1;
    Get.snackbar("Increase", "Counter Increase",
        backgroundColor: Colors.blueGrey);
  }

  void decrease() {
    counter = counter - 1;
    Get.showSnackbar(GetBar(
      title: "Decrease",
      message: "Counter Decrease",
      duration: const Duration(seconds: 1),
      isDismissible: true,
      backgroundColor: Colors.blueGrey,
    ));
  }
}
