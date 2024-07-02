import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
