import 'package:crazycar/core/constant/app_assets.dart';
import 'package:crazycar/core/utils/helper/spacing.dart';
import 'package:crazycar/features/controller/presentation/views/widgets/car_controllers.dart';
import 'package:crazycar/features/controller/presentation/views/widgets/video_timing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarControllerAndLiveScreen extends StatelessWidget {
  const CarControllerAndLiveScreen({super.key});

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
            Image.asset(
              AssetsData.liveNotStartedImage,
              width: double.infinity,
              fit: BoxFit.fill,
              height: 300.h,
            ),
            verticalSpace(80),
            CarControllers(),
          ],
        ),
      ),
    ));
  }
}
