import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckBoxWidget extends StatelessWidget {
  const CheckBoxWidget({
    super.key,
    required this.check,
    required this.onChange,
    this.padding,
  });

  final bool check;
  final EdgeInsets? padding;
  final void Function(bool val) onChange;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return InkWell(
      onTap: () => onChange(!check),
      borderRadius: BorderRadius.circular(8),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 2.w),
        padding: padding ?? EdgeInsets.all(0.5.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: check ? colors.primary : colors.onSurface.withOpacity(0.3),
            width: 2,
          ),
        ),
        child: Container(
          width: 24.w,
          height: 24.w,
          decoration: BoxDecoration(
            color: check ? colors.primary : Colors.white,
            borderRadius: BorderRadius.circular(6),
          ),
          child: check
              ? Icon(
            Icons.done,
            size: 16.sp,
            color: colors.onPrimary,
          )
              : null,
        ),
      ),
    );
  }
}
