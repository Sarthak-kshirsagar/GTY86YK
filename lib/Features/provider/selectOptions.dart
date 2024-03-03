// selected_options_provider.dart

import 'package:flutter/material.dart';

import '../Models/model.dart';

class SelectedOptionsProvider extends ChangeNotifier {
  SelectedOptionsModel _selectedOptions = SelectedOptionsModel();

  SelectedOptionsModel get selectedOptions => _selectedOptions;

  void updateOptions(
      {required bool text, required bool fileUpload, required bool save}) {
    _selectedOptions.textButtonSelected =
        text ?? _selectedOptions.textButtonSelected;
    _selectedOptions.fileUploadSelected =
        fileUpload ?? _selectedOptions.fileUploadSelected;
    _selectedOptions.saveButtonSelected =
        save ?? _selectedOptions.saveButtonSelected;

    notifyListeners();
  }
}
