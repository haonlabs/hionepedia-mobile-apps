import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hionepedia/modules/auth/login_page.dart';
import 'package:hionepedia/modules/user/controller/user_controller.dart';
import 'package:hionepedia/theme/styles.dart';

class ProfilePage extends GetView<UserController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Image.asset(
            'assets/avatar/default_avatar.png',
            width: 170,
          ),
        ),
        Text(
          controller.fullname.value.toUpperCase(),
          style: titleStyle.copyWith(fontWeight: FontWeight.w700),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            'Saya suka Belajar Hewan Langka',
            style: textStyle,
          ),
        ),
        GestureDetector(
          onTap: () => Get.offAll(() => LoginPage()),
          child: Container(
            margin: const EdgeInsets.only(top: 50, left: 80, right: 80),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: redColor, borderRadius: BorderRadius.circular(12)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.logout_rounded,
                  color: lightGrey,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Keluar',
                    style: subtitleStyle.copyWith(color: lightGrey),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
