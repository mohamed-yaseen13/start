import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:start/core/Theme/app_theme.dart';
import 'package:start/features/estate/presentation/providers/add_estate_operations.dart';
import 'package:start/features/estate/presentation/providers/add_estate_provider.dart';
import 'package:start/features/language/presentation/provider/language_provider.dart';

class EstateTypeWidget extends StatelessWidget {
  const EstateTypeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AddEstateProvider>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LanguageProvider.translate('add_estate', 'operation_type'),
          style: context.text.titleMedium!.copyWith(fontSize: 14.sp),
        ),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(2, (index) {
            final color =
                (index == 0 && provider.isSell) ||
                    (index == 1 && !provider.isSell)
                ? context.colors.primary
                : context.colors.secondary;
            return GestureDetector(
              onTap: () {
                provider.setIsSell(index == 0);
              },
              child: Container(
                width: 160.w,
                height: 70.h,
                decoration: BoxDecoration(
                  color: context.colors.tertiary,
                  border: Border.all(color: color),
                  borderRadius: BorderRadius.circular(25.r),
                ),
                child: Center(
                  child: Text(
                    LanguageProvider.translate(
                      'add_estate',
                      index == 0 ? 'sell' : 'rent',
                    ),
                    style: context.text.titleMedium!.copyWith(color: color),
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
