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
                        height: appConfig.deviceHeight(48),
                        color: AppColors.backgroundColor,
                        child: Column(
                          children: [
                            Padding(
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
                                        borderRadius: BorderRadius.circular(6)),
                                    child: TextFormField(
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
                                        borderRadius: BorderRadius.circular(6)),
                                    child: TextFormField(
                                      cursorColor: AppColors.primaryColor,
                                      controller:
                                          homeController.descriptionController,
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
                                  Text(
                                    'Time',
                                    style: TextStyle(
                                        color: AppColors.blackColor,
                                        fontSize: appConfig.textSizeScale(20),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: appConfig.deviceHeight(2),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'minute',
                                        style: TextStyle(
                                          color: AppColors.blackColor,
                                          fontSize: appConfig.textSizeScale(20),
                                        ),
                                      ),
                                      SizedBox(
                                        width: appConfig.deviceWidth(1),
                                      ),
                                      Container(
                                        width: appConfig.deviceWidth(10),
                                        height: appConfig.deviceHeight(4),
                                        padding: EdgeInsets.only(
                                          left: appConfig.deviceWidth(3),
                                        ),
                                        decoration: BoxDecoration(
                                            color: AppColors.greycolor,
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        child: TextFormField(
                                          cursorColor: AppColors.primaryColor,
                                          controller:
                                              homeController.timeController,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: appConfig.deviceWidth(4),
                                      ),
                                      Text(
                                        'second',
                                        style: TextStyle(
                                          color: AppColors.blackColor,
                                          fontSize: appConfig.textSizeScale(20),
                                        ),
                                      ),
                                      SizedBox(
                                        width: appConfig.deviceWidth(1),
                                      ),
                                      Container(
                                        width: appConfig.deviceWidth(10),
                                        height: appConfig.deviceHeight(4),
                                        padding: EdgeInsets.only(
                                          left: appConfig.deviceWidth(3),
                                        ),
                                        decoration: BoxDecoration(
                                            color: AppColors.greycolor,
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        child: TextFormField(
                                          cursorColor: AppColors.primaryColor,
                                          controller:
                                              homeController.timeController,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
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
                                        onPressed: () {},
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
                                              fontSize:
                                                  appConfig.textSizeScale(15)),
                                        ),
                                      ),
                                      SizedBox(
                                        width: appConfig.deviceWidth(5),
                                      ),
                                      MaterialButton(
                                        color: AppColors.redColor,
                                        onPressed: () {},
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
                                              fontSize:
                                                  appConfig.textSizeScale(15)),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
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
