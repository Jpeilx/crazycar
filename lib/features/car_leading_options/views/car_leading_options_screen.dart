import 'package:crazycar/core/constant/app_constance.dart';
import 'package:crazycar/core/utils/colors/app_colors.dart';
import 'package:crazycar/core/utils/helper/spacing.dart';
import 'package:crazycar/core/utils/styles/font_manager.dart';
import 'package:crazycar/core/utils/styles/text_style_manger.dart';
import 'package:crazycar/core/shared/widgets/app_text_button.dart';
import 'package:crazycar/features/car_leading_options/logic/car_option_cubit/car_options_cubit.dart';
import 'package:crazycar/features/car_controller_and_live_feed/logic/car_controller_cubit/car_controller_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarLeadingOptionsScreen extends StatelessWidget {
  const CarLeadingOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        leadingWidth: null,
        backgroundColor: AppColors.kWhiteColor,
        centerTitle: true ,
      
        automaticallyImplyLeading: false ,
        title: Text(
          'Car Leading Options',
          style: getMediumStyle(
              fontSize: FontSize.s20,
              color: AppColors.kBlackColor,
              fontFamily: FontConstants.poppinsFontfamily),
        ),
      ),
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 21.w),
      child: BlocBuilder<CarOptionsCubit, CarOptionStates>(
        builder: (context, state) {
       
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100.h,
              ),

              AppTextButton(
                  buttonText: 'mobile Control',
                  backgroundColor: AppConstance.carControllerOption =='m' ? AppColors.kPrimaryColor:  AppColors.kWhiteColor,
                  borderColor: AppColors.kPrimaryColor,
                  textStyle: getMediumStyle(
                      fontSize: FontSize.s14,
                      color:AppConstance.carControllerOption =='m' ? AppColors.kWhiteColor: AppColors.kBlackColor,
                      fontFamily: FontConstants.poppinsFontfamily),
                  onPressed: () {
                    CarOptionsCubit.get(context).changeCarControllerOption('m');
                    AppConstance.pan = 0;
                    AppConstance.tilt = 45;
                    CarControllerCubit.get(context)
                        .changePanTiltMovementDirections(
                            pan: AppConstance.pan, tilt: AppConstance.tilt);
                  }),
              verticalSpace(20),
              AppTextButton(
                  buttonText: 'Gloves Control',
                  backgroundColor: AppConstance.carControllerOption =='g' ? AppColors.kPrimaryColor:  AppColors.kWhiteColor,
                  borderColor: AppColors.kPrimaryColor,
                  textStyle: getMediumStyle(
                      fontSize: FontSize.s14,
                      color: AppConstance.carControllerOption =='g' ? AppColors.kWhiteColor:AppColors.kBlackColor,
                      fontFamily: FontConstants.poppinsFontfamily),
                  onPressed: () {
                    CarOptionsCubit.get(context).changeCarControllerOption('g');
                    CarControllerCubit.get(context)
                        .carMovementDirection(r: 1, l: 101);
                  }),
              verticalSpace(20),
              AppTextButton(
                  buttonText: 'Self Driving',
                  backgroundColor: AppConstance.carControllerOption =='a' ? AppColors.kPrimaryColor:  AppColors.kWhiteColor,
                  borderColor: AppColors.kPrimaryColor,
                  textStyle: getMediumStyle(
                      fontSize: FontSize.s14,
                      color: AppConstance.carControllerOption =='a' ? AppColors.kWhiteColor: AppColors.kBlackColor,
                      fontFamily: FontConstants.poppinsFontfamily),
                  onPressed: () {
                    CarOptionsCubit.get(context).changeCarControllerOption('a');
                  }),
            ],
          );
        },
      ),
    ));
  }
}
