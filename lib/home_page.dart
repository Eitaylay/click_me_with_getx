import 'package:click_me_with_getx/domain/reaction_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ReactionController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Leaderboard'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(
                '/leaderboard',
                arguments: {
                  'result': (controller.likeCounter.value +
                          controller.loveCounter.value) -
                      controller.unlikeCounter.value
                },
              );
            },
            icon: const Icon(Icons.leaderboard),
          ),
        ],
      ),
      body: Container(
        width: double.maxFinite,
        // [double.maxFinite] width = 1.7976931348623157e+308
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: Theme.of(context).primaryColor.withOpacity(0.1),
        ),
        padding: const EdgeInsets.all(20),
        // the space between the border and the content
        margin: const EdgeInsets.all(12),
        // the space outside the border
        child: Column(
          children: [
            Text(
              'This is your Click Me post!',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 100,
            ), // an empty container
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Obx(() => Text(
                      '${controller.likeCounter}\n 👍',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 24,
                      ),
                      textAlign: TextAlign.center,
                    )),
                Obx(() => Text(
                      '${controller.loveCounter}\n 💖',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 24,
                      ),
                      textAlign: TextAlign.center,
                    )),
                Obx(() => Text(
                      '${controller.unlikeCounter}\n 👎',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 24,
                      ),
                      textAlign: TextAlign.center,
                    )),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FilledButton.icon(
            onPressed: () => controller.increaseLike(),
            icon: const Icon(
              Icons.thumb_up,
              size: 18,
            ),
            label: const Text('Like'),
          ),
          FilledButton.icon(
            onPressed: () => controller.increaseLove(),
            style: FilledButton.styleFrom(backgroundColor: Colors.green),
            icon: const Icon(
              Icons.favorite,
              size: 18,
            ),
            label: const Text('Love'),
          ),
          FilledButton.icon(
            onPressed: () => controller.increaseUnlike(),
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
