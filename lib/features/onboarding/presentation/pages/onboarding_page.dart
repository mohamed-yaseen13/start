import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:start/core/widgets/skip_button.dart';
import 'package:start/features/onboarding/presentation/providers/onboarding_provider.dart';
import 'package:start/features/onboarding/presentation/widgets/onboarding_bots_widget.dart';
import 'package:start/features/onboarding/presentation/widgets/onboarding_bottom_button_widget.dart';
import 'package:start/features/onboarding/presentation/widgets/onboarding_page_view_widget.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
            child: SkipButton(
              onPressed: Provider.of<OnboardingProvider>(
                context,
                listen: false,
              ).finishOnboarding,
            ),
          ),
          Expanded(child: OnboardingPageViewWidget()),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
            child: Column(
              children: [
                OnboardingBotsWidget(),
                SizedBox(height: 24.h),
                OnboardingBottomButtonWidget(),
                SizedBox(height: 25.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
