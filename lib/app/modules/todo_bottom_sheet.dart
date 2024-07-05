import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/constants/app_config.dart';
import 'package:todo_app/app/constants/colors.dart';
import 'package:todo_app/app/models/todo_data_model.dart';
import 'package:todo_app/app/modules/detail/controllers/detail_controller.dart';

import 'home/controllers/home_controller.dart';

class AddTodoBttomSheet extends StatefulWidget {
  final bool forEdit;
  final TodoDataModel? todoDataModel;
  const AddTodoBttomSheet(
      {required this.forEdit, this.todoDataModel, super.key});

  @override
  State<AddTodoBttomSheet> createState() => _AddTodoBttomSheetState();
}

class _AddTodoBttomSheetState extends State<AddTodoBttomSheet> {
  final _formkey = GlobalKey<FormState>();

  final homeController = Get.isRegistered<HomeController>()
      ? Get.find<HomeController>()
      : Get.put(HomeController());

  @override
  void initState() {
    if (widget.forEdit && widget.todoDataModel != null) {
      homeController.titleController.value.text = widget.todoDataModel!.title;
      homeController.descriptionController.value.text =
          widget.todoDataModel!.description;
      homeController.statusController.value =
          widget.todoDataModel!.status ?? '';
      homeController.selectedTime.value = widget.todoDataModel!.time;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppConfig appConfig = AppConfig(context);
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SingleChildScrollView(
        child: Container(
          height: appConfig.deviceHeight(55),
          color: AppColors.whitecolor,
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
                            borderRadius: BorderRadius.circular(6)),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a title';
                            }
                            return null;
                          },
                          cursorColor: AppColors.primaryColor,
                          controller: homeController.titleController.value,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              hintText: 'title',
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                fontSize: appConfig.textSizeScale(15),
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a description';
                            }
                            return null;
                          },
                          cursorColor: AppColors.primaryColor,
                          controller:
                              homeController.descriptionController.value,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              hintText: 'Description',
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                fontSize: appConfig.textSizeScale(15),
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
                          Text(
                            'Time',
                            style: TextStyle(
                                color: AppColors.blackColor,
                                fontSize: appConfig.textSizeScale(20),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: appConfig.deviceWidth(3),
                          ),
                          Obx(() => Text(
                                'minute ${homeController.selectedTime}',
                                style: TextStyle(
                                  fontSize: appConfig.textSizeScale(15),
                                  color: AppColors.greycolor,
                                ),
                              )),
                          SizedBox(
                            width: appConfig.deviceWidth(37),
                          ),
                          SizedBox(
                            height: appConfig.deviceHeight(8),
                            width: appConfig.deviceWidth(8),
                            child: FloatingActionButton(
                              onPressed: () {
                                homeController.add();
                              },
                              backgroundColor: AppColors.blueColor,
                              child: Center(
                                child: Icon(
                                  Icons.add,
                                  size: appConfig.textSizeScale(14),
                                  color: AppColors.whitecolor,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: appConfig.deviceWidth(1),
                          ),
                          SizedBox(
                            height: appConfig.deviceHeight(8),
                            width: appConfig.deviceWidth(8),
                            child: FloatingActionButton(
                              onPressed: () {
                                homeController.subtract();
                              },
                              backgroundColor: AppColors.redColor,
                              child: Center(
                                child: Icon(
                                  Icons.remove,
                                  size: appConfig.textSizeScale(14),
                                  color: AppColors.whitecolor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: appConfig.deviceHeight(2),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MaterialButton(
                            color: AppColors.greencolor,
                            onPressed: () async {
                              FocusScope.of(context).unfocus();
                              if (_formkey.currentState!.validate()) {
                                var id = widget.todoDataModel != null
                                    ? widget.todoDataModel!.id
                                    : null;
                                homeController.handleAddButton(id: id);

                                if (widget.todoDataModel != null) {
                                  Get.find<DetailScreenController>()
                                      .updateTodoData(TodoDataModel(
                                          id: id,
                                          title: homeController
                                              .titleController.value.text,
                                          description: homeController
                                              .descriptionController.value.text,
                                          time:
                                              homeController.selectedTime.value,
                                          status: homeController
                                              .statusController.value));
                                }

                                // homeController.fetchTodos();
                                Get.back();
                                Get.snackbar(
                                  'Success',
                                  'List added successful',
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Colors.green,
                                  colorText: Colors.white,
                                );
                              }
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            height: appConfig.deviceHeight(5),
                            minWidth: appConfig.deviceWidth(30),
                            child: Text(
                              'SAVE',
                              style: TextStyle(
                                  color: AppColors.whitecolor,
                                  fontSize: appConfig.textSizeScale(15)),
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
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            height: appConfig.deviceHeight(5),
                            minWidth: appConfig.deviceWidth(30),
                            child: Text(
                              'CANCEL',
                              style: TextStyle(
                                  color: AppColors.whitecolor,
                                  fontSize: appConfig.textSizeScale(15)),
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
      ),
    );
  }
}
