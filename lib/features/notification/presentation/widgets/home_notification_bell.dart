import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:start/core/constants/app_images.dart';
import 'package:start/core/theme/app_theme.dart';

class HomeNotificationBell extends StatelessWidget {
  const HomeNotificationBell({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 50.w,
        height: 50.h,
        decoration: BoxDecoration(
          border: Border.all(color: context.colors.primary),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Stack(
            children: [
              SvgPicture.asset(
                AppImages.notificationIcon,
                width: 25.w,
                height: 25.h,
              ),
              Positioned(
                top: -2.h,
                child: SvgPicture.asset(AppImages.redCircleIcon),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
