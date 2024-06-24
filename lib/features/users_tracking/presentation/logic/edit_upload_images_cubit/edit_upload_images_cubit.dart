import 'package:crazycar/features/users_tracking/data/models/image_downloader_model/Image_downloader_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'edit_upload_images_state.dart';

class EditUploadImagesCubit extends Cubit<EditUploadImagesState> {
  List<ImageDonwloader> listImages = [];

  EditUploadImagesCubit() : super(EditUploadImagesInitial());

  static EditUploadImagesCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  addImage(String imagePath) {
    listImages.add(ImageDonwloader(
      id: listImages.length,
      enabledDelete: false,
      imagePath: imagePath,
    ));
    emit(EditUploadImagesInitial());
  }

  editImage(int id, String newPath) {
    int index = listImages.indexWhere((element) => element.id == id);
    listImages.removeWhere((element) => element.id == id);

    listImages.insert(
        index,
        ImageDonwloader(
          id: listImages.length,
          enabledDelete: false,
          imagePath: newPath,
        ));

    emit(EditUploadImagesInitial());
  }

  deleteImage(int id) {
    listImages.removeWhere((element) => element.id == id);
    emit(EditUploadImagesInitial());
  }

  seleteImage(int id) {
    int index = listImages.indexWhere((element) => element.id == id);
    listImages[index].enabledDelete = !listImages[index].enabledDelete;
    emit(EditUploadImagesInitial());
  }

  int indexImage = 0;
  changeSelectedImage(int index, {bool notify = true}) {
    indexImage = index;
    if (notify) emit(EditUploadImagesInitial());
  }

  
}
