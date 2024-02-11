import 'package:crazycar/core/constant/app_assets.dart';
import 'package:crazycar/core/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarControllers extends StatelessWidget {
  const CarControllers({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
          height: 240,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 300.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        InkWell(

                          onTap: (){},
                          child: Image.asset(
                            AssetsData.leftImage,
                            width: 60.w,
                            height: 120.h,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Positioned(
                          left: 10 ,
                          bottom: 50,
                          child: Container(
                            width: 7.w,
                            height: 7.h,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.kBlackColor,
                            ),),
                        )
                      ],
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: (){},
                        child: Container(
                            width: 70.w,
                            height: 70.h,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.kGreyColor,
                            ),
                            child: const  Center(
                              child: Icon(
                                  size: 50, Icons.power_settings_new_outlined),
                            )),
                      ),
                    ),
                    Stack(
                      children: [
                        InkWell(
                          onTap: (){},
                          child: Image.asset(
                            AssetsData.rightImage,
                            width: 60.w,
                            height: 120.h,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Positioned(
                          left: 37 ,
                          bottom: 50,
                          child: Container(
                            width: 7.w,
                            height: 7.h,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.kBlackColor,
                            ),),
                        )
                      ],
                    ),

                  ],
                ),
              ),
              Positioned(
                left: 120,
                bottom: 150,
                child: Stack(
                  children: [
                    InkWell(
                      onTap: (){},
                      child: Image.asset(
                        AssetsData.upImage,
                        width: 120.w,
                        height: 60.h,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Positioned(
                          left: 50 ,
                          bottom: 37,
                          child: Container(
                            width: 7.w,
                            height: 7.h,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.kBlackColor,
                            ),),
                        )
                  ],
                ),
              ),
              Positioned(
                left: 120,
                bottom: 35,
                child: Stack(
                  children: [
                    InkWell(
                      onTap: (){},
                      child: Image.asset(
                        AssetsData.downImage,
                        width: 120.w,
                        height: 60.h,
                        fit: BoxFit.contain,

                      ),
                    ),
                    Positioned(
                          left: 50 ,
                          bottom: 10,
                          child: Container(
                            width: 7.w,
                            height: 7.h,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.kBlackColor,
                            ),),
                        )
                  ],
                ),
              ),
            ],
          ),
        );
  }
}