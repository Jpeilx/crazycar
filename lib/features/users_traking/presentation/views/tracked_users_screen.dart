import 'package:crazycar/core/utils/colors/app_colors.dart';
import 'package:crazycar/core/utils/helper/spacing.dart';
import 'package:crazycar/core/utils/router/app_router.dart';
import 'package:crazycar/core/utils/styles/font_manager.dart';
import 'package:crazycar/core/utils/styles/text_style_manger.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TrackedUsersScreen extends StatelessWidget {
  const TrackedUsersScreen({super.key});

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
              'Tracked Users',
              style: getMediumStyle(
                  fontSize: FontSize.s18,
                  color: AppColors.kBlackColor,
                  fontFamily: FontConstants.poppinsFontfamily),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add , color: AppColors.kWhiteColor,),
        isExtended: true,
    
        backgroundColor:AppColors.kblueColor ,
        onPressed: (){
         GoRouter.of(context).push(AppRouter.kAddUserTrackingImagesScreen);
      }),
     
    );
  }
}
