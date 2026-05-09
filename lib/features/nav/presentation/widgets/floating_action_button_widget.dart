import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:start/core/Theme/app_theme.dart';
import 'package:start/features/estate/presentation/providers/add_estate_provider.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 76.w,
      height: 76.h,
      decoration: BoxDecoration(
        color: Color(0xFFD3DCE1),
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: EdgeInsets.all(8.r),
        child: FloatingActionButton(
          backgroundColor: context.colors.primary,
          elevation: 0,
          shape: const CircleBorder(),
          onPressed: () {
            context.read<AddEstateProvider>().goTo();
          },
          child: Icon(Icons.add, color: Colors.white, size: 28.sp),
        ),
      ),
    );
  }
}
