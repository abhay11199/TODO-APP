import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/services/db_helper.dart';

class HomeController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController minuteController = TextEditingController();
  TextEditingController secondController = TextEditingController();
}

class TimePickerController extends GetxController {
  var selectedTime = TimeOfDay.now().obs;

  void updateSelectedTime(TimeOfDay time) {
    selectedTime.value = time;
  }

  Rx<Duration> selectedDuration = Duration(minutes: 0).obs;

  void updateSelectedDuration(Duration duration) {
    selectedDuration.value = duration;
  }
}

class JournalsController extends GetxController {
  final RxList<Map<String, dynamic>> journals = <Map<String, dynamic>>[].obs;
  final RxBool isLoading = true.obs;

  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    _refreshJournals();
  }

  // void _showForm(int? id) async {
  //   if (id != null) {
  //     final existingJournal =
  //     journals.firstWhereOrNull((element) => element['id'] == id);
  //     titleController.text = existingJournal!['title'];
  //     descriptionController.text = existingJournal['description'];
  //   }
  // }

  void _refreshJournals() async {
    try {
      final data = await DatabaseHelper.getItems();
      journals.assignAll(data);
    } finally {
      isLoading.value = false;
    }
  }
}
