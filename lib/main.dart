import 'package:crazycar/core/utils/colors/app_colors.dart';
import 'package:crazycar/core/utils/router/app_router.dart';
import 'package:crazycar/core/utils/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
   await ScreenUtil.ensureScreenSize();
   SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.kWhiteColor,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: AppColors.kWhiteColor,
      systemNavigationBarIconBrightness: Brightness.dark));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
             return MaterialApp.router(
                routerConfig: AppRouter.router,
                debugShowCheckedModeBanner: false,
                theme: getApplicationTheme(),
                
              );
      });
     
  }
}
