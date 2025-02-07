import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hionepedia/data/model/animal_model.dart';
import 'package:hionepedia/modules/detail/detail_page.dart';
import 'package:hionepedia/modules/favorite/controller/favorite_controller.dart';
import 'package:hionepedia/theme/styles.dart';

class FavoritePage extends GetView<FavoriteController> {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<AnimalModel>>(
        future: Future.value(controller.favoriteData),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Tidak ada hewan favorit.'));
          }
          final favoriteAnimals = snapshot.data!;

          return RefreshIndicator(
            onRefresh: () => controller.getListFavorite(),
            child: ListView(
              children: [
                GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: favoriteAnimals.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    log("file: ${favoriteAnimals[index].thumbnailUrl}");
                    return GestureDetector(
                      onTap: () => {
                        Get.to(() => DetailPage(
                              animalData: favoriteAnimals[index],
                            ))
                      },
                      child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: blackColor,
                          ),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(14),
                                child: Image.file(
                                  File(favoriteAnimals[index].thumbnailUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle),
                                    child: Image.asset(
                                      'assets/icon/favorite.png',
                                      width: 30,
                                    ),
                                  ))
                            ],
                          )),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );

    // return controller.isLoading.value
    //     ? const Center(
    //         child: CircularProgressIndicator(),
    //       )
    //     : controller.isSuccess.value
    //         ? RefreshIndicator(
    //             onRefresh: () async {
    //               controller.getListFavorite();
    //             },
    //             child: ListView(
    //               children: [
    //                 Padding(
    //                   padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
    //                   child: Text(
    //                     'Favorite',
    //                     style: titleStyle.copyWith(fontWeight: FontWeight.w600),
    //                   ),
    //                 ),
    //                 GridView.builder(
    //                   padding: const EdgeInsets.symmetric(horizontal: 20),
    //                   shrinkWrap: true,
    //                   physics: const NeverScrollableScrollPhysics(),
    //                   itemCount: 3,
    //                   gridDelegate:
    //                       const SliverGridDelegateWithFixedCrossAxisCount(
    //                           crossAxisCount: 2,
    //                           mainAxisSpacing: 10,
    //                           crossAxisSpacing: 10),
    //                   itemBuilder: (context, index) {
    //                     return GestureDetector(
    //                       onTap: () => {},
    //                       child: Container(
    //                           padding: const EdgeInsets.all(10),
    //                           decoration: BoxDecoration(
    //                             borderRadius: BorderRadius.circular(10),
    //                             color: blackColor,
    //                           ),
    //                           child: Stack(
    //                             fit: StackFit.expand,
    //                             children: [
    //                               // ClipRRect(
    //                               //   borderRadius: BorderRadius.circular(14),
    //                               //   child: Image.file(File(animal.imagePath)),
    //                               // ),
    //                               Align(
    //                                   alignment: Alignment.topRight,
    //                                   child: Container(
    //                                     padding: const EdgeInsets.all(5),
    //                                     decoration: const BoxDecoration(
    //                                         color: Colors.white,
    //                                         shape: BoxShape.circle),
    //                                     child: Image.asset(
    //                                       'assets/icon/favorite.png',
    //                                       width: 30,
    //                                     ),
    //                                   ))
    //                             ],
    //                           )),
    //                     );
    //                   },
    //                 )
    //               ],
    //             ),
    //           )
    //         : const CustomErrorWidget();
  }
}
