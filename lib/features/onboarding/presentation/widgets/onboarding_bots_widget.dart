import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:start/core/Theme/app_color.dart';
import '../providers/onboarding_provider.dart';

class OnboardingBotsWidget extends StatelessWidget {
  const OnboardingBotsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OnboardingProvider>(context, listen: true);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        provider.onBoardingList.length,
        (index) => Container(
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          height: 8.h,
          width: provider.currentPage == index ? 28.w : 10.w,
          decoration: BoxDecoration(
            color: provider.currentPage == index
                ? AppColor.primaryDarkBlue
                : AppColor.secondaryGray2,
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
      ),
    );
  }
}
