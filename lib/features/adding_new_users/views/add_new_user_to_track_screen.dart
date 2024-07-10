import 'package:crazycar/core/constant/app_assets.dart';
import 'package:crazycar/core/shared/widgets/app_text_fom_field.dart';
import 'package:crazycar/core/utils/colors/app_colors.dart';
import 'package:crazycar/core/utils/helper/spacing.dart';
import 'package:crazycar/core/utils/router/app_router.dart';
import 'package:crazycar/core/utils/styles/font_manager.dart';
import 'package:crazycar/core/utils/styles/text_style_manger.dart';
import 'package:crazycar/features/adding_new_users/logic/add_new_user_to_track_cubit/add_new_user_to_track_cubit.dart';
import 'package:crazycar/features/adding_new_users/views/widgets/picker_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AddNewUserToTrackScreen extends StatelessWidget {
  AddNewUserToTrackScreen({super.key});
  final TextEditingController trackedUserNameController =
      TextEditingController();
  final TextEditingController trackedUserIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: null,
        
        automaticallyImplyLeading: false ,
        centerTitle: true,
        backgroundColor: AppColors.kWhiteColor,
        title: Text(
          'Track new user',
          style: getMediumStyle(
              fontSize: FontSize.s20,
              color: AppColors.kBlackColor,
              fontFamily: FontConstants.poppinsFontfamily),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          children: [
            Text(
              'New Person Data',
              style: getMediumStyle(
                  fontSize: FontSize.s16,
                  color: AppColors.kBlack1Color,
                  fontFamily: FontConstants.poppinsFontfamily),
            ),
            verticalSpace(25),
            AppTextFormField(
              controller: trackedUserNameController,
              label: 'Use Name',
              keyboardtype: TextInputType.name,
              prefix: const Icon(Icons.person),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'You Should Enter The new person Name';
                }
                return null;
              },
            ),
            verticalSpace(18),
            AppTextFormField(
              controller: trackedUserIdController,
              label: 'User Id ',
              keyboardtype: TextInputType.name,
              prefix: const Icon(Icons.key),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'You Should Enter The new person Id';
                }
                return null;
              },
            ),
            verticalSpace(20),
            Text(
              'Live Video Capture',
              style: getMediumStyle(
                  fontSize: FontSize.s16,
                  color: AppColors.kBlack1Color,
                  fontFamily: FontConstants.poppinsFontfamily),
            ),
            verticalSpace(15),
            Text(
              'Allow Us to catch your face live video to start track you ',
              style: getRegularStyle(
                  fontSize: FontSize.s12,
                  color: AppColors.kGrey1Color,
                  fontFamily: FontConstants.poppinsFontfamily),
            ),
            SizedBox(height: 15.h),
            Text(
              'Fix the camera on your face and wait until the recording is finished ',
              style: getMediumStyle(
                  fontSize: FontSize.s12,
                  color: AppColors.kblue1Color,
                  fontFamily: FontConstants.poppinsFontfamily),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 20.h),
                GestureDetector(
                  onTap: () {
                    print( trackedUserIdController.text) ;
                    print( trackedUserNameController.text) ;

                     AddNewUserToTrackCubit.get(context).addNewUserToTrackData(
                        id: trackedUserIdController.text,
                        name: trackedUserNameController.text );
                    GoRouter.of(context).push(AppRouter.kCameraScreen , extra:    AddNewUserToTrackCubit.get(context));
                  },
                  child: const  PickImageWidget(
                    imagePath: AssetsData.liveVideoIcon,
                    desc: "Capture Live Video",
                 
                  ),
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
