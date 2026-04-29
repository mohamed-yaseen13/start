import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:start/core/Theme/app_theme.dart';
import 'package:start/core/widgets/button_widget.dart';
import 'package:start/features/onboarding/presentation/providers/onboarding_provider.dart';

class OnboardingBottomButtonWidget extends StatelessWidget {
  const OnboardingBottomButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<OnboardingProvider>();
    return ButtonWidget(
      height: 55.h,
      onTap: provider.nextPage,
      text: provider.currentPage == provider.onBoardingList.length - 1
          ? 'start now'
          : 'next',
      textStyle: context.text.titleMedium!.copyWith(
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
    );
  }
}
