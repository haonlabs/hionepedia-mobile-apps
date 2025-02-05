import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserController extends GetxController {
  GetStorage box = GetStorage();
  final fullname = ''.obs;

  @override
  void onInit() {
    super.onInit();
    if (box.hasData('fullname')) {
      fullname.value = box.read('fullname');
    }
  }
}
