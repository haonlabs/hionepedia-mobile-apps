import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hionepedia/data/local/database_helper.dart';
import 'package:hionepedia/data/model/db_model.dart';
import 'package:hionepedia/modules/favorite/controller/favorite_controller.dart';
import 'package:hionepedia/theme/styles.dart';
import 'package:hionepedia/utlis/file_downloader.dart';
import 'package:just_audio/just_audio.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class DetailPage extends StatelessWidget {
  DetailPage({super.key, required this.animalData});

  final favoriteController = Get.find<FavoriteController>();
  final dynamic animalData;
  final audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    DatabaseHelper dbHelper = DatabaseHelper();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                margin: const EdgeInsets.only(top: 15),
                height: 400,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[50],
                    boxShadow: [
                      BoxShadow(
                        color: blackColor,
                        offset: const Offset(5, 5),
                        blurRadius: 20,
                      ),
                      const BoxShadow(
                        color: Colors.white,
                        offset: Offset(-5, -5),
                        blurRadius: 20,
                      )
                    ]),
                child: ModelViewer(
                  src: animalData.modelUrl ??
                      "assets/model/${animalData.id}.glb",
                  alt: "A 3D model of an animal",
                  ar: true,
                  autoRotate: true,
                  cameraControls: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    Text(
                      animalData.name,
                      style: titleStyle.copyWith(fontWeight: FontWeight.w700),
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () async {
                          await audioPlayer.setUrl(animalData.soundUrl);
                          await audioPlayer.play();
                        },
                        icon: Image.asset(
                          'assets/icon/sound.png',
                          width: 24,
                        )),
                    IconButton(onPressed: () async {
                      String imagePath = await downloadFile(
                          animalData.thumbnailUrl, '${animalData.name}.jpg');
                      String mp3Path = '';
                      if (animalData.soundUrl != null) {
                        mp3Path = await downloadFile(
                            animalData.soundUrl!, '${animalData.name}.mp3');
                      }
                      AnimalFavorite favorite = AnimalFavorite(
                        name: animalData.name,
                        desc: animalData.desc,
                        thumbnailUrl: imagePath,
                        soundUrl: mp3Path,
                      );
                      if (favoriteController.favoriteData.any(
                          (favorite) => favorite.name == animalData.name)) {
                        await dbHelper.deleteFavorite(animalData.name);
                      } else {
                        await dbHelper.insertFavorite(favorite);
                      }
                      favoriteController.getListFavorite();
                    }, icon: Obx(
                      () {
                        log("fav: ${favoriteController.favoriteData.any((favorite) => favorite.name == animalData.name)}");
                        return favoriteController.favoriteData.any(
                                (favorite) => favorite.name == animalData.name)
                            ? Image.asset(
                                'assets/icon/favorite.png',
                                width: 24,
                              )
                            : Icon(
                                Icons.favorite,
                                color: Colors.grey,
                              );
                      },
                    ))
                  ],
                ),
              ),
              Text(
                'Deskripsi',
                style: subtitleStyle,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  animalData.desc.replaceAll(r'\n', '\n'),
                  textAlign: TextAlign.justify,
                  style: textStyle.copyWith(fontSize: 14),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
