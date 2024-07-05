import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/models/todo_data_model.dart';
import 'package:todo_app/app/modules/detail/controllers/detail_controller.dart';
import 'package:todo_app/app/services/db_helper.dart';

class HomeController extends GetxController {
  var titleController = TextEditingController().obs;
  var descriptionController = TextEditingController().obs;
  var todos = <TodoDataModel>[].obs;
  var statusController = "".obs;

  RxInt selectedTime = 0.obs;

  void add() {
    if (selectedTime.value < 5) {
      selectedTime.value++;
    }
  }

  void subtract() {
    if (selectedTime.value > 1) {
      selectedTime.value--;
    }
  }

  final RxList<Map<String, dynamic>> itemlist = <Map<String, dynamic>>[].obs;
  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    todos.value = [];
    super.onInit();
    fetchTodos();
  }

  fetchTodos() async {
    DatabaseHelper.db.getTodoList().then((todoList) => {
          todos.value = todoList,
          update(),
        });
  }

  void addTodo(TodoDataModel todo) {
    if (todo.id != null) {
      print("Inside add todo and id is not null ${todo.id}");
      DatabaseHelper.db.updateTodo(todo).then((value) {
        updateTodo(todo);
      });
    } else {
      DatabaseHelper.db.insertTodo(todo).then((value) => todos.add(todo));
    }
  }

  void deleteTodo(TodoDataModel todo) {
    DatabaseHelper.db.deleteTodo(todo.id!).then((_) => todos.remove(todo));
    fetchTodos();
    update();
  }

  void updateList(TodoDataModel todo) async {
    var result = await fetchTodos();
    if (result != null) {
      final index = todos.indexOf(todo);
      print(index);
      todos[index] = todo;
    }
  }

  void updateTodo(TodoDataModel todo) {
    DatabaseHelper.db.updateTodo(todo).then((value) => updateList(todo));
  }

  void handleAddButton({int? id}) {
    print(id);
    var todo = TodoDataModel(
      title: titleController.value.text,
      description: descriptionController.value.text,
      time: selectedTime.value,
      status: id == null ? 'Todo' : statusController.value,
    );

    if (id == null) {
      addTodo(todo);
    } else {
      todo.id = id;
      updateTodo(todo);
      if (Get.isRegistered<DetailScreenController>()) {
        final detailScreenController = Get.find<DetailScreenController>();
        detailScreenController.updateTodoData(todo);
      }
    }
    titleController.value.text = "";
    descriptionController.value.text = "";
    selectedTime.value = 0;
    statusController.value = "";
  }
}
