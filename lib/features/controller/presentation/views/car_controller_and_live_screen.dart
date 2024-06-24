import 'package:crazycar/core/utils/helper/spacing.dart';
import 'package:crazycar/features/controller/presentation/views/widgets/video_timing.dart';
import 'package:flutter/material.dart';
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

  Future<void> initializePlayer() async {}

  @override
  void initState() {
    super.initState();

    _videoPlayerController = VlcPlayerController.network(
      'http://192.168.1.112:5000/video_feed',
      hwAcc: HwAcc.auto,
      autoPlay: true,
      options: VlcPlayerOptions(),
    );
  }

  @override
  void dispose() async {
    super.dispose();
    await _videoPlayerController.stopRendererScanning();
    await _videoPlayerController.dispose();
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
            VideoTiming(),
            verticalSpace(20),
            Center(
              child: VlcPlayer(
                controller: _videoPlayerController,
                aspectRatio: 16 / 9,
                placeholder: Center(child: CircularProgressIndicator()),
              ),
            ),
            // Image.asset(
            //   AssetsData.liveNotStartedImage,
            //   width: double.infinity,
            //   fit: BoxFit.fill,
            //   height: 300.h,
            // ),
            verticalSpace(70),
            Joystick(
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
                print('x') ;
                print(details.x);
                 print('y') ;
                print(details.y);
                
              },
            )
            // CarControllers(),
          ],
        ),
      ),
    ));
  }
}
