import 'package:click_me_with_getx/domain/reaction_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LeaderboardPage extends StatelessWidget {
  const LeaderboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    int result = arguments?['result'] ?? 0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Leaderboard'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Your result'),
            Text(
              result < 0 ? '$result' : "+$result",
              style: TextStyle(
                fontSize: 100,
                color: result >= 100
                    ? Colors.green
                    : (result >= 50 ? Colors.indigo : Colors.red),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            if (result < -20 && result < 0)
              Text(
                'Sorry! You have many haters 🥺',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            if (result <= 0 && result > -20)
              Text(
                'Not so bad😐',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            if (result > 0 && result < 20)
              Text(
                'You are good!😊',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            if (result > 80)
              Text(
                'Wow! You are a celebrity 😳',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            const SizedBox(
              height: 50,
            ),
            FilledButton(
              onPressed: () {
                Get.find<ReactionController>().resetValues();
                Get.offAllNamed(
                  '/',
                );
              },
              child: const Text('Restart'),
            ),
          ],
        ),
      ),
    );
  }
}
