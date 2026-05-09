import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:start/core/constants/app_images.dart';

class UserAvatarWidget extends StatelessWidget {
  const UserAvatarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      foregroundImage: AssetImage(AppImages.userImage),
      radius: 24.r,
    );
  }
}
