import 'package:crazycar/core/utils/colors/app_colors.dart';
import 'package:crazycar/core/utils/helper/spacing.dart';
import 'package:crazycar/core/utils/router/app_router.dart';
import 'package:crazycar/core/utils/styles/font_manager.dart';
import 'package:crazycar/core/utils/styles/text_style_manger.dart';
import 'package:crazycar/features/users_tracking/presentation/logic/tracking_users_cubit/tracking_users_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class TrackedUsersScreen extends StatelessWidget {
  const TrackedUsersScreen({super.key});

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
      body: BlocBuilder<TrackingUsersCubit, TrackingUsersStates>(
        builder: (context, state) {
          return ListView.separated(
              itemBuilder: (context, index) => GestureDetector(
                onTap: (){
                  TrackingUsersCubit.get(context).setUserToTrack(id: TrackingUsersCubit.get(context).availableUserToTrackIds[index]);
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
                            fontFamily: FontConstants.poppinsFontfamily),
                      ),
                    ),
              ),
              separatorBuilder: (context, index) => verticalSpace(20),
              itemCount: TrackingUsersCubit.get(context).availableUserToTrackIds.length);
        },
      ),
      floatingActionButton: FloatingActionButton(
          child:  Icon(
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
