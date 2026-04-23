import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:start/core/constants/app_images.dart';

class LoginWithSocialWidget extends StatelessWidget {
  const LoginWithSocialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(onTap: () {}, child: SvgPicture.asset(AppImages.appleIcon)),
        InkWell(onTap: () {}, child: SvgPicture.asset(AppImages.googleIcon)),
      ],
    );
  }
}
