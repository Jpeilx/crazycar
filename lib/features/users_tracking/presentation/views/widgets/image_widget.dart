import 'dart:io';

import 'package:crazycar/core/utils/colors/app_colors.dart';
import 'package:crazycar/core/widgets/app_container_shape.dart';
import 'package:crazycar/core/widgets/svg_asset_handle.dart';
import 'package:crazycar/features/users_tracking/data/models/image_downloader_model/Image_downloader_model.dart';
import 'package:crazycar/features/users_tracking/presentation/logic/edit_upload_images_cubit/edit_upload_images_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    Key? key,
    required this.imageModel,
    required this.onLongPress,
    required this.onTap,
  }) : super(key: key);

  final ImageDonwloader imageModel;
  final Function()? onLongPress;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: MyContainerShape(
        bgContainer: AppColors.kWhite2Color,
        enableShadow: false,
        topEndRaduis: 10,
        bottomEndRaduis: 10,
        bottomStartRaduis: 10,
        topStartRaduis: 10,
        child: Stack(
          children: [
            Image.file(
              File(imageModel.imagePath),
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            if (imageModel.enabledDelete) ...[
              Material(
                color: AppColors.kBlackColor.withOpacity(.4),
                child: InkWell(
                  onTap: () {
                    EditUploadImagesCubit.get(context)
                        .deleteImage(imageModel.id);
                  },
                  child: Center(
                    child: SVGAssetHandler(
                      svgheight: 40.h,
                      svgWidth: 40.w, svgPath: 'assets/images/ic_close2.svg', boxFit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
