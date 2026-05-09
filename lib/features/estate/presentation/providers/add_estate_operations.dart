import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:start/core/Theme/app_theme.dart';
import 'package:start/core/constants/constants.dart';
import 'package:start/core/models/text_field_model.dart';
import 'package:start/features/estate/presentation/providers/add_estate_provider.dart';
import 'package:start/features/language/presentation/provider/language_provider.dart';

extension AddEstateOperations on AddEstateProvider {
  void setIsSell(bool newValue) {
    isSell = newValue;
    rebuild();
  }

  void addImages(List<XFile> images) {
    // this.images.addAll(images);
  }

  void deleteImage(int index) {
    // images.removeAt(index);
  }

  void initInputs() {
    stepTwoInputs = [
      TextFieldModel(
        key: 'street_name',
        controller: TextEditingController(),
        next: false,
        titleWidgets: [
          Text(
            LanguageProvider.translate('add_estate', 'street_name'),
            style: Constants.globalContext().text.titleMedium!.copyWith(
              fontSize: 16.sp,
            ),
          ),
          SizedBox(width: 8.w),
          Text(
            LanguageProvider.translate('add_estate', 'optional'),
            style: Constants.globalContext().text.bodySmall,
          ),
        ],
        validator: (value) {
          return null;
        },
      ),
    ];
  }

  void resetStepOne() {
    isSell = true;
    images = [];
  }

  void submitStepOne() {
    if (formKey1.currentState!.validate()) {
      goToSecondStep();
    }
  }

  void submitStepTwo() {
    if (formKey2.currentState!.validate()) {
      goToThirdStep();
    }
  }
}
