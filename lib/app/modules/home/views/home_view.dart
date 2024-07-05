import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/constants/app_config.dart';
import 'package:todo_app/app/constants/colors.dart';
import 'package:todo_app/app/modules/home/controllers/home_controller.dart';
import 'package:todo_app/app/modules/todo_bottom_sheet.dart';
import 'package:todo_app/app/routes/app_pages.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final homeController = Get.isRegistered<HomeController>()
      ? Get.find<HomeController>()
      : Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    AppConfig appConfig = AppConfig(context);
    if (Get.arguments != null) {
      var args = Get.arguments;
      print(args);
      homeController.titleController.value.text = args.title;
      homeController.descriptionController.value.text = args.description;
      homeController.selectedTime.value = args.time;
      homeController.statusController.value = args.status;
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whitecolor,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return const AddTodoBttomSheet(
                  forEdit: false,
                );
              },
            );
          },
          backgroundColor: AppColors.blackColor,
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          backgroundColor: AppColors.blackColor,
          title: Text(
            'TODO LIST',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.whitecolor,
                fontSize: appConfig.textSizeScale(18)),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(appConfig.rWP(4)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(right: appConfig.rWP(64)),
                child: Text(
                  'ADD TASK',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: appConfig.textSizeScale(20),
                  ),
                ),
              ),
              SizedBox(
                height: appConfig.deviceHeight(2),
              ),
              Expanded(
                child: GetBuilder<HomeController>(builder: (controller) {
                  return ListView.builder(
                    itemCount: controller.todos.length,
                    shrinkWrap: true,
                    itemBuilder: (context, i) {
                      var todo = controller.todos[i];
                      return Padding(
                        padding: EdgeInsets.only(top: appConfig.rHP(1)),
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.DETAIL_SCREEN, arguments: todo);
                          },
                          child: Container(
                            height: appConfig.deviceHeight(12),
                            width: appConfig.deviceWidth(100),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: AppColors.backgroundColor,
                                border:
                                    Border.all(color: AppColors.blackColor)),
                            child: Padding(
                              padding: EdgeInsets.only(left: appConfig.rWP(2)),
                              child: Padding(
                                padding: EdgeInsets.all(appConfig.rWP(2)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          todo.title,
                                          style: TextStyle(
                                              color: AppColors.blackColor,
                                              fontSize:
                                                  appConfig.textSizeScale(15),
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Status: in progress",
                                          style: TextStyle(
                                            color: AppColors.blackColor,
                                            fontSize:
                                                appConfig.textSizeScale(10),
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            homeController.deleteTodo(todo);
                                          },
                                          icon: Icon(
                                            Icons.delete_outline,
                                            color: AppColors.redColor,
                                            size: appConfig.deviceWidth(6),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          todo.description,
                                          style: TextStyle(
                                            color: AppColors.blackColor,
                                            fontSize:
                                                appConfig.textSizeScale(10),
                                          ),
                                        ),
                                        Text(
                                          'Time:  ${todo.time}',
                                          style: TextStyle(
                                            color: AppColors.blackColor,
                                            fontSize:
                                                appConfig.textSizeScale(10),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<Duration?> showCupertinoDurationPicker({
  required BuildContext context,
  required Duration initialDuration,
}) {
  return showDialog<Duration>(
    context: context,
    builder: (BuildContext context) {
      Duration selectedDuration = initialDuration;
      return Center(
        child: AlertDialog(
          title: const Text('Select Time'),
          content: Container(
            height: 200,
            child: CupertinoTimerPicker(
              mode: CupertinoTimerPickerMode.ms,
              initialTimerDuration: initialDuration,
              onTimerDurationChanged: (Duration duration) {
                selectedDuration = duration;
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(null);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(selectedDuration);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    },
  );
}
