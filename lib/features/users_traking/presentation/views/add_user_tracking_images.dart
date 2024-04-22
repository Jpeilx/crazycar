import 'package:crazycar/core/utils/colors/app_colors.dart';
import 'package:crazycar/core/utils/helper/spacing.dart';
import 'package:crazycar/core/utils/router/app_router.dart';
import 'package:crazycar/core/utils/styles/font_manager.dart';
import 'package:crazycar/core/utils/styles/text_style_manger.dart';

import 'package:crazycar/features/users_traking/data/models/image_downloader_model/Image_downloader_model.dart';
import 'package:crazycar/features/users_traking/presentation/logic/edit_upload_images_cubit/edit_upload_images_cubit.dart';
import 'package:crazycar/features/users_traking/presentation/views/widgets/add_user_tracking_image_nav_bar.dart';
import 'package:crazycar/features/users_traking/presentation/views/widgets/image_widget.dart';
import 'package:crazycar/features/users_traking/presentation/views/widgets/item_add_image_widget.dart';
import 'package:crazycar/features/users_traking/presentation/views/widgets/picker_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class AddUserTrackingImagesScreen extends StatelessWidget {
  const AddUserTrackingImagesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final ImagePicker _picker = ImagePicker();
    XFile? image;
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
            BlocBuilder<EditUploadImagesCubit, EditUploadImagesState>(
              builder: (context, state) {
                if (EditUploadImagesCubit.get(context).listImages.length > 0) {
                  return const SizedBox();
                }
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 20.h),
                    PickImageWidget(
                      imagePath: 'assets/images/upload_image.svg',
                      desc: "Upload images",
                      onTap: () async {
                        image = await _picker.pickImage(
                            source: ImageSource.gallery);
                        if (image != null) {
                          EditUploadImagesCubit.get(context)
                              .addImage(image!.path);
                        }
                      },
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: 20.h),
            BlocBuilder<EditUploadImagesCubit, EditUploadImagesState>(
              builder: (context, state) {
                if (EditUploadImagesCubit.get(context).listImages.length == 0) {
                  return const SizedBox();
                }
                return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount:
                      EditUploadImagesCubit.get(context).listImages.length + 1,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 15.r,
                    mainAxisSpacing: 15.r,
                  ),
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return ItemAddImageWidget(
                        onTap: () async {
                          image = await _picker.pickImage(
                              source: ImageSource.gallery);
                          if (image != null) {
                            EditUploadImagesCubit.get(context)
                                .addImage(image!.path);
                          }
                        },
                      );
                    }
                    ImageDonwloader imageModel =
                        EditUploadImagesCubit.get(context)
                            .listImages[(index - 1)];
                    return ImageWidget(
                      imageModel: imageModel,
                      onTap: () {
                        GoRouter.of(context)
                            .push(AppRouter.kPagerImagesView, extra: {
                          'cubit': EditUploadImagesCubit.get(context),
                          'initIndex': (index - 1),
                          'procesEdit': false
                        });
                      },
                      onLongPress: () {
                        var _type = FeedbackType.heavy;
                        Vibrate.feedback(_type);
                        EditUploadImagesCubit.get(context)
                            .seleteImage(imageModel.id);
                      },
                    );
                  },
                );
              },
            ),
            verticalSpace(20)
          ],
        ),
      ),
      bottomNavigationBar:  AddUserTrackingImageNavBAr(
        title1: 'Cancel' ,
        title2: 'Create',
        onPressedNext: () async {
         
        },
        onPressedPrevious: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
