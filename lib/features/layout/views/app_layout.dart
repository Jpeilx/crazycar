import 'package:crazycar/core/constant/app_assets.dart';
import 'package:crazycar/core/utils/colors/app_colors.dart';
import 'package:crazycar/core/shared/widgets/svg_asset_handle.dart';
import 'package:crazycar/features/layout/logic/cubit/app_layout_cubit.dart';
import 'package:crazycar/features/layout/logic/cubit/app_layout_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppLayoutCubit(),
      child: BlocBuilder<AppLayoutCubit, AppLayoutStates>(
        builder: (context, state) {
          var layoutCubit = AppLayoutCubit.get(context);
          return Scaffold(
            body: layoutCubit
                .supermarketScreens[layoutCubit.currentButtomNavIndex],
            bottomNavigationBar: Container(
              decoration: const BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: AppColors.kGrey6Color,
                    blurRadius: 12,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.r),
                    topRight: Radius.circular(25.r)),
                child: BottomNavigationBar(
                  elevation: 0,
                  backgroundColor: AppColors.kWhiteColor,
                  selectedItemColor: AppColors.kBlackColor,
                  showUnselectedLabels: false,
                  showSelectedLabels: false,
                  unselectedItemColor: AppColors.kGreyColor,
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                        icon: SVGAssetHandler(
                            boxFit: BoxFit.fill,
                            svgPath: AssetsData.optionIcon,
                            svgWidth: 30.w,
                            svgheight: 30.h,
                            svgColor: layoutCubit.currentButtomNavIndex == 0
                                ? AppColors.kBlackColor
                                : AppColors.kGreyColor),
                        label: ''),
                    BottomNavigationBarItem(
                        icon: SVGAssetHandler(
                            boxFit: BoxFit.fill,
                            svgPath: AssetsData.videoIcon,
                            svgWidth: 24.w,
                            svgheight: 24.h,
                            svgColor: layoutCubit.currentButtomNavIndex == 1
                                ? AppColors.kBlackColor
                                : AppColors.kGreyColor),
                        label: ''),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.spatial_tracking,
                          color: layoutCubit.currentButtomNavIndex == 2
                              ? AppColors.kblackGreyColor
                              : AppColors.kGreyColor,
                          size: 28,
                        ),
                        label: ''),
                         BottomNavigationBarItem(
                        icon: Icon(
                          Icons.person,
                          color: layoutCubit.currentButtomNavIndex == 3
                              ? AppColors.kblackGreyColor
                              : AppColors.kGreyColor,
                          size: 28,
                        ),
                        label: ''),
                  ],
                  currentIndex: layoutCubit.currentButtomNavIndex,
                  onTap: (index) {
                    layoutCubit.changeButtonNavItem(index);
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
