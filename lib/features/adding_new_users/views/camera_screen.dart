import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:crazycar/core/shared/cubits/notifications_cubit/notifications_cubit.dart';
import 'package:crazycar/core/utils/colors/app_colors.dart';
import 'package:crazycar/core/utils/functions/repeated_functions.dart';
import 'package:crazycar/core/utils/styles/font_manager.dart';
import 'package:crazycar/core/utils/styles/text_style_manger.dart';
import 'package:crazycar/core/shared/widgets/app_text_button.dart';
import 'package:crazycar/features/adding_new_users/logic/add_new_user_to_track_cubit/add_new_user_to_track_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? controller;
  bool isStreaming = false;
  int count = 10;
  File? file;
  late Timer timer;
  @override
  void initState() {
    
    timer = Timer.periodic(const Duration(seconds: 5),
        (Timer t) => NotificationsCubit.get(context).getNotifications());
    initializeCamera();
    super.initState();
  }

  Future<void> initializeCamera() async {
    final cameras = await availableCameras();
    final frontCamera = cameras.firstWhere(
      (camera) => camera.lensDirection == CameraLensDirection.front,
    );
    controller = CameraController(frontCamera, ResolutionPreset.medium);
    await controller?.initialize();
    setState(() {});
  }

  Future<void> startStreaming() async {
    AddNewUserToTrackCubit.get(context).addnewUserToTrack();
    if (controller != null && controller!.value.isInitialized) {
      
        var tempFile = controller?.takePicture();
        if (tempFile != null) {
          var file = await tempFile;
          AddNewUserToTrackCubit.get(context)
              .sendVideoStreamFrame(encodedFrame: File(file.path));
         
        }
    }
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NotificationsCubit, NotificationsStates>(
      listener: (context, state) {
        if (state is GetNotificationsSuccessState) {
          if (state.message == 'n') {
            RepeatedFunctions.showSnackBar(context,
                message: 'No New Person Found!');
          }
          if (state.message == 's') {
            RepeatedFunctions.showSnackBar(context,
                message: 'Successfully add new person');
            GoRouter.of(context).pop() ;
            GoRouter.of(context).pop() ;
          }
        }
      },
      child: Scaffold(
        body: controller != null
            ? Stack(
                children: [
                  Transform.scale(
                    scale: 1.6,
                    child: CameraPreview(controller!)),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child:  AppTextButton(
                        buttonText: isStreaming ? "cancel" : 'start',
                        textStyle: getMediumStyle(
                            fontSize: FontSize.s14,
                            color: AppColors.kWhiteColor,
                            fontFamily: FontConstants.poppinsFontfamily),
                        onPressed: () {
                          if (!isStreaming){
                            startStreaming();
                            setState(() {

                              isStreaming = true ;
                            });
                          }
                          else {
                            GoRouter.of(context).pop();
                          }
                               
                        }),
                  )
                ],
              )
            : const SizedBox(),
      ),
    );
  }
}
