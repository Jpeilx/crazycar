import 'package:crazycar/core/constant/app_assets.dart';
import 'package:crazycar/core/utils/helper/spacing.dart';
import 'package:crazycar/core/widgets/svg_asset_handle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LiveControllers extends StatelessWidget {
  const LiveControllers({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {},
          child: SVGAssetHandler(
              svgPath: AssetsData.videoGoLeft,
              svgWidth: 72.w,
              svgheight: 72.h,
              boxFit: BoxFit.contain,
            )
        ),
        horizontalSpace(6),
        InkWell(
          onTap: () {},
          child: SVGAssetHandler(
              svgPath: AssetsData.videoGoLeft,
              svgWidth: 72.w,
              svgheight: 72.h,
              boxFit: BoxFit.contain,
            )
        ),
        horizontalSpace(6),
        InkWell(
          onTap: () {},
          child: SVGAssetHandler(
              svgPath: AssetsData.videoPlay,
              svgWidth: 72.w,
              svgheight: 72.h,
              boxFit: BoxFit.contain,
            )
        ),
        horizontalSpace(6),
        InkWell(
          onTap: () {},
          child: SVGAssetHandler(
              svgPath: AssetsData.videoGoRight,
              svgWidth: 72.w,
              svgheight: 72.h,
              boxFit: BoxFit.fill,
            )),
        
        horizontalSpace(6),
        InkWell(
            onTap: () {},
            child: SVGAssetHandler(
              svgPath: AssetsData.videoRransitionRight,
              svgWidth: 72.w,
              svgheight: 72.h,
              boxFit: BoxFit.contain,
            )),
        horizontalSpace(6),
      ],
    );
  }
}
