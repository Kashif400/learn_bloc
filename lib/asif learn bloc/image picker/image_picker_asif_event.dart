part of 'image_picker_asif_bloc.dart';

abstract class ImagePickerAsifEvent extends Equatable {
  const ImagePickerAsifEvent();

  @override
  List<Object> get props => [];
}

class CameraCapture extends ImagePickerAsifEvent {}

class PickImageGallery extends ImagePickerAsifEvent {}
