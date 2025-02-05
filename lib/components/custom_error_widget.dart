import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            margin: const EdgeInsets.all(50),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
            child: Image.asset('assets/illustration/error.png')));
  }
}
