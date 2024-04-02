import 'package:click_me_with_getx/domain/reaction_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LeaderboardPage extends StatelessWidget {
  const LeaderboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Leaderboard'),
        centerTitle: true,
      ),
      body: Center(
        child: GetBuilder<ReactionController>(
          builder: (controller) {
            int result = Get.arguments['result'] as int;

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Your result'),
                Text(
                  result > 0 ? '+$result' : "$result",
                  style: TextStyle(
                    fontSize: 100,
                    color: result >= 100
                        ? Colors.green
                        : (result >= 50 ? Colors.yellow : Colors.red),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                if (result >= 100)
                  Text(
                    'Wow! You are a celebrity 😳',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                if (result > 0)
                  Text(
                    'You are good!😊',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                if (result <= 0)
                  Text(
                    'Sorry! You have many haters 🥺',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                const SizedBox(
                  height: 50,
                ),
                FilledButton(
                  onPressed: () {
                    Get.offAllNamed(
                      '/',
                    );
                    Get.find<ReactionController>().resetValues();
                  },
                  child: const Text('Restart'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
