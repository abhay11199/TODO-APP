import 'package:get/get.dart';
import 'package:todo_app/app/models/todo_data_model.dart';

class DetailScreenController extends GetxController {
  var todoDataModel =
      TodoDataModel(title: 'title', description: 'description', time: 0).obs;

  @override
  void onInit() {
    if (Get.arguments != null && Get.arguments is TodoDataModel) {
      todoDataModel.value = Get.arguments as TodoDataModel;
    }
    super.onInit();
  }

  void updateTodoData(TodoDataModel todo) {
    todoDataModel.value = todo;
  }
}
