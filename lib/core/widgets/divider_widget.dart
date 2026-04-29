import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:start/core/Theme/app_theme.dart';
import 'package:start/features/language/presentation/provider/language_provider.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: context.colors.tertiary,
            thickness: 1,
            height: 0,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Text(
            LanguageProvider.translate('global', 'or'),
            style: context.text.titleMedium!.copyWith(
              fontSize: 10.sp,
              color: context.colors.tertiary,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: context.colors.tertiary,
            thickness: 1,
            height: 0,
          ),
        ),
      ],
    );
  }
}
