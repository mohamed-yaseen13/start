import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:start/core/Theme/app_theme.dart';
import 'package:start/features/language/presentation/provider/language_provider.dart';
import 'package:start/features/nav/domain/entities/nav_item_entity.dart';
import 'package:start/features/nav/presentation/providers/nav_provider.dart';
import 'package:start/features/nav/presentation/widgets/floating_action_button_widget.dart';

class NavBarView extends StatelessWidget {
  const NavBarView({super.key});

  @override
  Widget build(BuildContext context) {
    final NavProvider provider = context.watch<NavProvider>();
    final List<NavItemEntity> items = provider.navItems;

    return Scaffold(
      body: items[provider.currentIndex].page,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(top: 32.h),
        child: FloatingActionButtonWidget(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        height: 75.h,
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(items.length, (index) {
            final item = items[index];
            final isActive = provider.currentIndex == index;

            if (index == 2) {
              return SizedBox(width: 60.w);
            }

            return InkWell(
              onTap: () => provider.setIndex(index),
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              child: Padding(
                padding: EdgeInsets.only(bottom: 2.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      item.icon,
                      colorFilter: ColorFilter.mode(
                        isActive ? context.colors.primary : Colors.grey,
                        BlendMode.srcIn,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      LanguageProvider.translate("navbar", item.title),
                      style: context.text.bodySmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: isActive ? context.colors.primary : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
