import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/constants/app_config.dart';
import 'package:todo_app/app/constants/colors.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
            Container(
              height: appConfig.deviceHeight(12),
              width: appConfig.deviceWidth(100),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: AppColors.backgroundColor,
                  border: Border.all(color: AppColors.blackColor)),
              child: Padding(
                padding: EdgeInsets.only(left: appConfig.rWP(2)),
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
            const Spacer(),
            FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.add),
              backgroundColor: AppColors.blackColor,
            )
          ],
        ),
      ),
    );
  }
}
