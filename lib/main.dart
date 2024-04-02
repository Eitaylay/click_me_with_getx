import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:click_me_with_getx/routes.dart';
import 'package:click_me_with_getx/controller_binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Click Me',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialBinding: ControllerBinding(), // optional binding
      getPages: AppRoute.routes,
      unknownRoute: AppRoute.unknownRoute,
    );
  }
}
