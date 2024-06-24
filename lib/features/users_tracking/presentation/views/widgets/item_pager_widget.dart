
import 'dart:io';

import 'package:crazycar/core/widgets/svg_asset_handle.dart';
import 'package:crazycar/features/users_tracking/data/models/image_downloader_model/Image_downloader_model.dart';
import 'package:crazycar/features/users_tracking/presentation/logic/edit_upload_images_cubit/edit_upload_images_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_cropper/image_cropper.dart';

class ItemPagerWidget extends StatelessWidget {
  const ItemPagerWidget({
    Key? key,
    required this.imageModel,
  }) : super(key: key);

  final ImageDonwloader imageModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Stack(
        children: [
          Image.file(
            File(imageModel.imagePath),
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          PositionedDirectional(
            bottom: 10.h,
            start: 10.w,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () async {
                    CroppedFile? croppedFile = await _croperImage(context);
                    if (croppedFile != null) {
                      EditUploadImagesCubit.get(context)
                          .editImage(imageModel.id, croppedFile.path);
                    }
                  },
                  child: SVGAssetHandler(
                    svgheight: 50.h,
                    svgWidth: 50.w,
                    boxFit: BoxFit.fill, svgPath: 'assets/images/ic_edit2.svg',
                  ),
                ),
                SizedBox(width: 20.w),
                GestureDetector(
                  onTap: () {
                    EditUploadImagesCubit.get(context)
                        .deleteImage(imageModel.id);
                  },
                  child:SVGAssetHandler(
                    svgPath:'assets/images/ic_delete2.svg',
                    svgWidth: 50.w,
                    svgheight: 50.h,
                    boxFit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<CroppedFile?> _croperImage(BuildContext context) async {
    return await ImageCropper().cropImage(
      sourcePath: imageModel.imagePath,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        ),
        WebUiSettings(
          context: context,
        ),
      ],
    );
  }
}
