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
// extension UpdateProfileFilesProvider on UpdateProfileProvider{
//   void setLocalFile(File file) {
//     localFile = file;
//     onlineFileUrl = null;
//     rebuild();
//   }
//
//   void setOnlineFile(String url) {
//     onlineFileUrl = url;
//     localFile = null;
//     rebuild();
//   }
//
//   void removeFile() {
//     localFile = null;
//     onlineFileUrl = null;
//     rebuild();
//   }
//
//   String get fileName {
//     if (localFile != null) {
//       return localFile!.path.split('/').last;
//     } else if (onlineFileUrl != null) {
//       return Uri.parse(onlineFileUrl!).pathSegments.last;
//     }
//     return '';
//   }
//
//   String get fileHealthName {
//     if (healthLocalFile != null) {
//       return healthLocalFile!.path.split('/').last;
//     } else if (onlineHealthFileUrl != null) {
//       return Uri.parse(onlineHealthFileUrl!).pathSegments.last;
//     }
//     return '';
//   }
//
//   void setLocalHealthFile(File file) {
//     healthLocalFile = file;
//     onlineHealthFileUrl = null;
//     rebuild();
//   }
//
//   void setOnlineHealthFile(String url) {
//     onlineHealthFileUrl = url;
//     healthLocalFile = null;
//     rebuild();
//   }
//
//   void removeHealthFile() {
//     healthLocalFile = null;
//     onlineHealthFileUrl = null;
//     rebuild();
//   }
//
//   void addToImages(List<XFile> img,int count){
//     List lastImages = [...images];
//     for (var i in img) {
//       if (lastImages.length < count) {
//         lastImages.add(i);
//       } else {
//         break;
//       }
//     }
//     images.clear();
//     images.addAll(lastImages);
//     rebuild();
//   }
//   void deleteImage(int index) {
//     if (images[index] is NurseryImage) {
//       deletedId.add(images[index].id);
//     }
//     images.removeAt(index);
//     rebuild();
//   }
//
//   void addToCoverImages(List<XFile> img,int count) {
//     List lastImages = [...coverImages];
//     for (var i in img) {
//       if (lastImages.length < count) {
//         lastImages.add(i);
//       } else {
//         break;
//       }
//     }
//     coverImages.clear();
//     coverImages.addAll(lastImages);
//     rebuild();
//   }
//
//   void deleteCoverImage(int index) {
//     coverImages.removeAt(index);
//     rebuild();
//   }
//
//   showUserImage() {
//     if (provider.userEntity?.image != null || image != null) {
//       if (image != null) {
//         return FileImage(File(image!.path));
//       } else {
//         return CachedNetworkImageProvider(
//           provider.userEntity!.image!,
//         );
//       }
//     }else{
//       // return const AssetImage(Images.completeDataImage);
//       return const AssetImage(AppImages.logo);
//     }
//   }
//
//   void updateImage(XFile image) {
//     imageUpdated = true;
//     this.image = image;
//     rebuild();
//   }
// }