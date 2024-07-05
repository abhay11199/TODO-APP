import 'package:get/get.dart';
import 'package:todo_app/app/modules/detail/bindings/detail_binding.dart';
import 'package:todo_app/app/modules/detail/views/detail_view.dart';
import 'package:todo_app/app/modules/home/bindings/home_binding.dart';
import 'package:todo_app/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME_SCREEN,
      page: () => Home(),
      binding: HomeBinding(),
    ),
    GetPage(
        name: _Paths.DETAIL_SCREEN,
        page: () => DetailScreen(),
        binding: DetailBinding())
  ];
}
