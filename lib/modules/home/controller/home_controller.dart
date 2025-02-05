import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hionepedia/data/model/animal_model.dart';
import 'package:hionepedia/remote/repository.dart';

class HomeController extends GetxController {
  SupabaseRepository supabase = SupabaseRepository();
  final isLoading = true.obs;
  final isSuccess = false.obs;
  final animalData = <AnimalModel>[].obs;
  GetStorage box = GetStorage();
  final fullname = ''.obs;

  @override
  void onInit() {
    super.onInit();
    if (box.hasData('fullname')) {
      fullname.value = box.read('fullname');
    }
    fetchAnimalData();
  }

  void fetchAnimalData() async {
    isLoading.value = true;
    try {
      animalData.value = await supabase.fetchAnimalData();
      isSuccess.value = true;
    } catch (e) {
      isSuccess.value = false;
      log("fetch: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
