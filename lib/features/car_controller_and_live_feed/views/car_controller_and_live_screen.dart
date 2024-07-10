import 'dart:async';
import 'package:crazycar/core/constant/app_constance.dart';
import 'package:crazycar/core/shared/widgets/app_text_button.dart';
import 'package:crazycar/core/utils/colors/app_colors.dart';
import 'package:crazycar/core/utils/functions/repeated_functions.dart';
import 'package:crazycar/core/utils/helper/spacing.dart';
import 'package:crazycar/core/utils/styles/font_manager.dart';
import 'package:crazycar/core/utils/styles/text_style_manger.dart';
import 'package:crazycar/features/car_controller_and_live_feed/logic/car_controller_cubit/car_controller_cubit.dart';
import 'package:crazycar/features/car_controller_and_live_feed/views/widgets/id_container.dart';
import 'package:crazycar/features/car_controller_and_live_feed/views/widgets/search_alert_dialog.dart';
import 'package:crazycar/features/car_controller_and_live_feed/views/widgets/video_feed_%20text.dart';
import 'package:crazycar/features/car_controller_and_live_feed/logic/tracking_users_cubit/tracking_users_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

class CarControllerAndLiveScreen extends StatefulWidget {
  const CarControllerAndLiveScreen({super.key});

  @override
  State<CarControllerAndLiveScreen> createState() =>
      _CarControllerAndLiveScreenState();
}

class _CarControllerAndLiveScreenState
    extends State<CarControllerAndLiveScreen> {
  late VlcPlayerController _videoPlayerController;
  late Timer timer;

  @override
  void initState() {
    

    _initializePlayer();
    timer = Timer.periodic(const Duration(seconds: 2),
        (Timer t) => TrackingUsersCubit.get(context).getAvailableUserToTrack());
    super.initState();
  }

  Future<void> _initializePlayer() async {
    _videoPlayerController = VlcPlayerController.network(
      '${AppConstance.apisBaseURL}/video_feed',
      hwAcc: HwAcc.disabled,
      autoPlay: true,
      options: VlcPlayerOptions(
        advanced: VlcAdvancedOptions([
          VlcAdvancedOptions.networkCaching(50), // Reduce network caching
          VlcAdvancedOptions.liveCaching(100), // Reduce live caching
          VlcAdvancedOptions.fileCaching(100), // Reduce file caching
        ]),
        http: VlcHttpOptions([
          VlcHttpOptions.httpReconnect(true),
        ]),
      ),
    );
    await _videoPlayerController.initialize();
  }

  @override
  Future<void> deactivate() async {
    await _videoPlayerController.stopRendererScanning();
    await _videoPlayerController.dispose();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              verticalSpace(50),
              const VideoFeedText(),
              verticalSpace(20),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onPanUpdate: (details) {
                  CarControllerCubit.get(context).panTiltMapper(details.delta.dx,details.delta.dy);
                },
                child: IgnorePointer(
                  ignoring: true,
                  child: Center(
                    child: VlcPlayer(
                      controller: _videoPlayerController,
                      aspectRatio: 1.33,
                      placeholder: const  Center(child: CircularProgressIndicator()),
                    ),
                  ),
                ),
              ),
              verticalSpace(20),
              BlocBuilder<TrackingUsersCubit, TrackingUsersStates>(
                buildWhen: (previous, current) =>
                    current is GetAvailableUsersToTrackErrorState ||
                    current is GetAvailableUsersToTrackSuccessState || 
                    current is SetUserToTrackSuccessState || 
                    current is SetUserToTrackLoadingState ||
                    current is SearchAboutUrerToTrackSuccessState ,
                builder: (context, state) {
                  if ( (state is GetAvailableUsersToTrackErrorState  || state is SetUserToTrackLoadingState || state is SetUserToTrackSuccessState || state is SearchAboutUrerToTrackSuccessState )  &&
                      TrackingUsersCubit.get(context)
                          .availableUserToTrackIds
                          .isNotEmpty) {
                    return SizedBox(
                      height: 50.h,
                      child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              TrackingUsersCubit.get(context).setUserToTrack(id: '${TrackingUsersCubit.get(context).availableUserToTrackIds[index]}');
                            },
                            child: IdContainer(
                                  number:
                                      '${TrackingUsersCubit.get(context).availableUserToTrackIds[index]}',
                                  trackedUser: TrackingUsersCubit.get(context)
                                          .trackedUser ==
                                      '${TrackingUsersCubit.get(context).availableUserToTrackIds[index]}',
                                ),
                          ),
                          separatorBuilder: (context, index) =>
                              horizontalSpace(20),
                          itemCount: TrackingUsersCubit.get(context)
                              .availableUserToTrackIds
                              .length),
                    );
                  } else {
                    return  verticalSpace(20);
                  }
                },
              ),
              verticalSpace(20),
              BlocBuilder<TrackingUsersCubit, TrackingUsersStates>(
                  buildWhen: (previous, current) =>
                      current is SetUserToTrackSuccessState ||
                      current is SearchAboutUrerToTrackSuccessState,
                  builder: (context, state) {
                    if (TrackingUsersCubit.get(context).trackedUser != '0') {
                      return Align(
                        alignment: Alignment.bottomRight,
                        child: AppTextButton(
                            buttonWidth: 100.w,
                            buttonText: 'reset',
                            textStyle: getRegularStyle(
                                fontSize: FontSize.s16,
                                color: AppColors.kWhiteColor,
                                fontFamily: FontConstants.poppinsFontfamily),
                            onPressed: () {
                              TrackingUsersCubit.get(context)
                                  .setUserToTrack(id: '0');
                            }),
                      );
                    } else {
                      return verticalSpace(50);
                    }
                  }),
              verticalSpace(10),
              Joystick(
                period: const Duration(seconds: 1),
                base: JoystickBase(
                  decoration: JoystickBaseDecoration(
                    color: Colors.black,
                    drawOuterCircle: false,
                  ),
                  arrowsDecoration: JoystickArrowsDecoration(
                    color: Colors.blue,
                  ),
                ),
                listener: (details) {
                  CarControllerCubit.get(context).joystickMapper(details.x, details.y) ;
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton:
          BlocListener<TrackingUsersCubit, TrackingUsersStates>(
        listener: (context, state) {
          if (state is SearchAboutUrerToTrackSuccessState) {
            RepeatedFunctions.showSnackBar(context, message: 'Searching Start');
          }
          if (state is SearchAboutUrerToTrackErrorState) {
            RepeatedFunctions.showSnackBar(context,
                message: 'OOPs!! We have an expected error occurred  ');
          }
        },
        child: FloatingActionButton(
            isExtended: true,
            backgroundColor: AppColors.kblueColor,
            onPressed: () {
              searchAlertDialog(context, TrackingUsersCubit.get(context));
            },
            child: const Icon(
              Icons.search,
              color: AppColors.kWhiteColor,
            )),
      ),
    );
  }
}
