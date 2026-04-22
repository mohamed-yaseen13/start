import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:start/core/Theme/app_text_styles.dart';
import 'package:start/core/theme/app_color.dart';
import 'package:start/features/language/presentation/provider/language_provider.dart';

class SkipButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SkipButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.r),
            side: BorderSide(color: AppColor.secondaryGray2),
          ),
        ),
        child: Text(
          LanguageProvider.translate('global', 'skip'),
          style: AppTextStyles.caption,
        ),
      ),
    );
  }
}
