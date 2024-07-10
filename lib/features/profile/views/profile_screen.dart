// ignore: must_be_immutable
import 'dart:io';

import 'package:crazycar/core/constant/app_assets.dart';
import 'package:crazycar/core/shared/widgets/app_text_fom_field.dart';
import 'package:crazycar/core/shared/widgets/cached_nework_image.dart';
import 'package:crazycar/core/utils/colors/app_colors.dart';
import 'package:crazycar/core/utils/styles/font_manager.dart';
import 'package:crazycar/core/utils/styles/text_style_manger.dart';
import 'package:crazycar/features/profile/logic/profile_cubit/profile_cubit.dart';
import 'package:crazycar/features/profile/views/widgets/change_password_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController phoneController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController userNameController = TextEditingController();
  final RegExp _regex = RegExp(r'^[a-zA-Z0-9_\-\u0621-\u064A\s]+$');
  var keyForm = GlobalKey<FormState>();
  bool showChangePassword = false;

  @override
  void initState() {
    super.initState();
    phoneController.text ='+201153427473' ;
    emailController.text = 'mohammedjbeil9@gmail.com' ;
    userNameController.text = 'jbeilx' ;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileStates>(
      listener: (context, state) {
      //   if (state is UpdateProfileDataLoadingState) {
      //   //   AppLoaderDialog.show(context);
      //   // }
      //   // if (state is UpdateProfileDataSuccessState) {
      //   //   AppLoaderDialog.hide(context);
      //   //   RepeatedFunctions.showSnackBar(context, message: state.message);
      //   //   PersonalCenterCubit.get(context)
      //   //       .getProfileData(userId: '${AppConstance.userId}');
      //   //   Navigator.pop(context);
      //   // }
      //   // if (state is UpdateProfileDataErrorState) {
      //   //   AppLoaderDialog.hide(context);
      //   //   RepeatedFunctions.showSnackBar(context,
      //   //       message: state.message, error: true);
      //   // }
      },
      child: Scaffold(
        appBar:AppBar(
        leadingWidth: null,
        backgroundColor: AppColors.kWhiteColor,
        centerTitle: true ,
      
        automaticallyImplyLeading: false ,
        title: Text(
          'Profile',
          style: getMediumStyle(
              fontSize: FontSize.s20,
              color: AppColors.kBlackColor,
              fontFamily: FontConstants.poppinsFontfamily),
        ),
          actions: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    if (keyForm.currentState!.validate()) {
                      // PersonalCenterCubit.get(context).updateProfileData(
                      //   name: AppConstance.userName ?? '',
                      //   nickname: userNameController.text,
                      //   email: emailController.text,
                      //   phoneNumber: phoneController.text,
                      //   phoneCountryId: phoneCountryId ?? '1',
                      //   countryId: countryId ?? '1',
                      //   avatar: PersonalCenterCubit.get(context).imageUser ==
                      //           null
                      //       ? null
                      //       : File(PersonalCenterCubit.get(context).imageUser!),
                      // );
                    }
                  },
                  child: Text('Save' , style: getMediumStyle(fontSize: FontSize.s14, color: AppColors.kPrimaryColor, fontFamily: FontConstants.poppinsFontfamily), )
                  //  MyText(
                  //   title: AppLocalizations.of(context)!.save,
                  //   color: AppColors.navyBlue,
                  //   fontSize: 14,
                  // ),
                ),
              ],
            ),
            SizedBox(width: 26.w),
          ],
        ),
        body: SingleChildScrollView(
          child: Form(
            key: keyForm,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h, width: double.infinity),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 160.h,
                      width: 140.w,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10.0.r),
                     ),
                      child:
                          BlocBuilder<ProfileCubit, ProfileStates>(
                        builder: (context, state) {
                          return Stack(
                            children: [
                              ProfileCubit.get(context).imageUser == null
                                  ? CachedImage(
                                      url: 
                                          '',
                                      boxfit: BoxFit.cover,
                                      width: double.infinity,
                                      height: double.infinity,
                                      boxShap: BoxShape.rectangle,
                                    )
                                  : ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.file(
                                        File(ProfileCubit.get(context)
                                            .imageUser!),
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: double.infinity,
                                      ),
                                  ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  BlocBuilder<ProfileCubit, ProfileStates>(
                    builder: (context, state) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () async {
                              final ImagePicker _picker = ImagePicker();

                              final XFile? image = await _picker.pickImage(
                                  source: ImageSource.gallery);

                              if (image != null) {
                                ProfileCubit.get(context)
                                    .pickImageUser(image.path);
                              }
                            },
                            child: Text('Change Profile photo' , style: getMediumStyle(fontSize: FontSize.s16, color: AppColors.kBlackColor, fontFamily: FontConstants.poppinsFontfamily),),
                            // child: MyText(
                            //   title: AppLocalizations.of(context)!
                            //       .changeProfilePhoto,
                            //   color: AppColors.baseColor,
                            // ),
                          ),
                          if (ProfileCubit.get(context).imageUser !=
                              null) ...[
                            SizedBox(
                              width: 7.w,
                            ),
                            InkWell(
                              onTap: () {
                                ProfileCubit.get(context)
                                    .removeUserPickedImage();
                              },
                              child: SvgPicture.asset(
                               AssetsData.deleteIcon,
                               color: AppColors.kRedColor,
                                width: 16.r,
                              ),
                            ),
                          ]
                        ],
                      );
                    },
                  ),
                  SizedBox(height: 30.h),
                 Text('User Name' , style: getMediumStyle(fontSize: FontSize.s16, color: AppColors.kBlackColor, fontFamily: FontConstants.poppinsFontfamily),),
                  SizedBox(height: 10.h),
                  AppTextFormField(
                    
                    controller: userNameController,
                    validator: (String? s) {
                      if (s == null || s.isEmpty) {
                        return 'please enter your user name ';
                      }
                      if (!_regex.hasMatch(s)) {
                        return 'invalid user Name';
                      }

                      return null;
                    }, keyboardtype: TextInputType.name,
                    
                  ),
                  SizedBox(height: 10.h),
                    Text('Please don\'t use spaces ' , style: getMediumStyle(fontSize: FontSize.s14, color: AppColors.kPrimaryColor, fontFamily: FontConstants.poppinsFontfamily),),
                  SizedBox(height: 20.h),
                 Text('Phone Number' , style: getMediumStyle(fontSize: FontSize.s16, color: AppColors.kBlackColor, fontFamily: FontConstants.poppinsFontfamily),),
                  SizedBox(height: 10.h),
                  AppTextFormField(
                    
                    controller: phoneController,
                    validator: (String? s) {
                      if (s == null || s.isEmpty) {
                        return 'please enter phone number ';
                      }
                    

                      return null;
                    }, keyboardtype: TextInputType.name,
                    
                  ),
                  SizedBox(height: 20.h),
                   Text('Email' , style: getMediumStyle(fontSize: FontSize.s16, color: AppColors.kBlackColor, fontFamily: FontConstants.poppinsFontfamily),),
                  SizedBox(height: 10.h),
                   AppTextFormField(
                    
                    controller: emailController,
                    validator: (String? s) {
                      if (s == null || s.isEmpty) {
                        return 'please enter your email ';
                      }
                    

                      return null;
                    }, keyboardtype: TextInputType.emailAddress,
                    
                  ),
                  SizedBox(height: 20.h),
                  
                 
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          showChangePassword = !showChangePassword;
                        });
                      },
                      child:  Text('Change password' , style: getMediumStyle(fontSize: FontSize.s16, color: AppColors.kPrimaryColor, fontFamily: FontConstants.poppinsFontfamily),),),
                  SizedBox(
                    height: 20.h,
                  ),
                  AnimatedSize(
                      duration: const Duration(milliseconds: 300),
                      child: showChangePassword
                          ? ChangePasswordWidget()
                          : const SizedBox()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
