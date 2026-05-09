import 'package:flutter/material.dart';
import 'package:start/core/constants/app_images.dart';
import 'package:start/core/helper_function/navigation.dart';
import 'package:start/features/home/presentation/pages/home_page.dart';
import 'package:start/features/nav/domain/entities/nav_item_entity.dart';
import 'package:start/features/nav/presentation/views/nav_bar_view.dart';

class NavProvider extends ChangeNotifier {
  int currentIndex = 0;

  List<NavItemEntity> navItems = [
    NavItemEntity(title: "home", icon: AppImages.navHomeIcon, page: HomePage()),
    NavItemEntity(
      title: "books",
      icon: AppImages.navBookIcon,
      page: Scaffold(),
    ),
    NavItemEntity(title: '', icon: "", page: SizedBox()),
    NavItemEntity(
      title: "favorite",
      icon: AppImages.navFavoriteIcon,
      page: Scaffold(),
    ),
    NavItemEntity(
      title: "profile",
      icon: AppImages.navUserIcon,
      page: Scaffold(),
    ),
  ];

  void setIndex(int index) {
    if (currentIndex == index) {
      return;
    } else {
      currentIndex = index;
      notifyListeners();
    }
  }

  void goToPage() {
    navPARU(const NavBarView());
  }
}
