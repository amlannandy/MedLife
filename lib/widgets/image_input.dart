import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspath;

import '../widgets/light_icon_button.dart';

class ImageInput extends StatefulWidget {

  final Function selectImage;
  final Function selectImagePath;

  ImageInput(this.selectImage, this.selectImagePath);
  
  @override
  _ImageInputState createState() => _ImageInputState();

}


class _ImageInputState extends State<ImageInput> {

  File _storedImage;

  Future _takePicture() async {
    final imageFile = await ImagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    if (imageFile == null)
      return;
    setState(() {
      _storedImage = imageFile;
    });

    final appDir = await syspath.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    final savedImage = await imageFile.copy('${appDir.path}/$fileName');

    widget.selectImage(_storedImage);
    widget.selectImagePath(savedImage.path);
  }

  Future _uploadPicture() async {
    final imageFile = await ImagePicker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 600,
    );
    if (imageFile == null)
      return;
    setState(() {
      _storedImage = imageFile;
    });
    final appDir = await syspath.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    final savedImage = await imageFile.copy('${appDir.path}/$fileName');

    widget.selectImage(_storedImage);
    widget.selectImagePath(savedImage.path);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(10),
          height: 420,
          width: 420,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Theme.of(context).primaryColor,
            )
          ),
          child: _storedImage == null ?
            Text("No Image") :
            Image.file(
              _storedImage,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          alignment: Alignment.center,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            LightIconButton(
              icon: Icons.camera_alt,
              text: "Camera",
              function: _takePicture,
            ),
            LightIconButton(
              icon: Icons.filter,
              text: "Gallery",
              function:  _uploadPicture,
            ),
          ],
        )
      ],
    );
  }
}