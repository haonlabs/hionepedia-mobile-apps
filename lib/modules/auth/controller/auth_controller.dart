import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hionepedia/modules/page/page.dart';

class AuthController extends GetxController {
  final isLoading = false.obs;
  final isHide = true.obs;
  GetStorage box = GetStorage();

  Future<void> login(String fullname) async {
    box.write('fullname', fullname);
    Get.to(() => MyPage());
  }

  Future<void> register() async {
    Get.to(() => MyPage());
  }
}
