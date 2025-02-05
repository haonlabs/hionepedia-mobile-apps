import 'package:get/get.dart';
import 'package:hionepedia/modules/auth/controller/auth_controller.dart';
import 'package:hionepedia/modules/favorite/controller/favorite_controller.dart';
import 'package:hionepedia/modules/home/controller/home_controller.dart';
import 'package:hionepedia/modules/user/controller/user_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController());
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<FavoriteController>(() => FavoriteController(), fenix: true);
    Get.lazyPut<UserController>(() => UserController(), fenix: true);
  }
}
