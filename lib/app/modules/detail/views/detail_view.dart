import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:todo_app/app/constants/app_config.dart';
import 'package:todo_app/app/constants/colors.dart';
import 'package:todo_app/app/models/todo_data_model.dart';
import 'package:todo_app/app/modules/detail/controllers/detail_controller.dart';
import 'package:todo_app/app/modules/todo_bottom_sheet.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer();

  final _isHours = false;
  final _ismilisecond = false;

  @override
  void initState() {
    super.initState();
  }

  final detailScreenController = Get.put(DetailScreenController());

  @override
  void dispose() {
    super.dispose();
    _stopWatchTimer.dispose();
  }

  void _openEditBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return AddTodoBttomSheet(
          forEdit: true,
          todoDataModel: detailScreenController.todoDataModel.value,
        );
      },
    ).then((value) {
      var todoDetails = value as TodoDataModel;
      detailScreenController.todoDataModel.value = todoDetails;
    });
  }

  @override
  Widget build(BuildContext context) {
    AppConfig appConfig = AppConfig(context);
    return Scaffold(
        backgroundColor: AppColors.whitecolor,
        appBar: AppBar(
          backgroundColor: AppColors.blackColor,
          title: Text(
            'TODO DETAILS',
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() {
                  final todo = detailScreenController.todoDataModel.value;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        todo.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: appConfig.textSizeScale(40),
                        ),
                      ),
                      SizedBox(
                        height: appConfig.deviceHeight(2),
                      ),
                      Row(
                        children: [
                          Text(
                            'Description:',
                            style: TextStyle(
                                fontSize: appConfig.textSizeScale(25),
                                color: AppColors.greycolor),
                          ),
                          SizedBox(
                            height: appConfig.deviceHeight(2),
                          ),
                          Text(
                            todo.description,
                            style: TextStyle(
                                fontSize: appConfig.textSizeScale(20),
                                color: AppColors.greycolor),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: appConfig.deviceHeight(2),
                      ),
                      Row(
                        children: [
                          Text(
                            'Status:',
                            style: TextStyle(
                                fontSize: appConfig.textSizeScale(25),
                                color: AppColors.greycolor),
                          ),
                          SizedBox(
                            width: appConfig.deviceWidth(2),
                          ),
                          Text(
                            todo.status.toString(),
                            style: TextStyle(
                                fontSize: appConfig.textSizeScale(20),
                                color: AppColors.greycolor),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: appConfig.deviceHeight(2),
                      ),
                      Row(
                        children: [
                          Text(
                            'Timer:',
                            style: TextStyle(
                                fontSize: appConfig.textSizeScale(25),
                                color: AppColors.greycolor),
                          ),
                          SizedBox(
                            width: appConfig.deviceWidth(3),
                          ),
                          StreamBuilder<int>(
                              stream: _stopWatchTimer.rawTime,
                              initialData: _stopWatchTimer.rawTime.value,
                              builder: (context, snapshot) {
                                final value = snapshot.data;
                                final displayTime =
                                    StopWatchTimer.getDisplayTime(value!,
                                        hours: _isHours,
                                        milliSecond: _ismilisecond);

                                return Text(
                                  displayTime,
                                  style: TextStyle(
                                      fontSize: appConfig.textSizeScale(25),
                                      fontWeight: FontWeight.bold),
                                );
                              })
                        ],
                      ),
                      SizedBox(
                        height: appConfig.deviceHeight(1),
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              _stopWatchTimer.onStartTimer();
                            },
                            style: ElevatedButton.styleFrom(
                                primary: AppColors.greencolor,
                                textStyle: TextStyle(
                                    fontSize: appConfig.textSizeScale(15),
                                    fontWeight: FontWeight.bold)),
                            child: const Text('Start'),
                          ),
                          SizedBox(
                            width: appConfig.deviceWidth(1),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _stopWatchTimer.onStopTimer();
                            },
                            style: ElevatedButton.styleFrom(
                                primary: AppColors.blueColor,
                                textStyle: TextStyle(
                                    fontSize: appConfig.textSizeScale(15),
                                    fontWeight: FontWeight.bold)),
                            child: const Text('Stop'),
                          ),
                          SizedBox(
                            width: appConfig.deviceWidth(1),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _stopWatchTimer.onResetTimer();
                            },
                            style: ElevatedButton.styleFrom(
                                primary: AppColors.redColor,
                                textStyle: TextStyle(
                                    fontSize: appConfig.textSizeScale(15),
                                    fontWeight: FontWeight.bold)),
                            child: const Text('Reset'),
                          ),
                        ],
                      ),
                    ],
                  );
                }),
                SizedBox(
                  height: appConfig.deviceHeight(4),
                ),
                Center(
                  child: SizedBox(
                    height: appConfig.deviceHeight(5),
                    width: appConfig.deviceWidth(40),
                    child: ElevatedButton(
                      onPressed: () {
                        _openEditBottomSheet(context);
                      },
                      style: ElevatedButton.styleFrom(
                          primary: AppColors.skyblueColor,
                          textStyle: TextStyle(
                              fontSize: appConfig.textSizeScale(15),
                              fontWeight: FontWeight.bold)),
                      child: const Text('Edit'),
                    ),
                  ),
                ),
              ]),
        ));
  }
}
