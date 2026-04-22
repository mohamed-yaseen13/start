import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:start/core/Theme/app_text_styles.dart';
import 'package:start/core/widgets/button_widget.dart';
import 'package:start/features/onboarding/presentation/providers/onboarding_provider.dart';

class OnboardingBottomButtonWidget extends StatelessWidget {
  const OnboardingBottomButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OnboardingProvider>(context, listen: true);
    return ButtonWidget(
      height: 55.h,
      onTap: provider.nextPage,
      text: provider.currentPage == provider.onBoardingList.length - 1
          ? 'start now'
          : 'next',
      textStyle: AppTextStyles.title.copyWith(
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
    );
  }
}
