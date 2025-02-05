import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hionepedia/modules/auth/login_page.dart';
import 'package:hionepedia/theme/styles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingIndicator extends StatelessWidget {
  OnboardingIndicator({
    super.key,
    required PageController pageCtrl,
    required bool onLastPage,
  })  : _pageCtrl = pageCtrl,
        _onLastPage = onLastPage;

  final PageController _pageCtrl;
  final bool _onLastPage;
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: const Alignment(0, 0.85),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
                onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    )),
                child: Text(
                  'Lewati',
                  style: textStyle.copyWith(color: Colors.grey),
                )),
            SmoothPageIndicator(controller: _pageCtrl, count: 3),
            _onLastPage
                ? GestureDetector(
                    onTap: () {
                      box.write('isLoggedFirst', false);

                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ));
                    },
                    child: Text(
                      'Selesai',
                      style: textStyle.copyWith(fontWeight: FontWeight.w600),
                    ))
                : GestureDetector(
                    onTap: () {
                      _pageCtrl.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    },
                    child: Text(
                      'Lanjut',
                      style: textStyle.copyWith(fontWeight: FontWeight.w600),
                    ))
          ],
        ));
  }
}
