import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:start/core/Theme/app_theme.dart';
import 'package:start/core/constants/app_images.dart';
import 'package:start/features/estate/presentation/providers/add_estate_provider.dart';
import 'package:start/features/language/presentation/provider/language_provider.dart';

class EstateImagesWidget extends StatelessWidget {
  const EstateImagesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final style = context.text.titleMedium!.copyWith(fontSize: 14.sp);
    final provider = context.watch<AddEstateProvider>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              LanguageProvider.translate('add_estate', 'images'),
              style: style,
            ),
            SizedBox(width: 8.w),
            Text('(${provider.images.length}/10)', style: style),
          ],
        ),
        SizedBox(height: 12.h),
        GestureDetector(
          onTap: () {},
          child: DottedBorder(
            options: RoundedRectDottedBorderOptions(
              radius: Radius.circular(16.r),
              color: context.colors.secondary,
              dashPattern: [8, 4],
              strokeWidth: 2,
            ),
            child: SizedBox(
              width: 160.w,
              height: 110.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppImages.uploadIcon),
                  SizedBox(height: 8),
                  Text(
                    LanguageProvider.translate('add_estate', 'upload_image'),
                    style: style.copyWith(color: context.colors.secondary),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
