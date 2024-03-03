import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class FileUploadAndDisplay extends StatefulWidget {
  @override
  _FileUploadAndDisplayState createState() => _FileUploadAndDisplayState();
}

class _FileUploadAndDisplayState extends State<FileUploadAndDisplay> {
  File? _selectedFile;
  String? _uploadedImageUrl;

  Future<void> _uploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);

      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      firebase_storage.Reference reference = firebase_storage
          .FirebaseStorage.instance
          .ref()
          .child('Uploads/$fileName');

      firebase_storage.UploadTask uploadTask = reference.putFile(file);

      firebase_storage.TaskSnapshot snapshot =
          await uploadTask.whenComplete(() {});
      String downloadUrl = await snapshot.ref.getDownloadURL();

      setState(() {
        _selectedFile = file;
        _uploadedImageUrl = downloadUrl;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 250,
          height: 300,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_uploadedImageUrl == null)
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.green.shade100),
                        foregroundColor:
                            MaterialStatePropertyAll(Colors.black)),
                    onPressed: _uploadFile,
                    child: Text("Upload Image")),
              // SizedBox(height: 20),
              if (_uploadedImageUrl != null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    _uploadedImageUrl!,
                    width: 250,
                    height: 280,
                    fit: BoxFit.fitWidth,
                  ),
                )
            ],
          ),
        ),
      ],
    );
  }
}
