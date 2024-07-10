import 'package:crazycar/core/shared/widgets/app_text_button.dart';
import 'package:crazycar/core/shared/widgets/app_text_fom_field.dart';
import 'package:crazycar/core/utils/colors/app_colors.dart';
import 'package:crazycar/core/utils/helper/spacing.dart';
import 'package:crazycar/core/utils/styles/font_manager.dart';
import 'package:crazycar/core/utils/styles/text_style_manger.dart';
import 'package:crazycar/features/auth/views/widgets/already_have_account_text.dart';
import 'package:crazycar/features/auth/views/widgets/terms_and_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
    final formKey = GlobalKey<FormState>();
  bool isPasswordObscureText = true;
  bool isConfirmPasswordObscureText = true;
  late TextEditingController userNameController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  late TextEditingController confirmpasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create Account',
                  style: getBoldStyle(
                      fontSize: FontSize.s24,
                      color: AppColors.kPrimaryColor,
                      fontFamily: FontConstants.poppinsFontfamily),
                ),
                verticalSpace(8),
                Text(
                  'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                  style: getRegularStyle(
                      fontSize: FontSize.s14,
                      color: AppColors.kGreyColor,
                      fontFamily: FontConstants.poppinsFontfamily),
                ),
                verticalSpace(36),
                Column(
                  children: [
                    AppTextFormField(
                          controller: emailController,
                          label: 'Email',
                          keyboardtype: TextInputType.name,
                          prefix: const  Icon(Icons.email_outlined),
                           validator: (value) {
                              if (value!.isEmpty) {
                                return 'You Should Enter You Email ';
                              }
                              return null;
                            },
                        ),
                        verticalSpace(18),
                     AppTextFormField(
                          controller: userNameController,
                          label: 'Use Name',
                          keyboardtype: TextInputType.name,
                          prefix: const  Icon(Icons.person),
                           validator: (value) {
                              if (value!.isEmpty) {
                                return 'You Should Enter You User Name ';
                              }
                              return null;
                            },
                        ),
                        verticalSpace(18),
                        AppTextFormField(
                          controller: passwordController,
                          keyboardtype: TextInputType.name,
                          prefix: Icon(Icons.lock_outline),
                          label: 'Password',
                          maxLines: 1,
                          password: isPasswordObscureText,
                           validator: (value) {
                              if (value!.isEmpty) {
                                return 'You Should Enter Your Password';
                              }
                              return null;
                            },
                          
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isPasswordObscureText = !isPasswordObscureText;
                              });
                            },
                            child: Icon(
                              isPasswordObscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                        ),
                        verticalSpace(18),
                        AppTextFormField(
                          controller: confirmpasswordController,
                          keyboardtype: TextInputType.name,
                          prefix: Icon(Icons.lock_outline),
                          label: 'Confirm Password',
                          maxLines: 1,
                          password: isPasswordObscureText,
                           validator: (value) {
                              if (value!.isEmpty) {
                                return 'You Should Enter Confirm Password';
                              }
                              return null;
                            },
                          
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isConfirmPasswordObscureText = !isConfirmPasswordObscureText;
                              });
                            },
                            child: Icon(
                              isConfirmPasswordObscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                        ),
                    verticalSpace(40),
                    AppTextButton(
                      buttonText: "Create Account",
                      textStyle: getSemiBoldStyle(
                          fontSize: FontSize.s16,
                          color: AppColors.kWhiteColor,
                          fontFamily: ''),
                      onPressed: () {},
                    ),
                    verticalSpace(16),
                    const TermsAndConditionsText(),
                    verticalSpace(30),
                    const AlreadyHaveAccountText(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
