import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:start/features/onboarding/presentation/providers/onboarding_provider.dart';
import 'package:start/features/onboarding/presentation/widgets/onboardding_details_widget.dart';

class OnboardingPageViewWidget extends StatelessWidget {
  const OnboardingPageViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OnboardingProvider>(context, listen: false);
    return PageView.builder(
      controller: provider.pageController,
      onPageChanged: (page) {
        provider.onPageChanged(page);
      },
      itemCount: provider.onBoardingList.length,
      itemBuilder: (context, index) {
        final data = provider.onBoardingList[index];
        return OnboarddingDetailsWidget(entity: data);
      },
    );
  }
}
