import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:start/features/address/presentation/widgets/home_address_widget.dart';
import 'package:start/features/auth/presentation/widgets/profile/user_avatar_widget.dart';
import 'package:start/features/notification/presentation/widgets/home_notification_bell.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        UserAvatarWidget(),
        SizedBox(width: 12.w),
        HomeAddressWidget(),
        Spacer(),
        HomeNotificationBell(),
      ],
    );
  }
}
