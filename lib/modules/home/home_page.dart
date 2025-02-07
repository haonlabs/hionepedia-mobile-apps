import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:hionepedia/components/custom_error_widget.dart';
import 'package:hionepedia/data/model/animal_model.dart';
import 'package:hionepedia/modules/detail/detail_page.dart';
import 'package:hionepedia/modules/home/controller/home_controller.dart';
import 'package:hionepedia/theme/styles.dart';
import 'package:hionepedia/utlis/text_formatter.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => controller.fetchAnimalData(),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() => Expanded(
                      child: Text(
                        'Hai, ${controller.fullname} 🖐️'.toTitleCase(),
                        style: titleStyle.copyWith(
                            fontWeight: FontWeight.w700, fontSize: 22),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )),
                Image.asset(
                  'assets/avatar/default_avatar.png',
                  height: 80,
                )
              ],
            ),
          ),
          Container(
            height: 180,
            margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Stack(
              children: [
                const Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: MyContainer(),
                ),
                Positioned(
                  top: 40,
                  left: 20,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                      'Yuk mulai mengenal hewan langka',
                      style: titleStyle.copyWith(
                          color: lightGrey, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: Image.asset(
                      'assets/illustration/fury.png',
                      height: 150,
                    ))
              ],
            ),
          ),
          Obx(() => controller.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : controller.isSuccess.value
                  ? Container(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 0, bottom: 20),
                      child: MasonryGridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.animalData.length,
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => openDialog(
                                context, controller.animalData[index]),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: CachedNetworkImage(
                                imageUrl:
                                    controller.animalData[index].thumbnailUrl,
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) => Center(
                                  child: CircularProgressIndicator(
                                      value: downloadProgress.progress),
                                ),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : CustomErrorWidget()),
        ],
      ),
    );
  }
}

class MyContainer extends StatelessWidget {
  const MyContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: LinearGradient(colors: [primaryColor, lightGrey])),
    );
  }
}

void openDialog(BuildContext context, AnimalModel animalData) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Perhatian!!'),
      content: const Text(
        "Di Halaman Augmented Reality harap untuk selalu ingat hal ini:\n\n1.Diperlukan pengawasan orang tua agar lebih aman.\n\n2.Waspada terhadap bahaya fisik di dunia nyata (misalnya, benda-benda tajam disekitar).",
        textAlign: TextAlign.justify,
      ),
      actions: [
        Container(
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            color: redColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: lightGrey,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.green),
          ),
          child: IconButton(
              icon: const Icon(
                Icons.check,
                color: Colors.green,
              ),
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(
                        animalData: animalData,
                      ),
                    ));
              }),
        ),
      ],
    ),
  );
}
