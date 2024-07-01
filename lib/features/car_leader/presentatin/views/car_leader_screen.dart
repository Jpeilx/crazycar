import 'package:crazycar/core/utils/colors/app_colors.dart';
import 'package:crazycar/core/utils/helper/spacing.dart';
import 'package:crazycar/core/utils/styles/font_manager.dart';
import 'package:crazycar/core/utils/styles/text_style_manger.dart';
import 'package:crazycar/core/widgets/app_text_button.dart';
import 'package:crazycar/features/car_leader/presentatin/logic/car_option_cubit/car_options_cubit.dart';
import 'package:crazycar/features/controller/presentation/logic/cubit/car_controller_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QRView extends StatelessWidget {
  const QRView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 21.w),
      child: Column(
        children: [
          SizedBox(
            height: 100.h,
          ),

          AppTextButton(
              buttonText: 'mobile Control',
              textStyle: getMediumStyle(
                  fontSize: FontSize.s14,
                  color: AppColors.kBlackColor,
                  fontFamily: FontConstants.poppinsFontfamily),
              onPressed: () {
                CarOptionsCubit.get(context).changeCarControllerOption('m') ;
              }),
          verticalSpace(20),
          AppTextButton(
              buttonText: 'Gloves Control',
              textStyle: getMediumStyle(
                  fontSize: FontSize.s14,
                  color: AppColors.kBlackColor,
                  fontFamily: FontConstants.poppinsFontfamily),
              onPressed: () {
                 CarOptionsCubit.get(context).changeCarControllerOption('g') ;
                  CarControllerCubit.get(context) .carMovementDirection(r:1, l : 101) ;
              }),
          verticalSpace(20),
          AppTextButton(
              buttonText: 'Self Driving',
              textStyle: getMediumStyle(
                  fontSize: FontSize.s14,
                  color: AppColors.kBlackColor,
                  fontFamily: FontConstants.poppinsFontfamily),
              onPressed: () {
                 CarOptionsCubit.get(context).changeCarControllerOption('a') ;
              }),
          // SizedBox(
          //     width: 389.w,
          //     height: 512.h,
          //     child: ClipRRect(
          //         borderRadius: BorderRadius.circular(15),
          //         child: QrReaderView())),
          // verticalSpace(80) ,
          // Text('Scan Your Code' , style: getBoldStyle(fontSize: FontSize.s32 , color: AppColors.kBlackColor, fontFamily: FontConstants.poppinsFontfamily),)
        ],
      ),
    ));
  }
}
