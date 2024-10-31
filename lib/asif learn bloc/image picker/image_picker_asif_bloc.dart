import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/image_picker_utils.dart';

part 'image_picker_asif_event.dart';
part 'image_picker_asif_state.dart';

class ImagePickerAsifBloc
    extends Bloc<ImagePickerAsifEvent, ImagePickerAsifState> {
  final ImagePickerUtils imagePickerUtils;
  ImagePickerAsifBloc(this.imagePickerUtils)
      : super(const ImagePickerAsifState()) {
    on<CameraCapture>(_cameraCapture);
    on<PickImageGallery>(_pickFromGallery);
  }

  void _cameraCapture(
      CameraCapture event, Emitter<ImagePickerAsifState> emit) async {
    XFile? file = await imagePickerUtils.cameraCapture();
    emit(state.copyWith(file: file));
  }

  void _pickFromGallery(
      PickImageGallery event, Emitter<ImagePickerAsifState> emit) async {
    XFile? file = await imagePickerUtils.pickImageFromGallery();
    emit(state.copyWith(file: file));
  }
}
