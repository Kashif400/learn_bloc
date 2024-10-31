part of 'image_picker_asif_bloc.dart';

class ImagePickerAsifState extends Equatable {
  final XFile? file;
  const ImagePickerAsifState({this.file});

  ImagePickerAsifState copyWith({XFile? file}) {
    return ImagePickerAsifState(file: file ?? this.file);
  }

  @override
  List<Object?> get props => [file];
}
