import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import '../../constant/colors.dart';
import '../../constant/images.dart';
import '../../constant/widgets.dart';
import 'package:file_picker/file_picker.dart';

PlatformFile? pickedFile;

class PrivateFilesUpload extends StatefulWidget {
  const PrivateFilesUpload({super.key});

  @override
  State<PrivateFilesUpload> createState() => _PrivateFilesUploadState();
}

class _PrivateFilesUploadState extends State<PrivateFilesUpload> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: white,
          ),
        ),
        backgroundColor: black,
        title: customTextWidget(
          "Upload files",
          16.0,
          FontWeight.bold,
          white,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30.0),
            pickedFile == null
                ? SizedBox(
                    width: MediaQuery.of(context).size.width - 10,
                    child: InkWell(
                      onTap: () {
                        selectFile(setState);
                      },
                      child: const Image(
                        image: AssetImage(
                          imageUpload,
                        ),
                      ),
                    ),
                  )
                : Expanded(
                    child: Container(
                      color: Colors.blue.shade200,
                      child: Center(
                        child: Text(pickedFile!.name),
                      ),
                    ),
                  ),
            customTextWidget(
              "Select Your Preferences",
              20.0,
              FontWeight.bold,
              black,
            ),
            const SizedBox(height: 60.0),
            SizedBox(
              width: MediaQuery.of(context).size.width - 30,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: green),
                onPressed: () {
                  setState(() {
                    pickedFile = null;
                    Navigator.of(context).pop();
                  });
                },
                child: customTextWidget(
                  "Submit",
                  16.0,
                  FontWeight.bold,
                  white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future selectFile(setState) async {
  final result = await FilePicker.platform.pickFiles();
  if (result == null) return;
  setState(() {
    pickedFile = result.files.first;
  });
}
