import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:start/core/theme/app_theme.dart';

class HomeAddressWidget extends StatelessWidget {
  const HomeAddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        // border: Border.all(color: context.colors.secondary),
      ),
      child: Row(
        children: [
          Icon(
            Icons.keyboard_arrow_down_rounded,
            color: context.colors.primary,
            size: 16.sp,
          ),
          SizedBox(width: 8.w),
          Text(
            'الرياض, السعوديه', // this will change
            style: context.text.bodySmall!.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(width: 8.w),
          Icon(Icons.location_on, color: context.colors.primary, size: 16.sp),
        ],
      ),
    );
  }
}
