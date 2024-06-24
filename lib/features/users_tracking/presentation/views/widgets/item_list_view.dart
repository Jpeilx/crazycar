
import 'dart:io';

import 'package:crazycar/core/widgets/app_container_shape.dart';
import 'package:crazycar/features/users_tracking/data/models/image_downloader_model/Image_downloader_model.dart';
import 'package:crazycar/features/users_tracking/presentation/logic/edit_upload_images_cubit/edit_upload_images_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemListView extends StatelessWidget {
  const ItemListView({
    Key? key,
    required this.imageDonwloader,
    required this.index,
    required this.onTap,
  }) : super(key: key);

  final int index;
  final ImageDonwloader imageDonwloader;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          child: SizedBox(
            width: EditUploadImagesCubit.get(context).indexImage == index
                ? 10.w
                : 0,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: MyContainerShape(
            height: 60.r,
            width: 60.r,
            enableShadow: false,
            topEndRaduis: 10,
            topStartRaduis: 10,
            bottomEndRaduis: 10,
            bottomStartRaduis: 10,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Image.file(
                File(imageDonwloader.imagePath),
                height: 60.r,
                width: 60.r,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          child: SizedBox(
            width: EditUploadImagesCubit.get(context).indexImage == index
                ? 15.w
                : 10.w,
          ),
        ),
      ],
    );
  }
}
