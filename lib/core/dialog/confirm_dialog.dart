import 'package:flutter/cupertino.dart';
import 'package:start/core/Theme/app_theme.dart';
import '../../features/language/presentation/provider/language_provider.dart';
import '../constants/constants.dart';
import '../theme/app_text_styles.dart';

void confirmDialog(
  String title,
  String confirm,
  void Function() confirmTap, {
  String? cancel,
  void Function()? cancelTap,
  bool? isDismiss,
}) {
  final context = Constants.globalContext();

  showCupertinoModalPopup<void>(
    context: context,
    barrierDismissible: isDismiss ?? false,
    builder: (BuildContext context) => Transform.scale(
      scale: Constants.isTablet ? 2 : 1,
      child: CupertinoAlertDialog(
        title: Text(
          title,
          style: AppTextStyles.title.copyWith(color: context.colors.onSurface),
        ),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            onPressed: cancelTap ?? () => Navigator.pop(context),
            child: Text(
              cancel ?? LanguageProvider.translate('buttons', 'cancel'),
              style: AppTextStyles.body.copyWith(
                color: context.colors.onSurface,
              ),
            ),
          ),
          CupertinoDialogAction(
            onPressed: confirmTap,
            child: Text(
              confirm,
              style: AppTextStyles.body.copyWith(
                color: context.colors.error, // Red in dark/light mode
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
