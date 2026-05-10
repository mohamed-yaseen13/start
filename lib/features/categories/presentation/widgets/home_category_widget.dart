import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:start/core/Theme/app_theme.dart';

class HomeCategoryWidget extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const HomeCategoryWidget({
    super.key,
    required this.isSelected,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60.w,
        height: 44.h,
        decoration: BoxDecoration(
          color: isSelected ? context.colors.primary : context.colors.tertiary,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Center(
          child: Text(
            label,
            style: isSelected
                ? context.text.titleMedium!.copyWith(
                    color: Colors.white,
                    fontSize: 12.sp,
                  )
                : context.text.titleMedium!.copyWith(
                    color: context.colors.primary,
                    fontSize: 12.sp,
                  ),
          ),
        ),
      ),
    );
  }
}
