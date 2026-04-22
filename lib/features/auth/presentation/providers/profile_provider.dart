// import 'dart:async';
// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:rent/features/auth/presentation/provider/profile_operation_provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../../../core/constants/constants.dart';
// import '../../../../core/dialog/confirm_dialog.dart';
// import '../../../../core/dialog/snack_bar.dart';
// import '../../../../core/helper_function/api.dart';
// import '../../../../core/helper_function/loading.dart';
// import '../../../../core/helper_function/navigation.dart';
// import '../../../../core/helper_function/prefs.dart';
// import '../../../../core/helper_function/text_form_field_validation.dart';
// import '../../../../core/models/text_field_model.dart';
// import '../../../../injection_container.dart';
// import '../../../main/presentation/provider/main_page_provider.dart';
// import '../../domain/entities/user_entity.dart';
// import '../../domain/usecases/user_usecases.dart';
// import '../pages/login_page.dart';
// import '../../../language/presentation/provider/language_provider.dart';
// import 'update_profile_provider.dart';
//
// class ProfileProvider extends ChangeNotifier {
//   UserEntity? userEntity;
//
//   void rebuild() {
//     notifyListeners();
//   }
//
//
//   static bool isLogin() {
//     return sharedPreferences.getString('token') ?? false;
//   }
//
//   Future getProfile() async {
//     Map<String, dynamic> data = {};
//     Either<DioException, UserEntity> login = await UserUseCases(sl()).getProfile(data);
//     login.fold((l) {
//       showToast(l.message!);
//     }, (r) async {
//       userEntity = r;
//       notifyListeners();
//     });
//   }
//
//   Future autoReLoginFromSplash({bool fromSplash = false}) async {
//     Map<String, dynamic> data = {};
//     Either<DioException, UserEntity> login = await UserUseCases(sl()).getProfile(data);
//     login.fold((l) {
//       showToast(l.message!);
//       goToLoginPage();
//     }, (r) async {
//         successLogin(userEntity: r,fromSplash: fromSplash);
//       notifyListeners();
//     });
//   }
//
//   bool isGuest() {
//     return userEntity == null;
//   }
//
//
//   Future refreshToken() async {
//     Map<String ,dynamic> data={};
//     data['token'] = sharedPreferences.getString('token');
//     Either<DioException, String> refreshToken = await UserUseCases(sl()).refreshToken(data);
//     refreshToken.fold((l) {
//     }, (r) async {
//       userEntity?.token = r;
//       ApiHandel.getInstance.updateHeader(r);
//       sharedPreferences.setString('token', r);
//     });
//   }
//
//
// }