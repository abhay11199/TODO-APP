import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/constants/app_config.dart';
import 'package:todo_app/app/constants/colors.dart';
import 'package:todo_app/app/modules/home/controllers/home_controller.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final homeController = Get.isRegistered<HomeController>()
      ? Get.find<HomeController>()
      : Get.put(HomeController());

  final _formkey = GlobalKey<FormState>();

  TimeOfDay selectedTime = TimeOfDay.now();
  final TimePickerController _timePickerController =
      Get.put(TimePickerController());

  @override
  Widget build(BuildContext context) {
    AppConfig appConfig = AppConfig(context);
    return Scaffold(
      backgroundColor: AppColors.whitecolor,
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
              padding: EdgeInsets.only(right: appConfig.rWP(65)),
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
            Container(
              height: appConfig.deviceHeight(12),
              width: appConfig.deviceWidth(100),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: AppColors.backgroundColor,
                  border: Border.all(color: AppColors.blackColor)),
              child: Padding(
                padding: EdgeInsets.only(left: appConfig.rWP(2)),
                child: Padding(
                  padding: EdgeInsets.all(appConfig.rWP(2)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'TITLE:',
                              style: TextStyle(
                                  color: AppColors.blackColor,
                                  fontSize: appConfig.textSizeScale(15),
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'STATUS:',
                              style: TextStyle(
                                color: AppColors.blackColor,
                                fontSize: appConfig.textSizeScale(10),
                              ),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.delete_outline,
                                  color: AppColors.greycolor,
                                  size: appConfig.deviceWidth(6),
                                ))
                          ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'DESCRIPTION:',
                            style: TextStyle(
                              color: AppColors.blackColor,
                              fontSize: appConfig.textSizeScale(10),
                            ),
                          ),
                          Text(
                            'TIMER:',
                            style: TextStyle(
                              color: AppColors.blackColor,
                              fontSize: appConfig.textSizeScale(10),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(),
            FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: Container(
                        height: appConfig.deviceHeight(55),
                        color: AppColors.backgroundColor,
                        child: Column(
                          children: [
                            Form(
                              key: _formkey,
                              child: Padding(
                                padding: EdgeInsets.all(appConfig.rWP(4)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Title',
                                      style: TextStyle(
                                          color: AppColors.blackColor,
                                          fontSize: appConfig.textSizeScale(20),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: appConfig.deviceHeight(2),
                                    ),
                                    Container(
                                      width: appConfig.deviceWidth(90),
                                      padding: EdgeInsets.only(
                                        left: appConfig.deviceWidth(3),
                                      ),
                                      decoration: BoxDecoration(
                                          color: AppColors.greycolor,
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter a title';
                                          }
                                          return null;
                                        },
                                        cursorColor: AppColors.primaryColor,
                                        controller:
                                            homeController.titleController,
                                        keyboardType: TextInputType.name,
                                        decoration: InputDecoration(
                                            hintText: 'title',
                                            border: InputBorder.none,
                                            hintStyle: TextStyle(
                                              fontSize:
                                                  appConfig.textSizeScale(15),
                                              color: AppColors.whitecolor,
                                            ),
                                            alignLabelWithHint: true),
                                      ),
                                    ),
                                    SizedBox(
                                      height: appConfig.deviceHeight(2),
                                    ),
                                    Text(
                                      'Description',
                                      style: TextStyle(
                                          color: AppColors.blackColor,
                                          fontSize: appConfig.textSizeScale(20),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: appConfig.deviceHeight(2),
                                    ),
                                    Container(
                                      width: appConfig.deviceWidth(90),
                                      padding: EdgeInsets.only(
                                        left: appConfig.deviceWidth(3),
                                      ),
                                      decoration: BoxDecoration(
                                          color: AppColors.greycolor,
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter a description';
                                          }
                                          return null;
                                        },
                                        cursorColor: AppColors.primaryColor,
                                        controller: homeController
                                            .descriptionController,
                                        keyboardType: TextInputType.name,
                                        decoration: InputDecoration(
                                            hintText: 'Description',
                                            border: InputBorder.none,
                                            hintStyle: TextStyle(
                                              fontSize:
                                                  appConfig.textSizeScale(15),
                                              color: AppColors.whitecolor,
                                            ),
                                            alignLabelWithHint: true),
                                      ),
                                    ),
                                    SizedBox(
                                      height: appConfig.deviceHeight(2),
                                    ),
                                    Row(
                                      children: [
                                        MaterialButton(
                                          color: AppColors.blackColor,
                                          onPressed: () async {
                                            final Duration? duration =
                                                await showCupertinoDurationPicker(
                                              context: context,
                                              initialDuration:
                                                  _timePickerController
                                                      .selectedDuration.value,
                                            );
                                            if (duration != null) {
                                              _timePickerController
                                                  .updateSelectedDuration(
                                                      duration);
                                            }
                                          },
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          height: appConfig.deviceHeight(4),
                                          minWidth: appConfig.deviceWidth(25),
                                          child: Text(
                                            'SELECT TIME',
                                            style: TextStyle(
                                                color: AppColors.whitecolor,
                                                fontSize: appConfig
                                                    .textSizeScale(15)),
                                          ),
                                        ),
                                        SizedBox(
                                          width: appConfig.deviceWidth(4),
                                        ),
                                        Obx(
                                          () => Text(
                                            "${_timePickerController.selectedDuration.value.inMinutes}:${(_timePickerController.selectedDuration.value.inSeconds % 60).toString().padLeft(2, '0')}",
                                            style: TextStyle(
                                              fontSize:
                                                  appConfig.textSizeScale(20),
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.greycolor,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: appConfig.deviceHeight(2),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        MaterialButton(
                                          color: AppColors.greencolor,
                                          onPressed: () {
                                            FocusScope.of(context).unfocus();
                                            if (_formkey.currentState!
                                                .validate()) {
                                              if (_timePickerController
                                                      .selectedDuration
                                                      .value
                                                      .inMinutes >
                                                  5) {
                                                Get.snackbar(
                                                  'Error',
                                                  'Please select a duration of 5 minutes or less',
                                                  snackPosition:
                                                      SnackPosition.BOTTOM,
                                                  backgroundColor: Colors.red,
                                                  colorText: Colors.white,
                                                );
                                                return;
                                              }
                                              Get.snackbar(
                                                'Success',
                                                'List added successful',
                                                snackPosition:
                                                    SnackPosition.BOTTOM,
                                                backgroundColor: Colors.green,
                                                colorText: Colors.white,
                                              );
                                            }
                                          },
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          height: appConfig.deviceHeight(5),
                                          minWidth: appConfig.deviceWidth(30),
                                          child: Text(
                                            'SAVE',
                                            style: TextStyle(
                                                color: AppColors.whitecolor,
                                                fontSize: appConfig
                                                    .textSizeScale(15)),
                                          ),
                                        ),
                                        SizedBox(
                                          width: appConfig.deviceWidth(5),
                                        ),
                                        MaterialButton(
                                          color: AppColors.redColor,
                                          onPressed: () {
                                            Get.back();
                                          },
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          height: appConfig.deviceHeight(5),
                                          minWidth: appConfig.deviceWidth(30),
                                          child: Text(
                                            'CANCEL',
                                            style: TextStyle(
                                                color: AppColors.whitecolor,
                                                fontSize: appConfig
                                                    .textSizeScale(15)),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Icon(Icons.add),
              backgroundColor: AppColors.blackColor,
            )
          ],
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
      return CupertinoAlertDialog(
        title: Text('Select Time'),
        content: Container(
          height: 200,
          child: CupertinoTimerPicker(
            mode: CupertinoTimerPickerMode.ms,
            initialTimerDuration: initialDuration,
            onTimerDurationChanged: (Duration duration) {
              if (duration.inMinutes <= 5) {
                selectedDuration = duration;
              } else {
                selectedDuration = Duration(minutes: 5);
              }
            },
          ),
        ),
        actions: [
          CupertinoDialogAction(
            onPressed: () {
              Navigator.of(context).pop(null);
            },
            child: Text('Cancel'),
          ),
          CupertinoDialogAction(
            onPressed: () {
              Navigator.of(context).pop(selectedDuration);
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}
