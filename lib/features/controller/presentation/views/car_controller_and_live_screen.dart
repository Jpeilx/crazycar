import 'package:crazycar/core/utils/helper/spacing.dart';
import 'package:crazycar/features/controller/presentation/logic/cubit/car_controller_cubit.dart';
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
                double  l = 0 , r =0  ; 
                if (details.x<0 && details.y <=0){
                  l=((details.y*100).round()*(-1.0)) ;
                  l=0.49*l+150 ;
                  r=99 ;
                  // r=((details.x*100).round()*(-1.0)) ;
                  // r= ( -1 * 0.5)*r+99 ;
                }
                else if (details.x<0 && details.y>0){
                 
                  l=0.49*(details.y*100).round()+100 ;
                  r = 49 ; 
                  //  r=((details.x*100).round()*(-1.0)) ;
                  // r= -0.49*r+49 ;
                }
                else if (details.x>0 && details.y<=0){
                  l=199 ;  
                  r= ( -1 * 0.5)*(details.x*100).round() +99 ; 
                }
                else if (details.x>0 && details.y>0){
                  l=149 ;
                   r= -0.49*(details.x*100).round()+49 ;
                }
             CarControllerCubit.get(context) .carMovementDirection(r:r.round() , l : l.round()) ;
            
                
              },
            )
            // CarControllers(),
          ],
        ),
      ),
    ));
  }
}
