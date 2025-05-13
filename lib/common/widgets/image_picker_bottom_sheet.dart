import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class ChooseImageOptionBottomSheet extends StatelessWidget {

  final Function(String) onImageSelect;

  const ChooseImageOptionBottomSheet({
    required this.onImageSelect,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            InkWell(
              onTap: () {
                _pickImageFromCamera(context);
              },
              child: Container(
                margin: const EdgeInsets.only(right: 20.0, left: 20.0),
                width: double.maxFinite,
                padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Center(
                  child: Text(
                    'Camera',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ),
            const Divider(
              thickness: 1.0,
            ),
            InkWell(
              onTap: () {
                _pickImageFromGallery(context);
              },
              child: Container(
                margin: const EdgeInsets.only(right: 20.0, left: 20.0),
                width: double.maxFinite,
                padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Center(
                  child: Text(
                    'Gallery',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _pickImageFromCamera(BuildContext context) async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.camera);
    if(pickedFile!=null) {
      onImageSelect(pickedFile.path);
    }
  }

  void _pickImageFromGallery(BuildContext context) async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if(pickedFile!=null) {
      onImageSelect(pickedFile.path);
    }
  }
}
