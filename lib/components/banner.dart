import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BannerSub extends StatelessWidget {
  const BannerSub({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(child: Image.asset('assets/banner.png'));
  }
}
