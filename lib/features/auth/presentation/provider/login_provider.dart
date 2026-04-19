// import 'dart:async';
// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:rent/core/constants/constants.dart';
// import 'package:rent/features/auth/presentation/provider/profile_operation_provider.dart';
// import 'package:rent/features/auth/presentation/provider/profile_provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../../../core/dialog/snack_bar.dart';
// import '../../../../core/helper_function/loading.dart';
// import '../../../../core/helper_function/navigation.dart';
// import '../../../../core/helper_function/prefs.dart';
// import '../../../../core/helper_function/text_form_field_validation.dart';
// import '../../../../core/models/text_field_model.dart';
// import '../../../../injection_container.dart';
//
// class LoginProvider extends ChangeNotifier {
//
//   bool isAcceptTerms=false;
//   void toggleAcceptingTerms(){
//     isAcceptTerms=!isAcceptTerms;
//     notifyListeners();
//   }
//   List<TextFieldModel> loginInputs = [];
//
//   void guestButton() {
//     sharedPreferences.setBool('onBoarding', true);
//     // Provider.of<MainProvider>(Constants.globalContext(), listen: false).goToMainPage();
//     // Provider.of<AuthProvider>(Constants.globalContext(), listen: false).goToLoginPage();
//   }
//
//
//
//   void submitLoginForm() {
//     String nameError = '';
//
//     for (var element in loginInputs) {
//       if (element.controller.text.isEmpty) {
//         String? error = element.validator!(element.controller.text);
//         if (error != null && error.isNotEmpty) {
//           nameError += '$error\n';
//         }
//       }
//     }
//     if (nameError.isEmpty) {
//     } else {
//       showToast(nameError.trim());
//     }
//   }
//
//   Future loginButton() async {
//     String token = await FirebaseMessaging.instance.getToken() ?? "123";
//     Map<String, dynamic> data = {};
//     for (var element in loginInputs) {
//       data[element.key!] = element.controller.text;
//     }
//
//     data['token'] = token;
//     loading();
//     Either<DioException, UserEntity> login = await UserUseCases(sl()).login(data);
//     navPopLoading();
//     login.fold((l) {
//       showToast(l.message!);
//     }, (r) async {
//       final provider = Provider.of<ProfileProvider>(Constants.globalContext(),listen: false);
//       provider.successLogin(userEntity: r);
//     });
//   }
//
//   void goToLoginPage() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setBool('intro', true);
//
//     loginInputs = [
//       TextFieldModel(
//           key: "phone",
//           controller: TextEditingController(),
//         label: "phone",
//         // image: Images.phone,
//         textInputType: TextInputType.phone,
//         // prefix:    SvgWidget(svg: Images.phone, width: Constants.isTablet ? 5.w : null,),
//         validator: (value) => validatePhone(value!),
//           next: true,),
//       if((sharedPreferences.getString('auth_type')??"user") == "supervisor")
//       TextFieldModel(
//           key: "password",
//           controller: TextEditingController(),
//           label: "password",
//           // image: Images.lockIcon,
//           validator: (value) => validatePassword(value!),
//           hint: "************",
//           obscureText: true,
//           next: false),
//     ];
//     navPARU(LoginPage());
//   }
//   String phoneNumber(){
//     return loginInputs.firstWhere((e)=>e.key=='phone').controller.text;
//   }
//
// }