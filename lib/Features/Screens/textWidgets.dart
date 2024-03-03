import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Models/model.dart';
import '../provider/selectOptions.dart';

//uses the provider to get the widgets according to the selected checkboxes
class DisplayTextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SelectedOptionsModel selectedOptions = context.watch<SelectedOptionsProvider>().selectedOptions;

    return Scaffold(
      appBar: AppBar(
        title: Text('Display Text'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (selectedOptions.textButtonSelected) Text('Text Button is selected'),
            if (selectedOptions.fileUploadSelected) Text('File Upload is selected'),
            if (selectedOptions.saveButtonSelected) Text('Save Button is selected'),
          ],
        ),
      ),
    );
  }
}
