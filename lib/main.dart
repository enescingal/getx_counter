import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_counter/controller/counter_controller.dart';
import 'package:getx_counter/translate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      translations: Translate(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final CounterController _controller = Get.put(CounterController());

  get icons => "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MyColumn(),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () {
              _controller.increase();
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.black12),
              child: const Text("Increase"),
            ),
          ),
          const SizedBox(height: 8),
          InkWell(
            onTap: () {
              _controller.decrease();
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.black12),
              child: const Text("Decrease"),
            ),
          ),
          const SizedBox(height: 8),
          InkWell(
            onTap: () {
              Get.changeTheme(
                  Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.black12),
              child: const Text("Change Theme"),
            ),
          ),
          const SizedBox(height: 8),
          InkWell(
            onTap: () {
              Get.to(const NewPage());
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.black12),
              child: const Text("New Page"),
            ),
          ),
          const SizedBox(height: 8),
          InkWell(
            onTap: () {
              Get.updateLocale(Get.locale == const Locale('tr', 'TR')
                  ? const Locale('en', 'US')
                  : const Locale('tr', 'TR'));
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.black12),
              child: const Text("Change Language"),
            ),
          ),
        ],
      ),
    );
  }
}

class MyColumn extends StatelessWidget {
  CounterController _findController() => Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'hello'.tr,
          style: const TextStyle(fontSize: 18),
        ),
        Text(
          'title'.tr,
          style: const TextStyle(fontSize: 32),
        ),
        GetX<CounterController>(
          builder: (_controller2) => Text(
            _controller2.counter.toString(),
            style: const TextStyle(fontSize: 32),
          ),
        ),
        Obx((() => Text(
              _findController().counter.toString(),
              style: const TextStyle(fontSize: 32),
            ))),
      ],
    );
  }
}

class NewPage extends StatelessWidget {
  const NewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.back();
                  // Get.off dersek bir sonraki sayfa kapatır ve uygulamadan çıkar
                },
                child: const Text("Back to Home")),
            const Text("New Page"),
          ],
        ),
      ),
    );
  }
}
