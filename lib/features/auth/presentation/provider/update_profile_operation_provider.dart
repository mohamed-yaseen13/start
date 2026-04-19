//
// import 'package:rent/features/auth/presentation/provider/update_profile_provider.dart';
//
// extension UpdateProfileOperationProvider on UpdateProfileProvider{
//   void submitRegisterForm() {
//     String nameError = '';
//
//     if (image ==null && authProvider.userEntity?.image==null) {
//       String error = validateImage();
//       nameError += '$error\n';
//     }
//     if(!hasFile && authProvider.userEntity?.identity==null){
//       String? error = validateIdentity("");
//       nameError += '$error\n';
//     }
//     if(!hasHealthFile && authProvider.userEntity?.health==null){
//       String? error = validateHealthCertificate("");
//       nameError += '$error\n';
//     }
//     if(latLng==null){
//       String? error = validateProductLocation();
//       nameError += '$error\n';
//     }
//     for (var element in registerInputs) {
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
//   void submitRoomRegisterForm() {
//     String nameError = '';
//
//     if (coverImages.isEmpty) {
//       String? error = validateUploadCover("");
//       nameError += '$error\n';
//     }
//     if(images.isEmpty){
//       String? error = validateUploadGallery("");
//       nameError += '$error\n';
//     }
//
//     for (var element in roomSettingsInputs) {
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
//   void setActive(){
//     isActive = !isActive;
//     // updateProfileButton(isUpdateActive: true);
//     rebuild();
//   }
//   void addPrices({UserEntity ?user}){
//     pricesText=PricesTextFieldModels(priceDay: TextEditingController(text: "${user?.priceDay??""}",),
//       priceHour:TextEditingController(text: "${user?.priceHour??""}"),
//     );
//     rebuild();
//   }
//
//   void changeHaveToilet(){
//     haveToilet=!haveToilet;
//     rebuild();
//   }
//
//   void changeHaveChangeToBaby(){
//     haveChangeToBaby=!haveChangeToBaby;
//     rebuild();
//   }
//
//   void changeMadeMeals(){
//     madeMeals=!madeMeals;
//     rebuild();
//   }
//   void initForm({bool fromAuthRegister = false}){
//     bool showLoading = false;
//     if(myLatLng==null){
//       showLoading = true;
//       loading();
//     }
//     await determinePosition();
//     if(showLoading){
//       navPop();
//     }
//     localFile = null;
//     healthLocalFile = null;
//     this.fromAuthRegister = fromAuthRegister;
//     latLng = authProvider.userEntity?.lat==null?myLatLng!:
//     LatLng(authProvider.userEntity!.lat!.toDouble(), authProvider.userEntity!.lng!.toDouble());
//     image = null;
//     images = [];
//     coverImages = [];
//     deletedId =[];
//     imageUpdated = false;
//     haveToilet = authProvider.userEntity?.bathroom??false;
//     haveChangeToBaby = authProvider.userEntity?.placeChangeBaby??false;
//     madeMeals = authProvider.userEntity?.makeMeals??false;
//     registerInputs = [
//       TextFieldModel(
//         key: "email",
//         controller: TextEditingController(text: authProvider.userEntity?.email??""),
//         // image: Images.mailIcon,
//         validator: (value) => validateEmail(value!),
//         textInputType: TextInputType.emailAddress,
//         label: "email",
//         next: true,
//       ),
//       TextFieldModel(
//           key: "name",
//           controller: TextEditingController(text: authProvider.userEntity?.name ?? ""),
//           validator: (value) => validateNurseryName(value),
//           // prefix:    SvgWidget(svg: Images.user, width: Constants.isTablet ? 5.w : null,),
//           next: true,
//           label: "nursery_name"),
//       TextFieldModel(
//           key: "description",
//           controller: TextEditingController(text: authProvider.userEntity?.description??""),
//           validator: (value) => validateNotes(value),
//           // prefix:    SvgWidget(svg: Images.user, width: Constants.isTablet ? 5.w : null,),
//           next: true,max: 4,
//           label: "about_nursery"),
//       TextFieldModel(
//           key: "important_note",
//           controller: TextEditingController(text: authProvider.userEntity?.importantNote??""),
//           validator: (value) => validateNotes(value),
//           // prefix:    SvgWidget(svg: Images.user, width: Constants.isTablet ? 5.w : null,),
//           next: true,max: 4,
//           label: "important_note"),
//       TextFieldModel(
//           key: "experience",
//           controller: TextEditingController(text: authProvider.userEntity?.experience??""),
//           validator: (value) => validateExperience(value),
//           // prefix:    SvgWidget(svg: Images.user, width: Constants.isTablet ? 5.w : null,),
//           next: false,
//           label: "experience"),
//     ];
//     roomSettingsInputs=[
//       TextFieldModel(key: "room_size",
//         controller: TextEditingController(text: "${authProvider.userEntity?.roomSize??""}"),
//         validator: (value) => validateRoomSpace(value!),
//         textInputType: TextInputType.number,
//         label: "room_space",
//         next: true,
//       ),
//       TextFieldModel(
//           key: "age_from",
//           controller: TextEditingController(text: "${authProvider.userEntity?.ageFrom ?? ""}"),
//           validator: (value) => validateFromAge(value),
//           textInputType: TextInputType.number,
//           // prefix:    SvgWidget(svg: Images.user, width: Constants.isTablet ? 5.w : null,),
//           next: true,
//           label: "from_age"),
//       TextFieldModel(
//           key: "age_to",textInputType: TextInputType.number,
//           controller: TextEditingController(text: "${authProvider.userEntity?.ageTo ?? ""}"),
//           validator: (value) => validateToAge(value),
//
//           // prefix:    SvgWidget(svg: Images.user, width: Constants.isTablet ? 5.w : null,),
//           next: true,
//           label: "to_age"),
//       TextFieldModel(
//           key: "max_children",textInputType: TextInputType.number,
//           controller: TextEditingController(text: "${authProvider.userEntity?.maxChildren ?? ""}"),
//           validator: (value) => validateMaxChildren(value),
//           // prefix:    SvgWidget(svg: Images.user, width: Constants.isTablet ? 5.w : null,),
//           next: true,
//           label: "max_children"),
//     ];
//     index=0;
//     onlineHealthFileUrl = authProvider.userEntity?.health;
//     onlineFileUrl = authProvider.userEntity?.identity;
//     Provider.of<UpdateProfileProvider>(Constants.globalContext(), listen: false).addTimes(user: authProvider.userEntity);
//     Provider.of<UpdateProfileProvider>(Constants.globalContext(), listen: false).addPrices(user: authProvider.userEntity);
//     if(authProvider.userEntity?.images!=null){
//       for(var element in authProvider.userEntity!.images!){
//         images.add(element);
//
//       }
//     }
//     if(authProvider.userEntity?.cover !=null){
//       coverImages.add(authProvider.userEntity?.cover);
//     }
//   }
// }