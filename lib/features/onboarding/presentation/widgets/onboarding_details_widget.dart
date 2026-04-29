import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:start/core/Theme/app_theme.dart';
import 'package:start/features/language/presentation/provider/language_provider.dart';
import 'package:start/features/onboarding/domain/entities/onboarding_entity.dart';

class OnboardingDetailsWidget extends StatelessWidget {
  final OnboardingEntity entity;

  const OnboardingDetailsWidget({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 350.h,
            width: 350.w,
            child: Stack(
              children: [
                Positioned(
                  left: entity.index % 2 == 1 ? null : 50.w,
                  right: entity.index % 2 == 1 ? 70.w : null,
                  top: 80,
                  child: BlobImage(
                    width: 150.w,
                    height: 230.h,
                    borderRadius: 90.r,
                    imagePath: entity.imageBottom,
                    colorFilter: ColorFilter.mode(
                      context.colors.primary.withAlpha(100),
                      BlendMode.srcATop,
                    ),
                  ),
                ),
                Positioned(
                  left: entity.index % 2 == 1 ? 50.w : null,
                  right: entity.index % 2 == 1 ? null : 70.w,
                  top: 30,
                  child: BlobImage(
                    width: 150.w,
                    height: 230.h,
                    borderRadius: 85.r,
                    imagePath: entity.imageTop,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Text(
              LanguageProvider.translate('onboarding', entity.title),
              textAlign: TextAlign.center,
              style: context.text.headlineLarge!.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: 15.h),
          Text(
            LanguageProvider.translate('onboarding', entity.subtitle),
            textAlign: TextAlign.center,
            style: context.text.bodySmall,
          ),
        ],
      ),
    );
  }
}

class BlobImage extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final String imagePath;
  final ColorFilter? colorFilter;
  final BoxShadow? shadow;

  const BlobImage({
    super.key,
    required this.width,
    required this.height,
    required this.borderRadius,
    required this.imagePath,
    this.colorFilter,
    this.shadow,
  });

  ImageProvider get _imageProvider => AssetImage(imagePath);

  @override
  Widget build(BuildContext context) {
    Widget image = ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: ColorFiltered(
        colorFilter:
            colorFilter ??
            const ColorFilter.mode(Colors.transparent, BlendMode.multiply),
        child: Image(
          image: _imageProvider,
          width: width,
          height: height,
          fit: BoxFit.cover,
        ),
      ),
    );

    if (shadow != null) {
      image = DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [shadow!],
        ),
        child: image,
      );
    }

    return SizedBox(width: width, height: height, child: image);
  }
}
