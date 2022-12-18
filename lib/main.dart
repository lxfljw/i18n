import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

void main() => runApp(const MyApp());

class Controller extends GetxController {
  var count = 0.obs;
  increment() => count++;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // locale: const Locale('zh', ''),
      localizationsDelegates: const [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('zh', ''),
      ],
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(context) {
    final Controller c = Get.put(Controller());
    return Scaffold(
      appBar: AppBar(title: const Text("国际化案例1")),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(AppLocalizations.of(context)!.helloWorld),
            FloatingActionButton(
                child: const Icon(Icons.add), onPressed: c.increment),
            Obx(() => Text("${c.count}")),
            newMethod(context)
          ],
        ),
      ),
      drawer: Drawer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('选择语言'),
              ElevatedButton(onPressed: () {}, child: const Text('简体中文')),
              ElevatedButton(onPressed: () {}, child: const Text('英语')),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton newMethod(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          showTimePicker(context: context, initialTime: TimeOfDay.now());
        },
        child: Text(AppLocalizations.of(context)!.selectTime));
  }
}
