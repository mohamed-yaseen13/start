import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:start/core/Theme/app_theme.dart';
import 'package:start/core/widgets/button_widget.dart';
import 'package:start/core/widgets/custom_bottom_nav_bar_widget.dart';
import 'package:start/core/widgets/drop_down_widget.dart';
import 'package:start/core/widgets/list_text_field_widget.dart';
import 'package:start/core/widgets/validation_widget.dart';
import 'package:start/features/city/presentation/providers/city_provider.dart';
import 'package:start/features/district/presentation/providers/district_provider.dart';
import 'package:start/features/estate/presentation/providers/add_estate_operations.dart';
import 'package:start/features/estate/presentation/providers/add_estate_provider.dart';
import 'package:start/features/language/presentation/provider/language_provider.dart';

class AddEstatePageStepTwo extends StatelessWidget {
  const AddEstatePageStepTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final style = context.text.titleMedium!.copyWith(fontSize: 16.sp);
    final addEstateProvider = context.watch<AddEstateProvider>();
    final cityProvider = context.watch<CityProvider>();
    final districtProvider = context.watch<DistrictProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          LanguageProvider.translate('add_estate', 'location'),
          style: style,
        ),
        actions: [
          SizedBox(width: 48.w), // matches the default leading button width
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: SingleChildScrollView(
          child: Form(
            key: addEstateProvider.formKey2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24.h),
                Text(
                  LanguageProvider.translate('add_estate', 'city'),
                  style: style,
                ),
                SizedBox(height: 8.h),
                DropDownWidget(dropDownClass: cityProvider),
                SizedBox(height: 12.h),
                ValidationWidget(
                  conditions: [
                    {
                      "value": cityProvider.selectedCity == null,
                      "text": "must_select_a_city",
                    },
                  ],
                ),
                SizedBox(height: 24.h),
                Text(
                  LanguageProvider.translate('add_estate', 'district'),
                  style: style,
                ),
                SizedBox(height: 8.h),
                DropDownWidget(dropDownClass: districtProvider),
                ValidationWidget(
                  conditions: [
                    {
                      "value": districtProvider.selectedDistrict == null,
                      "text": "must_select_a_district",
                    },
                  ],
                ),
                SizedBox(height: 24.h),
                ListTextFieldWidget(inputs: addEstateProvider.stepTwoInputs),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBarWidget(
        child: ButtonWidget(
          onTap: () {
            addEstateProvider.submitStepTwo();
          },
          text: LanguageProvider.translate('global', 'next'),
        ),
      ),
    );
  }
}
