
import 'dart:async';

import 'package:crazycar/core/shared/widgets/app_text_button.dart';
import 'package:crazycar/core/shared/widgets/app_text_fom_field.dart';
import 'package:crazycar/core/utils/colors/app_colors.dart';
import 'package:crazycar/core/utils/styles/font_manager.dart';
import 'package:crazycar/core/utils/styles/text_style_manger.dart';
import 'package:crazycar/features/car_controller_and_live_feed/logic/tracking_users_cubit/tracking_users_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

void searchAlertDialog(
    BuildContext context, TrackingUsersCubit trackingUsersCubit) {
  TextEditingController searchController = TextEditingController();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: AppColors.kWhiteColor,
        contentPadding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 20.w),
        title: Text(
          'Search about specific user ',
          style: getMediumStyle(
              fontSize: FontSize.s18,
              color: AppColors.kBlackColor,
              fontFamily: FontConstants.poppinsFontfamily),
        ),
        content: AppTextFormField(
          controller: searchController,
          keyboardtype: TextInputType.name,
          label: 'search',
          onsubbmited: (name) {
            trackingUsersCubit.searchAboutUserToTrack(name: name);
            Timer(const Duration(seconds: 1), () {
              trackingUsersCubit.setUserToTrack(id: 's');
            });
            GoRouter.of(context).pop();
          },
        ),
        actions: [
          AppTextButton(
              horizontalPadding: 0,
              verticalPadding: 0,
              buttonWidth: 50.w,
              buttonHeight: 30.h,
              buttonText: 'search',
              textStyle: getRegularStyle(
                  fontSize: FontSize.s14,
                  color: AppColors.kWhiteColor,
                  fontFamily: FontConstants.poppinsFontfamily),
              onPressed: () {
                trackingUsersCubit.searchAboutUserToTrack(
                    name: searchController.text);
                Timer(const Duration(seconds: 1), () {
                  trackingUsersCubit.setUserToTrack(id: 's');
                });
                GoRouter.of(context).pop();
              }),
        ],
      );
    },
  );
}

