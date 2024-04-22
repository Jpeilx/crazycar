import 'package:crazycar/core/utils/colors/app_colors.dart';
import 'package:crazycar/core/utils/helper/spacing.dart';
import 'package:crazycar/core/utils/styles/font_manager.dart';
import 'package:crazycar/core/utils/styles/text_style_manger.dart';
import 'package:crazycar/features/qr_code/presentatin/ui/widgets/qr_reader_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QRView extends StatelessWidget {
  const QRView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 21.w),
      child: Column(
        children: [
          SizedBox(
            height: 100.h,
          ),
          SizedBox(
              width: 389.w,
              height: 512.h,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: QrReaderView())),
          verticalSpace(80) ,
          Text('Scan Your Code' , style: getBoldStyle(fontSize: FontSize.s32 , color: AppColors.kBlackColor, fontFamily: FontConstants.poppinsFontfamily),)
        ],
      ),
    ));
  }
}
