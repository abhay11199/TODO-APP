import 'package:get/get.dart';
import 'package:todo_app/app/modules/detail/controllers/detail_controller.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailScreenController>(
      () => DetailScreenController(),
    );
  }
}
