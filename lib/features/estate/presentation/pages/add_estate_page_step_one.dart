import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:start/core/Theme/app_theme.dart';
import 'package:start/core/widgets/button_widget.dart';
import 'package:start/core/widgets/drop_down_widget.dart';
import 'package:start/core/widgets/validation_widget.dart';
import 'package:start/features/categories/presentation/providers/categories_provider.dart';
import 'package:start/features/estate/presentation/providers/add_estate_operations.dart';
import 'package:start/features/estate/presentation/providers/add_estate_provider.dart';
import 'package:start/features/estate/presentation/widgets/add_estate_step_one/estate_images_widget.dart';
import 'package:start/features/estate/presentation/widgets/add_estate_step_one/estate_type_widget.dart';
import 'package:start/features/language/presentation/provider/language_provider.dart';

class AddEstatePageStepOne extends StatelessWidget {
  const AddEstatePageStepOne({super.key});

  @override
  Widget build(BuildContext context) {
    final categoriesProvider = context.watch<CategoriesProvider>();
    final addEstateProvider = context.watch<AddEstateProvider>();
    final style = context.text.titleMedium!.copyWith(fontSize: 16.sp);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          LanguageProvider.translate('add_estate', 'add_estate'),
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
            key: addEstateProvider.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24.h),
                EstateTypeWidget(),
                SizedBox(height: 24.h),
                EstateImagesWidget(),
                SizedBox(height: 24.h),
                Text(
                  LanguageProvider.translate('add_estate', 'estate_type'),
                  style: style,
                ),
                SizedBox(height: 8.h),
                DropDownWidget(dropDownClass: categoriesProvider),
                SizedBox(height: 12.h),
                ValidationWidget(
                  conditions: [
                    {
                      "value": categoriesProvider.selectedCategory == null,
                      "text": "must_select_a_category",
                    },
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 48.h, top: 12.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ButtonWidget(
              text: LanguageProvider.translate('global', 'next'),
              onTap: () {
                addEstateProvider.summitStepOne();
              },
            ),
          ],
        ),
      ),
    );
  }
}
