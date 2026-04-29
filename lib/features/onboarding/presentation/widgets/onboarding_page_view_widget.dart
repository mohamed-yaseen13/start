import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:start/features/onboarding/presentation/providers/onboarding_provider.dart';
import 'package:start/features/onboarding/presentation/widgets/onboarding_details_widget.dart';

class OnboardingPageViewWidget extends StatelessWidget {
  const OnboardingPageViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<OnboardingProvider>();
    return PageView.builder(
      controller: provider.pageController,
      onPageChanged: (page) {
        provider.onPageChanged(page);
      },
      itemCount: provider.onBoardingList.length,
      itemBuilder: (context, index) {
        final data = provider.onBoardingList[index];
        return OnboardingDetailsWidget(entity: data);
      },
    );
  }
}
