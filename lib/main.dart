import 'package:click_me_with_getx/routes.dart';
import 'package:get/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller_binding.dart';
import 'domain/reaction_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Click Me',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialBinding: ControllerBinding(),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        return RouteGenerator.generateRoute(settings);
      },
    );
  }
}
