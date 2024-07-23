import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class imageupload extends StatefulWidget {
  const imageupload({super.key});

  @override
  State<imageupload> createState() => _imageuploadState();
}

File? image; // create a file to Store a path

class _imageuploadState extends State<imageupload> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Uploading Image on Server Using Rest Api'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            color: Colors.blue,
            onPressed: () {
              _PickImageFromGaller();
            },
            child: const Text(
              'Pick Image From Gallery',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          MaterialButton(
            color: Colors.red,
            onPressed: () {
              _PickImageFromCamera();
            },
            child: const Text(
              'Pick Image From Camera',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          image != null ? Image.file(image!) : Text('Please Select An Image')
          /*Using Image.file we are displaying the image*/
        ],
      ),
    );
  }

  Future _PickImageFromGaller() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      image = File(returnedImage!.path);
    });
  }

  Future _PickImageFromCamera() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);

    setState(() {
      image = File(returnedImage!.path);
    });
  }
}
