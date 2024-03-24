import 'package:click_me_with_getx/domain/reaction_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:click_me_with_getx/controller_binding.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final reaction = Get.find<ReactionController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: const Text('Click Me'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(
                '/leaderboard',
                arguments: {
                  'result': (reaction.likeCounter.value +
                          reaction.loveCounter.value) -
                      reaction.unlikeCounter.value,
                },
              );
            },
            icon: const Icon(Icons.leaderboard),
          ),
        ],
      ),
      body: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: Theme.of(context).primaryColor.withOpacity(0.1),
        ),
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(12),
        child: Column(
          children: [
            Text(
              'This is your Click Me post!',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(
              height: 100,
            ),
            Obx(
              () {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '${reaction.likeCounter}\n 👍',
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            color: Theme.of(context).primaryColor,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '${reaction.loveCounter}\n 💖',
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            color: Colors.green,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '${reaction.unlikeCounter}\n 👎',
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            color: Colors.red,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FilledButton.icon(
            onPressed: () {
              reaction.increaseLike();
            },
            icon: const Icon(
              Icons.thumb_up,
              size: 18,
            ),
            label: const Text('Like'),
          ),
          FilledButton.icon(
            onPressed: () {
              reaction.increaseLove();
            },
            style: FilledButton.styleFrom(backgroundColor: Colors.green),
            icon: const Icon(
              Icons.favorite,
              size: 18,
            ),
            label: const Text('Love'),
          ),
          FilledButton.icon(
            onPressed: () {
              reaction.increaseUnlike();
            },
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            icon: const Icon(
              Icons.thumb_down,
              size: 18,
            ),
            label: const Text('Unlike'),
          ),
        ],
      ),
    );
  }
}
