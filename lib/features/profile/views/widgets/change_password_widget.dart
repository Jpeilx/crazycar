import 'package:crazycar/core/shared/widgets/app_text_button.dart';
import 'package:crazycar/core/shared/widgets/app_text_fom_field.dart';
import 'package:crazycar/core/utils/colors/app_colors.dart';
import 'package:crazycar/core/utils/helper/spacing.dart';
import 'package:crazycar/core/utils/styles/font_manager.dart';
import 'package:crazycar/core/utils/styles/text_style_manger.dart';
import 'package:crazycar/features/profile/logic/profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class ChangePasswordWidget extends StatefulWidget {

  ChangePasswordWidget({super.key});

  @override
  State<ChangePasswordWidget> createState() => _ChangePasswordWidgetState();
}

class _ChangePasswordWidgetState extends State<ChangePasswordWidget> {
  TextEditingController oldPasswordController = TextEditingController();

  TextEditingController newPasswordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();
  bool isOldPasswordSecured = true ; 
  bool isnewPasswordSecured = true ; 
  bool isconfirmPasswordSecured = true ; 

  var passwordFormkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: passwordFormkey,
      child: BlocListener<ProfileCubit, ProfileStates>(
        listener: (context, state) {
          // if (state is UpdatePasswordLoadingState) {
          //   AppLoaderDialog.show(context);
          // }
          // if (state is UpdatePasswordSuccessState) {
          //   AppLoaderDialog.hide(context);
          //   RepeatedFunctions.showSnackBar(context, message: state.message);
          //   Navigator.pop(context);
          // }
          // if (state is UpdatePasswordErrorState) {
          //   AppLoaderDialog.hide(context);
          //   RepeatedFunctions.showSnackBar(context,
          //       message: state.message, error: true);
          // }
        },
        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                'Old password',
                style: getMediumStyle(
                    fontSize: FontSize.s16,
                    color: AppColors.kBlackColor,
                    fontFamily: FontConstants.poppinsFontfamily),
              ),
            ),
            SizedBox(height: 10.h),
            AppTextFormField(
              controller: oldPasswordController,
            
              maxLines: 1,
           
              validator: (String? s) {
                if (s == null || s.isEmpty) {
                  return 'Please Enter old password ';
                }
                return null;
              }, keyboardtype: TextInputType.name,
              suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isOldPasswordSecured = !isOldPasswordSecured;
                              });
                            },
                            child: Icon(
                              isOldPasswordSecured
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
            ),
            SizedBox(height: 20.h),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text('New password',
                  style: getMediumStyle(
                      fontSize: FontSize.s16,
                      color: AppColors.kBlackColor,
                      fontFamily: FontConstants.poppinsFontfamily)),
            ),
            SizedBox(height: 10.h),
            AppTextFormField(
              controller: newPasswordController,
            
              maxLines: 1,
           
              validator: (String? s) {
                if (s == null || s.isEmpty) {
                  return 'Please Enter new password ';
                }
                return null;
              }, keyboardtype: TextInputType.name,
              suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isnewPasswordSecured = !isnewPasswordSecured;
                              });
                            },
                            child: Icon(
                              isnewPasswordSecured
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
            ),
            SizedBox(height: 20.h),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text('Confirm password',
                  style: getMediumStyle(
                      fontSize: FontSize.s16,
                      color: AppColors.kBlackColor,
                      fontFamily: FontConstants.poppinsFontfamily)),
            ),
            SizedBox(height: 10.h),
            AppTextFormField(
              controller: newPasswordController,
            
              maxLines: 1,
           
              validator: (String? s) {
                if (s == null || s.isEmpty) {
                  return 'Please Enter confirm password ';
                }
                return null;
              }, keyboardtype: TextInputType.name,
              suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isconfirmPasswordSecured = !isconfirmPasswordSecured;
                              });
                            },
                            child: Icon(
                              isconfirmPasswordSecured
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
            ),
            verticalSpace(40) ,
            AppTextButton(
              onPressed: () {
                if (passwordFormkey.currentState!.validate()) {
                  ProfileCubit.get(context).updatePasswordData(
                      oldPassword: oldPasswordController.text,
                      newPassword: newPasswordController.text,
                      confirmPassword: confirmPasswordController.text);
                }
              },
              buttonText: 'change ',
              textStyle: getMediumStyle(
                  fontSize: FontSize.s16,
                  color: AppColors.kWhiteColor,
                  fontFamily: FontConstants.poppinsFontfamily),
            ),
            SizedBox(height: 50.h),
          ],
        ),
      ),
    );
  }
}
