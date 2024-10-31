import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/asif%20learn%20bloc/image%20picker/image_picker_asif_bloc.dart';

class ImagePickerViewAsif extends StatelessWidget {
  const ImagePickerViewAsif({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<ImagePickerAsifBloc, ImagePickerAsifState>(
                builder: (context, state) {
              if (state.file == null) {
                return InkWell(
                  onTap: () {
                    context.read<ImagePickerAsifBloc>().add(CameraCapture());
                  },
                  child: const CircleAvatar(
                    child: Icon(Icons.camera),
                  ),
                );
              } else {
                return Image.file(File(state.file!.path.toString()));
              }
            }),
            const SizedBox(
              height: 40,
            ),
            BlocBuilder<ImagePickerAsifBloc, ImagePickerAsifState>(
                builder: (context, state) {
              if (state.file == null) {
                return InkWell(
                  onTap: () {
                    context.read<ImagePickerAsifBloc>().add(PickImageGallery());
                  },
                  child: const CircleAvatar(
                    child: Icon(Icons.photo),
                  ),
                );
              } else {
                return Container();
                // return Image.file(File(state.file!.path.toString()));
              }
            }),
          ],
        ),
      ),
    );
  }
}
