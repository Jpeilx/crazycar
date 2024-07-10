import 'package:crazycar/core/utils/colors/app_colors.dart';
import 'package:crazycar/core/utils/styles/font_manager.dart';
import 'package:crazycar/core/utils/styles/text_style_manger.dart';
import 'package:crazycar/core/shared/widgets/svg_asset_handle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PickImageWidget extends StatelessWidget {

  final String imagePath;
  final String desc;

  const PickImageWidget({
    Key? key,
   
    required this.imagePath,
    required this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: Stack(
        children: [
          const SVGAssetHandler(
            svgPath: 'assets/images/border_dashed.svg',
            svgheight: double.infinity,
            svgWidth: double.infinity,
            boxFit: BoxFit.fill,
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SVGAssetHandler(
                  svgPath: imagePath,
                  svgheight: 40.r,
                  svgWidth: 40.r,
                  boxFit: BoxFit.fill,
                ),
                SizedBox(height: 10.h),
                Text(
                  desc,
                  style: getRegularStyle(
                      fontSize: FontSize.s12,
                      color: AppColors.kBlackColor,
                      fontFamily: FontConstants.poppinsFontfamily),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
