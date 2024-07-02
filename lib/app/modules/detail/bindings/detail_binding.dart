import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:todo_app/app/modules/detail/controllers/home_controller.dart';
import 'package:todo_app/app/modules/home/controllers/home_controller.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailControll>(
      () => DetailControll(),
    );
  }
}
