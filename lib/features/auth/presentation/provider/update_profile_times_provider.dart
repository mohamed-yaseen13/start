//
//
// import 'dart:io';
//
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:camera/camera.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:rent/core/constants/app_images.dart';
// import 'package:rent/features/auth/presentation/provider/update_profile_provider.dart';
//
// extension UpdateProfileTimesProvider on UpdateProfileProvider{
//   void addTimes({UserEntity ?user}){
//     nurseryTimes =TimesTextFieldModels(satStartTime: TextEditingController(text: user?.times?.satStartTime??""),
//       satEndTime:TextEditingController(text: user?.times?.satEndTime??""),
//       sunStartTime:TextEditingController(text: user?.times?.sunStartTime??""),
//       sunEndTime: TextEditingController(text: user?.times?.sunEndTime??""),
//       monStartTime: TextEditingController(text: user?.times?.monStartTime??""),
//       monEndTime: TextEditingController(text: user?.times?.monEndTime??""),
//       tueStartTime: TextEditingController(text: user?.times?.tueStartTime??""),
//       tueEndTime: TextEditingController(text: user?.times?.tueEndTime??""),
//       wedStartTime: TextEditingController(text: user?.times?.wedStartTime??""),
//       wedEndTime: TextEditingController(text: user?.times?.wedEndTime??""),
//       thuStartTime: TextEditingController(text: user?.times?.thuStartTime??""),
//       thuEndTime: TextEditingController(text: user?.times?.thuEndTime??""),
//       friStartTime: TextEditingController(text: user?.times?.friStartTime??""),
//       friEndTime: TextEditingController(text: user?.times?.friEndTime??""),
//
//     );
//     rebuild();
//   }
//
//   void selectNurseryStartTime({required String day}){
//     selectTime().then((value){
//       if(value !=null){
//         nurseryTimes?.getStartTimes()[day]?.text = "${value.hour}:${value.minute}:00";
//       }
//     });
//     rebuild();
//   }
//
//   void selectNurseryEndTime({required String day}){
//     selectTime().then((value){
//       if(value !=null){
//         nurseryTimes?.getEndTimes()[day]?.text = "${value.hour}:${value.minute}:00";
//       }
//     });
//     rebuild();
//   }
//   bool isAvailable({required String day}) {
//     return (nurseryTimes?.getEndTimes()[day]?.text.isNotEmpty ??false) && (nurseryTimes?.getStartTimes()[day]?.text.isNotEmpty??false);
//   }
//
//   void setAvailable({required String day}){
//     if((nurseryTimes?.getStartTimes()[day]?.text.isEmpty??false) && (nurseryTimes?.getEndTimes()[day]?.text.isEmpty??false)){
//       nurseryTimes?.getStartTimes()[day]?.text = "00:00:00";
//       nurseryTimes?.getEndTimes()[day]?.text = "24:00:00";
//     }else{
//       nurseryTimes?.getStartTimes()[day]?.text ="";
//       nurseryTimes?.getEndTimes()[day]?.text = "";
//     }
//     notifyListeners();
//   }
//
//   List<String> getAvailableTimes(){
//     return ["sat","sun","mon","tue","wed","thu","fri"];
//   }
//
//
// }
// class TimesTextFieldModels {
//   TextEditingController satStartTime;
//   TextEditingController satEndTime;
//   TextEditingController sunStartTime;
//   TextEditingController sunEndTime;
//   TextEditingController monStartTime;
//   TextEditingController monEndTime;
//   TextEditingController tueStartTime;
//   TextEditingController tueEndTime;
//   TextEditingController wedStartTime;
//   TextEditingController wedEndTime;
//   TextEditingController thuStartTime;
//   TextEditingController thuEndTime;
//   TextEditingController friStartTime;
//   TextEditingController friEndTime;
//   TimesTextFieldModels({required this.satStartTime,required this.satEndTime,
//     required this.sunEndTime,required this.monStartTime,required this.monEndTime,
//     required this.tueStartTime,required this.tueEndTime,required this.wedStartTime,
//     required this.wedEndTime,required this.thuStartTime,required this.thuEndTime,required this.sunStartTime,
//     required this.friStartTime,required this.friEndTime,
//   });
//
//   Map<String, TextEditingController> getStartTimes() {
//     return {
//       'sat': satStartTime,
//       'sun': sunStartTime,
//       'mon': monStartTime,
//       'tue': tueStartTime,
//       'wed': wedStartTime,
//       'thu': thuStartTime,
//       'fri': friStartTime,
//     };
//   }
//
//   Map<String, TextEditingController> getEndTimes() {
//     return {
//       'sat': satEndTime,
//       'sun': sunEndTime,
//       'mon': monEndTime,
//       'tue': tueEndTime,
//       'wed': wedEndTime,
//       'thu': thuEndTime,
//       'fri': friEndTime,
//     };
//   }
//
//   bool get isAvailable {
//     return false;
//   }
//
//   Map<String, dynamic> toMap() {
//     Map<String, dynamic> map= {
//       "sat_start_time": satStartTime.text.isNotEmpty ? satStartTime.text: null,
//       "sat_end_time": satEndTime.text.isNotEmpty ? satEndTime.text: null,
//       "sun_start_time": sunStartTime.text.isNotEmpty ?sunStartTime.text:null,
//       "sun_end_time": sunEndTime.text.isNotEmpty ? sunEndTime.text :null ,
//       "mon_start_time": monStartTime.text.isNotEmpty ? monStartTime.text :null,
//       "mon_end_time": monEndTime.text.isNotEmpty ? monEndTime.text :null,
//       "tue_start_time": tueStartTime.text.isNotEmpty? tueStartTime.text:null,
//       "tue_end_time": tueEndTime.text.isNotEmpty? tueEndTime.text:null,
//       "wed_start_time": wedStartTime.text.isNotEmpty ? wedStartTime.text:null,
//       "wed_end_time": wedEndTime.text.isNotEmpty ? wedEndTime.text:null,
//       "thu_start_time": thuStartTime.text.isNotEmpty ? thuStartTime.text:null,
//       "thu_end_time": thuEndTime.text.isNotEmpty ? thuEndTime.text:null,
//       "fri_start_time": friStartTime.text.isNotEmpty? friStartTime.text:null,
//       "fri_end_time": friEndTime.text.isNotEmpty? friEndTime.text:null,
//     };
//     // map.removeWhere((key, value) => value.isEmpty);
//     return map;
//   }
// }