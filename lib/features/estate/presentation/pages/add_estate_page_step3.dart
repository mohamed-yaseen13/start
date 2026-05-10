import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:start/core/Theme/app_theme.dart';
import 'package:start/core/widgets/button_widget.dart';
import 'package:start/core/widgets/custom_bottom_nav_bar_widget.dart';
import 'package:start/core/widgets/list_text_field_widget.dart';
import 'package:start/features/estate/presentation/providers/add_estate_operations.dart';
import 'package:start/features/estate/presentation/providers/add_estate_provider.dart';
import 'package:start/features/language/presentation/provider/language_provider.dart';

class AddEstatePageStep3 extends StatelessWidget {
  const AddEstatePageStep3({super.key});

  @override
  Widget build(BuildContext context) {
    final style = context.text.titleMedium!.copyWith(fontSize: 16.sp);
    final addEstateProvider = context.watch<AddEstateProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          LanguageProvider.translate('add_estate', 'estate_details'),
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
            key: addEstateProvider.formKey3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTextFieldWidget(inputs: addEstateProvider.stepThreeInputs),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBarWidget(
        child: ButtonWidget(
          onTap: () {
            addEstateProvider.submitStepThree();
          },
          text: LanguageProvider.translate('add_estate', 'upload_estate'),
        ),
      ),
    );
  }
}
