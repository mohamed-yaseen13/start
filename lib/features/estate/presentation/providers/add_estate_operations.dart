import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:start/core/Theme/app_theme.dart';
import 'package:start/core/constants/constants.dart';
import 'package:start/core/helper_function/text_form_field_validation.dart';
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

  void initStepTwoInputs() {
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

  void initStepThreeInputs() {
    final style = Constants.globalContext().text.titleMedium!.copyWith(
      fontSize: 14.sp,
    );

    stepThreeInputs = [
      TextFieldModel(
        key: 'estate_name',
        controller: TextEditingController(),
        title: Text(
          LanguageProvider.translate('add_estate', 'estate_name'),
          style: style,
        ),
        validator: (value) => validateEstateName(value),
      ),
      TextFieldModel(
        key: 'estate_area',
        controller: TextEditingController(),
        title: Text(
          LanguageProvider.translate('add_estate', 'estate_area'),
          style: style,
        ),
        validator: (value) => validateArea(value),
        width: 0.28.sw,
      ),
      TextFieldModel(
        key: 'estate_rooms',
        controller: TextEditingController(),
        title: Text(
          LanguageProvider.translate('add_estate', 'estate_rooms'),
          style: style,
        ),
        validator: (value) => validateEstateRooms(value),
        width: 0.28.sw,
        textInputType: TextInputType.number,
      ),
      TextFieldModel(
        key: 'estate_bath',
        controller: TextEditingController(),
        title: Text(
          LanguageProvider.translate('add_estate', 'estate_bath'),
          style: style,
        ),
        validator: (value) => validateEstateBath(value),
        width: 0.28.sw,
        textInputType: TextInputType.number,
      ),
      TextFieldModel(
        key: 'estate_disc',
        controller: TextEditingController(),
        title: Text(
          LanguageProvider.translate('add_estate', 'estate_disc'),
          style: style,
        ),
        validator: (value) {
          return null;
        },
        min: 5,
        max: 10,
      ),
      TextFieldModel(
        key: 'estate_price',
        controller: TextEditingController(),
        title: Text(
          LanguageProvider.translate('add_estate', 'estate_price'),
          style: style,
        ),
        validator: (value) => validatePrice(value),
        next: false,
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

  void submitStepThree() {
    if (formKey3.currentState!.validate()) {
      uploadEstate();
    }
  }
}
