import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:start/core/constants/app_images.dart';
import 'package:start/core/constants/constants.dart';
import 'package:start/core/helper_function/navigation.dart';
import 'package:start/core/helper_function/prefs.dart';
import 'package:start/features/auth/presentation/providers/login_provider.dart';
import 'package:start/features/onboarding/domain/entities/onboarding_entity.dart';
import 'package:start/features/onboarding/presentation/pages/onboarding_page.dart';

class OnboardingProvider extends ChangeNotifier {
  List<OnboardingEntity> onBoardingList = [
    OnboardingEntity(
      imageTop: AppImages.onboarding1Top,
      imageBottom: AppImages.onboarding1bottom,
      title: 'title0',
      subtitle: 'desc0',
      index: 0,
    ),
    OnboardingEntity(
      imageTop: AppImages.onboarding2Top,
      imageBottom: AppImages.onboarding2bottom,
      title: 'title1',
      subtitle: 'desc1',
      index: 1,
    ),
    OnboardingEntity(
      imageTop: AppImages.onboarding3Top,
      imageBottom: AppImages.onboarding3bottom,
      title: 'title2',
      subtitle: 'desc2',
      index: 2,
    ),
  ];

  PageController pageController = PageController();
  int currentPage = 0;

  void nextPage() {
    if (currentPage < onBoardingList.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      finishOnboarding();
    }
  }

  void onPageChanged(int page) {
    currentPage = page;
    notifyListeners();
  }

  void finishOnboarding() async {
    await setIsFirstTime(false);
    Provider.of<LoginProvider>(
      Constants.globalContext(),
      listen: false,
    ).goToPage();
    // Provider.of<LoginProvider>(
    // Constants.globalContext(),
    // listen: false,
    // ).goToPage();
  }

  void goToPage() {
    setIsFirstTime(false);
    navPR(OnboardingPage());
  }
}
