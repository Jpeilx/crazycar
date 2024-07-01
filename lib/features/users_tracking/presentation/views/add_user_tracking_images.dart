
import 'package:crazycar/core/utils/colors/app_colors.dart';
import 'package:crazycar/core/utils/helper/spacing.dart';
import 'package:crazycar/core/utils/router/app_router.dart';
import 'package:crazycar/core/utils/styles/font_manager.dart';
import 'package:crazycar/core/utils/styles/text_style_manger.dart';
import 'package:crazycar/features/users_tracking/presentation/views/widgets/picker_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';


class AddUserTrackingImagesScreen extends StatelessWidget {
  const AddUserTrackingImagesScreen({super.key});

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
              'Track new user',
              style: getMediumStyle(
                  fontSize: FontSize.s18,
                  color: AppColors.kBlackColor,
                  fontFamily: FontConstants.poppinsFontfamily),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          children: [
            verticalSpace(20),
            Text(
              'Upload Images',
              style: getMediumStyle(
                  fontSize: FontSize.s16,
                  color: AppColors.kBlack1Color,
                  fontFamily: FontConstants.poppinsFontfamily),
            ),
            verticalSpace(15),
            Text(
              'Upload a png or jpg images , 4 MB max ',
              style: getRegularStyle(
                  fontSize: FontSize.s12,
                  color: AppColors.kGrey1Color,
                  fontFamily: FontConstants.poppinsFontfamily),
            ),
            SizedBox(height: 15.h),
            Text(
              'To increase the quilty of tracking we recommend uploading more photos ',
              style: getMediumStyle(
                  fontSize: FontSize.s12,
                  color: AppColors.kblue1Color,
                  fontFamily: FontConstants.poppinsFontfamily),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 20.h),
                PickImageWidget(
                  imagePath: 'assets/images/upload_image.svg',
                  desc: "Upload images",
                  onTap: () async {
                  GoRouter.of(context).push(AppRouter.kCameraScreen) ;
                  },
                ),
              ],
            ),
            verticalSpace(20)
          ],
        ),
      ),
     
    );
  }
}
