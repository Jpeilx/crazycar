
import 'package:crazycar/core/utils/colors/app_colors.dart';
import 'package:crazycar/core/utils/styles/font_manager.dart';
import 'package:crazycar/core/utils/styles/text_style_manger.dart';
import 'package:crazycar/features/users_tracking/data/models/image_downloader_model/Image_downloader_model.dart';
import 'package:crazycar/features/users_tracking/presentation/logic/edit_upload_images_cubit/edit_upload_images_cubit.dart';
import 'package:crazycar/features/users_tracking/presentation/views/widgets/item_add_image_widget.dart';
import 'package:crazycar/features/users_tracking/presentation/views/widgets/item_list_view.dart';
import 'package:crazycar/features/users_tracking/presentation/views/widgets/item_pager_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class PagerImages extends StatefulWidget {
  final int initIndex;
  final bool procesEdit;

  const PagerImages({
    super.key,
    required this.initIndex,
    required this.procesEdit,
  });

  @override
  State<PagerImages> createState() => _PagerImagesState();
}

class _PagerImagesState extends State<PagerImages> {
  final ImagePicker _picker = ImagePicker();
  late final PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: widget.initIndex);
    EditUploadImagesCubit.get(context).changeSelectedImage(
      widget.initIndex,
      notify: false,
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: null,
        title: Text('Add Tracked User Images ') ,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Row(
                children: [
                  Text('show pictures'),
                 Text('Optional' , style: getRegularStyle(fontSize: FontSize.s12, color: AppColors.kGreyColor, fontFamily: FontConstants.poppinsFontfamily) ,) ,
                  
                ],
              ),
              SizedBox(height: 20.h),
              BlocBuilder<EditUploadImagesCubit, EditUploadImagesState>(
                builder: (context, state) {
                  return SizedBox(
                    height: 343.h,
                    child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: (int? index) {
                        if (index != null) {
                          EditUploadImagesCubit.get(context)
                              .changeSelectedImage(index);
                        }
                      },
                      itemCount:
                          EditUploadImagesCubit.get(context).listImages.length,
                      itemBuilder: ((context, index) {
                        ImageDonwloader imageModel =
                            EditUploadImagesCubit.get(context)
                                .listImages[index];
                        return ItemPagerWidget(imageModel: imageModel);
                      }),
                    ),
                  );
                },
              ),
              SizedBox(height: 10.h),
              SizedBox(
                height: 60.r,
                child: Row(
                  children: [
                    SizedBox(
                      height: 60.r,
                      width: 60.r,
                      child: ItemAddImageWidget(
                        sizeIcon: 28,
                        onTap: () async {
                          final XFile? image = await _picker.pickImage(
                              source: ImageSource.gallery);
                          if (image != null) {
                            EditUploadImagesCubit.get(context)
                                .addImage(image.path);
                          }
                        },
                      ),
                    ),
                    SizedBox(width: 10.h),
                    BlocBuilder<EditUploadImagesCubit, EditUploadImagesState>(
                      builder: (context, state) {
                        return Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: EditUploadImagesCubit.get(context)
                                .listImages
                                .length,
                            itemBuilder: (context, index) {
                              ImageDonwloader imageDonwloader =
                                  EditUploadImagesCubit.get(context)
                                      .listImages[index];

                              return ItemListView(
                                index: index,
                                imageDonwloader: imageDonwloader,
                                onTap: () {
                                  EditUploadImagesCubit.get(context)
                                      .changeSelectedImage(index);
                                  _pageController.jumpToPage(index);
                                },
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
     
    );
  }
}
