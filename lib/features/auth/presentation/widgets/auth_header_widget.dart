import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:start/core/Theme/app_theme.dart';
import 'package:start/features/language/presentation/provider/language_provider.dart';

class AuthHeaderWidget extends StatelessWidget {
  final String title;
  final String decs;
  final bool isCentered;

  const AuthHeaderWidget({
    super.key,
    required this.title,
    required this.decs,
    this.isCentered = false,
  });

  @override
  Widget build(BuildContext context) {
    final titleText = Text(
      LanguageProvider.translate('header', title),
      style: context.text.titleMedium!.copyWith(fontSize: 20.sp),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isCentered ? Center(child: titleText) : titleText,
        SizedBox(height: 12.h),
        Text(
          LanguageProvider.translate('header', decs),
          style: context.text.bodyMedium!.copyWith(
            color: context.colors.secondary,
          ),
          textAlign: isCentered ? TextAlign.center : null,
        ),
      ],
    );
  }
}
