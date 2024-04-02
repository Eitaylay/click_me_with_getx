import 'dart:math';

import 'package:get/get.dart';

class ReactionController extends GetxController {
  var likeCounter = 0.obs;
  var loveCounter = 0.obs;
  var unlikeCounter = 0.obs;

  int get result =>
      (likeCounter.value + loveCounter.value) - unlikeCounter.value;

  void increaseLike() {
    likeCounter.value++;
  }

  void increaseLove() {
    loveCounter.value += Random().nextInt(5); // 0..4
  }

  void increaseUnlike() {
    unlikeCounter.value += Random().nextInt(20); // 0..19
  }

  void resetValues() {
    likeCounter = 0.obs;
    loveCounter = 0.obs;
    unlikeCounter = 0.obs;
  }
}
