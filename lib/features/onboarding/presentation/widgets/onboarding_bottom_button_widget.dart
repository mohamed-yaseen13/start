import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:start/core/Theme/app_color.dart';
import 'package:start/core/Theme/app_text_styles.dart';
import 'package:start/features/onboarding/presentation/providers/onboarding_provider.dart';

class OnboardingBottomButtonWidget extends StatelessWidget {
  const OnboardingBottomButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OnboardingProvider>(context, listen: true);

    return SizedBox(
      width: double.infinity,
      height: 55.h,
      child: ElevatedButton(
        onPressed: provider.nextPage,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primaryDarkBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        child: Text(
          provider.currentPage == provider.onBoardingList.length - 1
              ? 'ابدأ الآن'
              : 'التالي',
          style: AppTextStyles.title.copyWith(
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
