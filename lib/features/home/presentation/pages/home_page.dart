import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:start/core/constants/app_images.dart';
import 'package:start/features/home/presentation/widgets/home_header_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PositionedDirectional(
            start: 0,
            top: 0,
            child: SvgPicture.asset(AppImages.homeCircle),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: ListView(children: [HomeHeaderWidget()]),
            ),
          ),
        ],
      ),
    );
  }
}
