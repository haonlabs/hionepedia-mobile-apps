import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hionepedia/modules/auth/controller/auth_controller.dart';
import 'package:hionepedia/theme/styles.dart';

class RegisterPage extends GetView<AuthController> {
  RegisterPage({super.key});
  final TextEditingController usernameCtrl = TextEditingController();
  final TextEditingController pinCtrl = TextEditingController();
  final TextEditingController ageCtrl = TextEditingController();
  final TextEditingController hobbyCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: Center(
                child: Text(
                  'Register',
                  style: titleStyle.copyWith(
                      fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            Center(
              child: Image.asset(
                'assets/avatar/default_avatar.png',
                width: 100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 10, 32, 10),
              child: Text(
                'Username',
                style: subtitleStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: TextField(
                controller: usernameCtrl,
                autofocus: true,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.account_box,
                    color: Colors.grey,
                  ),
                  filled: true,
                  fillColor: lightGrey,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 30, 32, 10),
              child: Text(
                'Pin',
                style: subtitleStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: TextField(
                controller: pinCtrl,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                obscureText: controller.isHide.value,
                maxLength: 6,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Colors.grey,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      controller.isHide.toggle();
                    },
                    icon: Icon(
                      Icons.visibility,
                      color: controller.isHide.value
                          ? Colors.grey
                          : Colors.deepPurple,
                    ),
                  ),
                  filled: true,
                  fillColor: lightGrey,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 10, 32, 10),
              child: Text(
                'Umur',
                style: subtitleStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: TextField(
                controller: ageCtrl,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.calendar_today,
                    color: Colors.grey,
                  ),
                  filled: true,
                  fillColor: lightGrey,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 30, 32, 10),
              child: Text(
                'Hobi',
                style: subtitleStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: TextField(
                controller: hobbyCtrl,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.gamepad,
                    color: Colors.grey,
                  ),
                  filled: true,
                  fillColor: lightGrey,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                controller.register();
              },
              child: Container(
                height: 60,
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(32, 40, 32, 10),
                decoration: BoxDecoration(
                    color: blackColor, borderRadius: BorderRadius.circular(18)),
                child: Center(
                    child: Text(
                  'Let\'s Go',
                  style: titleStyle.copyWith(
                      color: lightGrey, fontWeight: FontWeight.w600),
                )),
              ),
            ),
          ],
        ),
      ),
    )));
  }
}
