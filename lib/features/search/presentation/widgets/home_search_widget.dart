import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:start/core/Theme/app_theme.dart';
import 'package:start/core/constants/app_images.dart';
import 'package:start/features/language/presentation/provider/language_provider.dart';

class HomeSearchWidget extends StatelessWidget {
  const HomeSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: 70.h,
        decoration: BoxDecoration(
          color: context.colors.tertiary,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          child: Row(
            children: [
              SvgPicture.asset(AppImages.homeSearchIcon),
              SizedBox(width: 8.w),
              Text(
                LanguageProvider.translate('home', 'search_hint'),
                style: context.text.bodySmall,
              ),
              Spacer(),
              SvgPicture.asset(AppImages.homeSearchDividerIcon),
              SizedBox(width: 8.w),
              SvgPicture.asset(AppImages.homeSearchFilterIcon),
            ],
          ),
        ),
      ),
    );
  }
}
