import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hionepedia/modules/auth/controller/auth_controller.dart';
import 'package:hionepedia/theme/styles.dart';

class LoginPage extends GetView<AuthController> {
  LoginPage({super.key});
  final TextEditingController usernameCtrl = TextEditingController();
  final TextEditingController pinCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(12),
                  image: const DecorationImage(
                      image: AssetImage('assets/illustration/vr.png'))),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Text(
                  'Login',
                  style: titleStyle.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 50, 32, 10),
              child: Text(
                'Halo, siapa nama kamu?',
                style: subtitleStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: TextField(
                controller: usernameCtrl,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.done,
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
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(32, 20, 32, 10),
            //   child: Text(
            //     'Pin',
            //     style: subtitleStyle,
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 32),
            //   child: TextField(
            //     controller: pinCtrl,
            //     keyboardType: TextInputType.number,
            //     textInputAction: TextInputAction.done,
            //     obscureText: controller.isHide.value,
            //     maxLength: 6,
            //     decoration: InputDecoration(
            //       prefixIcon: const Icon(
            //         Icons.lock,
            //         color: Colors.grey,
            //       ),
            //       suffixIcon: IconButton(
            //         onPressed: () {
            //           controller.isHide.toggle();
            //         },
            //         icon: Icon(
            //           Icons.visibility,
            //           color: controller.isHide.value
            //               ? Colors.grey
            //               : Colors.deepPurple,
            //         ),
            //       ),
            //       filled: true,
            //       fillColor: lightGrey,
            //       border: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(18),
            //           borderSide: BorderSide.none),
            //     ),
            //   ),
            // ),
            GestureDetector(
                onTap: () {
                  controller.login(usernameCtrl.text.trim());
                },
                child: controller.isLoading.value
                    ? const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : Container(
                        height: 60,
                        width: double.infinity,
                        margin: const EdgeInsets.fromLTRB(32, 30, 32, 10),
                        decoration: BoxDecoration(
                            color: blackColor,
                            borderRadius: BorderRadius.circular(18)),
                        child: Center(
                            child: Text(
                          'Go',
                          style: titleStyle.copyWith(
                              color: lightGrey, fontWeight: FontWeight.w600),
                        )),
                      )),
            // Padding(
            //   padding: const EdgeInsets.only(top: 10, bottom: 20),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Text(
            //         'Belum punya akun? ',
            //         style: textStyle.copyWith(fontSize: 14),
            //       ),
            //       GestureDetector(
            //         onTap: () => Navigator.of(context).push(MaterialPageRoute(
            //           builder: (context) => RegisterPage(),
            //         )),
            //         child: Text(
            //           'buat sekarang juga',
            //           style: textStyle.copyWith(
            //               fontSize: 14, color: Colors.deepPurple),
            //         ),
            //       ),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    )));
  }
}
