// import 'dart:io';
// import 'package:baby_home_nursery/core/helper_function/location.dart';
// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:provider/provider.dart';
// import 'package:rent/features/auth/presentation/provider/profile_provider.dart';
// import '../../../../core/constants/constants.dart';
// import '../../../../core/constants/images.dart';
// import '../../../../core/dialog/date_dialog.dart';
// import '../../../../core/dialog/snack_bar.dart';
// import '../../../../core/dialog/success_dialog.dart';
// import '../../../../core/helper_function/api.dart';
// import '../../../../core/helper_function/helper_function.dart';
// import '../../../../core/helper_function/loading.dart';
// import '../../../../core/helper_function/navigation.dart';
// import '../../../../core/helper_function/prefs.dart';
// import '../../../../core/helper_function/text_form_field_validation.dart';
// import '../../../../core/models/text_field_model.dart';
// import '../../../../injection_container.dart';
// import '../../domain/entities/user_entity.dart';
// import '../../domain/usecases/user_usecases.dart';
// import '../pages/register_page.dart';
// import '../../../language/presentation/provider/language_provider.dart';
// import '../widgets/register_fields_widget.dart';
// import '../widgets/room_settings_widget.dart';
// import '../widgets/times_prices_widget.dart';
// import 'auth_provider.dart';
// import 'update_profile_operation_provider.dart';
//
// class UpdateProfileProvider extends ChangeNotifier {
//   final UserUseCases useCases;
//   List<TextFieldModel> registerInputs = [];
//   List<TextFieldModel> roomSettingsInputs = [];
//   int index= 0;
//   final formKeyData = GlobalKey<FormState>();
//   final formKeySettings = GlobalKey<FormState>();
//   XFile? image;
//   bool imageUpdated = false;
//   List images=[];
//   LatLng? latLng;
//   List<int> deletedId = [];
//   List coverImages=[];
//   File? localFile;
//   String? onlineFileUrl;
//   bool fromAuthRegister = true;
//   TimesTextFieldModels? nurseryTimes;
//   bool haveToilet = false;
//   bool haveChangeToBaby = false;
//   bool madeMeals = false;
//   bool isActive = false;
//   File? healthLocalFile;
//   String? onlineHealthFileUrl;
//   UpdateProfileProvider(this.useCases);
//
//   bool get hasFile => localFile != null || onlineFileUrl != null;
//   bool get hasHealthFile => healthLocalFile != null || onlineHealthFileUrl != null;
//
//   final provider = Provider.of<ProfileProvider>(Constants.globalContext(),listen: false);
//
//   Widget selectedWidget(){
//     if(index == 0){
//       return RegisterFieldsWidget();
//     }else if(index == 1){
//       return RoomSettingsWidget();
//     }else{
//       return TimesPricesWidget();
//     }
//   }
//
//   void incrementIndex(){
//     if(index==0){
//       if (formKeyData.currentState!.validate() && (authProvider.userEntity?.image != null
//           || image != null &&imageUpdated) && hasFile && hasHealthFile) {
//       index++;
//       }else{
//         submitRegisterForm();
//       }
//     }
//     else if(index==1){
//       if (formKeySettings.currentState!.validate() && images.isNotEmpty && coverImages.isNotEmpty) {
//       index++;
//       }else{
//         submitRoomRegisterForm();
//       }
//     }
//     else{
//       if(pricesText!.priceDay.text.isNotEmpty && pricesText!.priceHour.text.isNotEmpty){
//         updateProfileButton();
//       }else{
//         showToast(LanguageProvider.translate('validation', 'nursery_prices'),);
//       }
//     }
//     notifyListeners();
//   }
//
//   void decrementIndex(){
//     if(index>0){
//       index--;
//     }
//     notifyListeners();
//   }
//
//
//
//
//   PricesTextFieldModels? pricesText;
//
//
//
//   void goToRegisterPage({bool fromAuthRegister = true}) async{
//     initForm();
//     navP(RegisterPage(),then: (s){
//       this.fromAuthRegister = false;
//     });
//   }
//   void updateProfileButton() async {
//     Map<String, dynamic> data = {};
//     for (var element in registerInputs) {
//       if(element.controller.text.isNotEmpty){
//         data[element.key!] =  element.controller.text;
//       }
//     }
//     for (var element in roomSettingsInputs) {
//       if(element.controller.text.isNotEmpty){
//         data[element.key!] =  element.controller.text;
//       }
//     }
//     if(localFile !=null){
//       data['identity'] = await MultipartFile.fromFile(localFile!.path);
//     }
//     if(healthLocalFile !=null){
//       data['health'] = await MultipartFile.fromFile(healthLocalFile!.path);
//     }
//     if (image != null && imageUpdated) {
//       data['image'] = await MultipartFile.fromFile(image!.path);
//     }
//     for(var element in coverImages){
//       if(element is XFile){
//         data['cover'] = await MultipartFile.fromFile(element.path);
//       }
//     }
//     for(int i=0;i<images.length;i++){
//       if(images[i] is XFile){
//         data['images[$i]'] =await MultipartFile.fromFile(images[i].path);
//       }
//     }
//     for(int i=0;i<deletedId.length;i++){
//       data['deleted_images[$i]']= deletedId[i];
//     }
//     data['bathroom'] = haveToilet?1:0;
//     data['place_change_baby'] = haveChangeToBaby?1:0;
//     data['make_meals'] = madeMeals?1:0;
//     data['lat']=latLng?.latitude;
//     data['lng']=latLng?.longitude;
//     data.addAll(nurseryTimes?.toMap() ??{});
//     data.addAll(pricesText?.toMap() ??{});
//     loading();
//     Either<DioException, UserEntity> login = await UserUseCases(sl()).updateProfile(data);
//     navPop();
//     login.fold((l) {
//       showToast(l.message!);
//     }, (r) async {
//       authProvider.rebuild();
//       await delay(100);
//       Provider.of<LanguageProvider>(Constants.globalContext(), listen: false).rebuild();
//       if(fromAuthRegister){
//         sharedPreferences.setString('token', ApiHandel.getInstance.dio.options.headers['Authorization']);
//         authProvider.successLogin(userEntity: r);
//       }else{
//         authProvider.setUserEntity(r);
//         successDialog(then: () {
//           navPop();
//         });
//       }
//       notifyListeners();
//     });
//   }
//
//
//
//   void rebuild() {
//     notifyListeners();
//   }
//
//
// }
//
// class PricesTextFieldModels {
//   TextEditingController priceHour;
//   TextEditingController priceDay;
//   PricesTextFieldModels({required this.priceHour,required this.priceDay,});
//   Map<String, dynamic> toMap() {
//     return {
//       "price_hour": priceHour.text,
//       "price_day": priceDay.text,
//     };
//   }
//
//
// }
