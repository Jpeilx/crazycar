import 'dart:async';

import 'package:crazycar/core/shared/widgets/app_text_button.dart';
import 'package:crazycar/core/shared/widgets/app_text_fom_field.dart';
import 'package:crazycar/core/utils/colors/app_colors.dart';
import 'package:crazycar/core/utils/helper/spacing.dart';
import 'package:crazycar/core/utils/router/app_router.dart';
import 'package:crazycar/core/utils/styles/font_manager.dart';
import 'package:crazycar/core/utils/styles/text_style_manger.dart';
import 'package:crazycar/features/users_tracking/presentation/logic/tracking_users_cubit/tracking_users_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

// ignore: must_be_immutable
class TrackedUsersScreen extends StatelessWidget {
  TrackedUsersScreen({super.key});
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: null,
        backgroundColor: AppColors.kWhiteColor,
        title: Row(
          children: [
            horizontalSpace(50),
            Text(
              'Tracked Users',
              style: getMediumStyle(
                  fontSize: FontSize.s18,
                  color: AppColors.kBlackColor,
                  fontFamily: FontConstants.poppinsFontfamily),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: AppTextFormField(
                controller: searchController,
                keyboardtype: TextInputType.name,
                label: 'search',
                onsubbmited: (name) {
                  TrackingUsersCubit.get(context)
                      .searchAboutUserToTrack(name: name);
                  Timer(const Duration(seconds: 1), () {
                    TrackingUsersCubit.get(context).setUserToTrack(id: 's');
                  });
                },
              ),
            ),
            BlocBuilder<TrackingUsersCubit, TrackingUsersStates>(
              builder: (context, state) {
                if (state is SearchAboutUrerToTrackLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (context, index) => GestureDetector(
                                  onTap: () {
                                    TrackingUsersCubit.get(context).setUserToTrack(
                                        id: '${TrackingUsersCubit.get(context).availableUserToTrackIds[index]}');
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 20,
                                    color: AppColors.kGrey1Color,
                                    child: Text(
                                      '${TrackingUsersCubit.get(context).availableUserToTrackIds[index]}',
                                      style: getMediumStyle(
                                          fontSize: FontSize.s18,
                                          color: AppColors.kBlackColor,
                                          fontFamily:
                                              FontConstants.poppinsFontfamily),
                                    ),
                                  ),
                                ),
                            separatorBuilder: (context, index) =>
                                verticalSpace(20),
                            itemCount: TrackingUsersCubit.get(context)
                                .availableUserToTrackIds
                                .length),
                      ),
                      if (state is SetUserToTrackSuccessState) ...[
                        AppTextButton(
                            buttonText: 'reset',
                            textStyle: getRegularStyle(
                                fontSize: FontSize.s16,
                                color: AppColors.kWhiteColor,
                                fontFamily: FontConstants.poppinsFontfamily),
                            onPressed: () {
                              TrackingUsersCubit.get(context)
                                  .getAvailableUserToTrack();
                            }),
                          verticalSpace(30) ,
                      ]
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: AppColors.kWhiteColor,
          ),
          isExtended: true,
          backgroundColor: AppColors.kblueColor,
          onPressed: () {
            GoRouter.of(context).push(AppRouter.kAddUserTrackingImagesScreen);
          }),
    );
  }
}
