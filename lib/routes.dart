import 'package:click_me_with_getx/controller_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_page.dart';
import 'leaderboard_page.dart';

class AppRoute {
  static final List<GetPage> routes = [
    GetPage(
      name: '/',
      page: () => const HomePage(),
    ),
    GetPage(
      name: '/leaderboard',
      page: () => const LeaderboardPage(),
    ),
  ];

  static GetPage unknownRoute = GetPage(
    name: '/notfound',
    page: () => const Scaffold(
      body: Center(
        child: Text('404: Route not found!'),
      ),
    ),
  );
}
