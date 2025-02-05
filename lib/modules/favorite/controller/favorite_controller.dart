import 'package:get/get.dart';
import 'package:hionepedia/data/local/database_helper.dart';
import 'package:hionepedia/data/model/db_model.dart';

class FavoriteController extends GetxController {
  final isLoading = false.obs;
  final isSuccess = true.obs;
  final isPlaying = false.obs;
  final favoriteData = <AnimalFavorite>[].obs;

  @override
  void onInit() {
    super.onInit();
    getListFavorite();
  }

  Future<void> getListFavorite() async {
    favoriteData.value = await DatabaseHelper().getFavorites();
  }
}
