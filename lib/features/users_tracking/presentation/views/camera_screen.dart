import 'dart:io';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:crazycar/core/utils/colors/app_colors.dart';
import 'package:crazycar/core/utils/styles/font_manager.dart';
import 'package:crazycar/core/utils/styles/text_style_manger.dart';
import 'package:crazycar/core/widgets/app_text_button.dart';
import 'package:crazycar/features/users_tracking/presentation/logic/video_streaming_cubit/video_streaming_cubit.dart';
import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? controller;
  bool isStreaming = false;
  int count = 10 ;
  File ? file ;
  @override
  void initState() {
    VideoStreamingCubit.get(context).addnewUserToTrack() ;
    initializeCamera();
    super.initState();
  }

  Future<void> initializeCamera() async {
    final cameras = await availableCameras();
    final frontCamera = cameras.firstWhere(
      (camera) => camera.lensDirection == CameraLensDirection.front,
    );
    controller = CameraController(frontCamera, ResolutionPreset.low );
    await controller?.initialize();
    setState(() {});
  }

 void startStreaming() {
  if (controller != null && controller!.value.isInitialized) {
    controller?.startImageStream((CameraImage image) {
      Uint8List list = image.planes.first.bytes;
      VideoStreamingCubit.get(context).sendVideoStreamFrame(encodedFrame: list);
    });
    setState(() {
      isStreaming = true;
    });
  }
}

  void stopStreaming() {
    controller?.stopImageStream();
    setState(() {
      isStreaming = false;
    });
  }

  void sendFrame(CameraImage image) async {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller != null
          ? Stack(
              children: [
                CameraPreview(controller!),
               file!= null ? Image.file(file ?? File('')) : SizedBox() ,
                Align(
                  alignment: Alignment.bottomCenter,
                  child: AppTextButton(
                      buttonText: isStreaming ? "cancel" : 'start',
                      textStyle: getMediumStyle(
                          fontSize: FontSize.s14,
                          color: AppColors.kWhiteColor,
                          fontFamily: FontConstants.poppinsFontfamily),
                      onPressed: (){
                        isStreaming ? stopStreaming() : startStreaming();
                      }),
                )
              ],
            )
          : const SizedBox(),
    );
  }
}
