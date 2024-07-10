import 'package:crazycar/core/utils/colors/app_colors.dart';
import 'package:crazycar/core/utils/helper/spacing.dart';
import 'package:crazycar/core/utils/router/app_router.dart';
import 'package:crazycar/core/utils/styles/font_manager.dart';
import 'package:crazycar/core/utils/styles/text_style_manger.dart';
import 'package:crazycar/core/shared/widgets/app_text_button.dart';
import 'package:crazycar/core/shared/widgets/app_text_fom_field.dart';
import 'package:crazycar/features/auth/views/widgets/need_an_account_text.dart';
import 'package:crazycar/features/auth/views/widgets/terms_and_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool isObscureText = true;
  late TextEditingController userNameController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50.h,) ,
                  Text(
                    'Welcome Back',
                    style: getBoldStyle(
                        fontSize: FontSize.s24,
                        color: AppColors.kPrimaryColor,
                        fontFamily: ''),
                  ),
                  verticalSpace(8),
                  Text(
                    'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                    style: getRegularStyle(
                        fontSize: FontSize.s14,
                        color: AppColors.kGreyColor,
                        fontFamily: ''),
                  ),
                  verticalSpace(36),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        AppTextFormField(
                          controller: userNameController,
                          label: 'Use Name',
                          keyboardtype: TextInputType.name,
                          prefix: const  Icon(Icons.person),
                           validator: (value) {
                              if (value!.isEmpty) {
                                return 'You Should Enter You User Name';
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
                          password: isObscureText,
                           validator: (value) {
                              if (value!.isEmpty) {
                                return 'You Should Enter Your Password';
                              }
                              return null;
                            },
                          onsubbmited: (value){
                             if (formKey.currentState!.validate()){
                               GoRouter.of(context).push(AppRouter.kAppLayoutView);
                            }
                            
                          },
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isObscureText = !isObscureText;
                              });
                            },
                            child: Icon(
                              isObscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                        ),
                        verticalSpace(40),
                        AppTextButton(
                          buttonText: "Login",
                          textStyle: getSemiBoldStyle(
                              fontSize: FontSize.s16,
                              color: AppColors.kWhiteColor,
                              fontFamily: ''),
                          onPressed: () {
                            if (formKey.currentState!.validate()){
                               GoRouter.of(context).push(AppRouter.kAppLayoutView);
                            }
                            
                           
                          },
                        ),
                        verticalSpace(16),
                        const TermsAndConditionsText(),
                        verticalSpace(60),
                        const NeedAnAccountText(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
