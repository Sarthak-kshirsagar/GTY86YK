import 'package:flutter/material.dart';
import 'package:ubixstarassignment/Features/Screens/Widgets/textFields.dart';

import '../../filePicker.dart';

import '../showWidgets.dart';

//widget to show the selected widgets uses boolean values to show the textfields and image field based on the state emitted
Widget showWidgets(TextEditingController _textFieldController, bool textfield,
    bool fileUpload) {
  return Center(
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  if (textfield == true) textField(_textFieldController),
                  SizedBox(
                    height: 20,
                  ),
                  if (fileUpload == true)
                    Container(
                      width: 250,
                      child: FileUploadAndDisplay(),
                    ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
