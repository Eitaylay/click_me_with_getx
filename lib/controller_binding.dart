import 'package:click_me_with_getx/domain/reaction_controller.dart';
import 'package:get/get.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ReactionController());
  }
}
