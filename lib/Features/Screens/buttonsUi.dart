// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:ubixstarassignment/Features/Screens/showWidgets.dart';
// import 'package:ubixstarassignment/Features/Screens/textWidgets.dart';
//
// import '../BLoc/show_widgets_bloc.dart';
// import '../Models/model.dart';
// import '../provider/selectOptions.dart';
//
//
// class ButtonsUi extends StatefulWidget {
//    ShowWidgetsBloc showWidgetsBloc;
//    ButtonsUi({required this.showWidgetsBloc});
//   @override
//   State<ButtonsUi> createState() => _ButtonsUiState();
// }
//
// class _ButtonsUiState extends State<ButtonsUi> {
//   List<String> selectedOptions = [];
//   late SelectedOptionsProvider selectedOptionsProvider;
//
//   void emitStates(){
//     SelectedOptionsModel selectedOptions = context.watch<SelectedOptionsProvider>().selectedOptions;
//     if(selectedOptions.textButtonSelected && selectedOptions.saveButtonSelected){
//       widget.showWidgetsBloc.add((addTextButtonEvent()));
//
//
//     }else if(selectedOptions.fileUploadSelected && selectedOptions.saveButtonSelected){
//       widget.showWidgetsBloc.add((addFieUploadButtonEvent()));
//     }else if(selectedOptions.textButtonSelected && selectedOptions.fileUploadSelected && selectedOptions.saveButtonSelected){
//       widget.showWidgetsBloc.add(allFieldsVisibileEvent());
//     }else if(selectedOptions.textButtonSelected||selectedOptions.fileUploadSelected||selectedOptions.saveButtonSelected){
//       widget.showWidgetsBloc.add(addSaveButtonEvent());
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     selectedOptionsProvider = context.read<SelectedOptionsProvider>();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             CheckboxListTile(
//               title: Text("Text Button"),
//               value: selectedOptions.contains("TextButton"),
//               onChanged: (value) {
//                 _handleCheckboxChange("TextButton", value);
//               },
//             ),
//             SizedBox(height: 20),
//             CheckboxListTile(
//               title: Text("File Upload"),
//               value: selectedOptions.contains("FileUpload"),
//               onChanged: (value) {
//                 _handleCheckboxChange("FileUpload", value);
//               },
//             ),
//             SizedBox(height: 20),
//             CheckboxListTile(
//               title: Text("Save Button"),
//               value: selectedOptions.contains("SaveButton"),
//               onChanged: (value) {
//                 _handleCheckboxChange("SaveButton", value);
//               },
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () async{
//                 emitStates();
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) =>ShowWidgetsUi(showWidgetsBloc: widget.showWidgetsBloc)
//                   ),
//                 );
//               },
//               child: Text("Add Widgets"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _handleCheckboxChange(String option, bool? value) {
//     setState(() {
//       if (value != null && value) {
//         selectedOptions.add(option);
//       } else {
//         selectedOptions.remove(option);
//       }
//     });
//
//     // Update the selected options using the provider
//     selectedOptionsProvider.updateOptions(
//       text: selectedOptions.contains("TextButton"),
//       fileUpload: selectedOptions.contains("FileUpload"),
//       save: selectedOptions.contains("SaveButton"),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:ubixstarassignment/Features/Screens/showWidgets.dart';
import '../BLoc/show_widgets_bloc.dart';

class ButtonsUi extends StatefulWidget {
  final ShowWidgetsBloc showWidgetsBloc;

  ButtonsUi({required this.showWidgetsBloc});

  @override
  _ButtonsUiState createState() => _ButtonsUiState();
}

class _ButtonsUiState extends State<ButtonsUi> {
  Set<String> selectedCheckboxes = {};

  //accoridng to the checkbox selected emit the state
  void emitStates() {
    if (selectedCheckboxes.contains("text") &&
        selectedCheckboxes.contains("file") &&
        selectedCheckboxes.contains("save")) {
      widget.showWidgetsBloc.add(allFieldsVisibileEvent());
    } else if (selectedCheckboxes.contains("text") &&
        selectedCheckboxes.contains("save")) {
      widget.showWidgetsBloc.add(addTextButtonEvent());
    } else if (selectedCheckboxes.contains("file") &&
        selectedCheckboxes.contains("save")) {
      widget.showWidgetsBloc.add(addFieUploadButtonEvent());
    } else if (selectedCheckboxes.contains("text") &&
        selectedCheckboxes.contains("file")) {
      widget.showWidgetsBloc.add(TextImageevent());
    } else if (selectedCheckboxes.isEmpty) {
      widget.showWidgetsBloc.add(nonFieldsVisible());
    } else if (selectedCheckboxes.contains("text")) {
      widget.showWidgetsBloc.add(TextButtonevent());
    } else if (selectedCheckboxes.contains("file")) {
      widget.showWidgetsBloc.add(FileUplaodEvent());
    } else if (selectedCheckboxes.contains("save")) {
      widget.showWidgetsBloc.add(addSaveButtonEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.green.shade300,
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                CheckboxListTile(
                  title: Text("Text Widget"),
                  value: selectedCheckboxes.contains("text"),
                  onChanged: (value) {
                    updateCheckboxState("text", value!);
                    emitStates();
                  },
                ),
                SizedBox(height: 20),
                CheckboxListTile(
                  title: Text("Image Widget"),
                  value: selectedCheckboxes.contains("file"),
                  onChanged: (value) {
                    updateCheckboxState("file", value!);
                    emitStates();
                  },
                ),
                SizedBox(height: 20),
                CheckboxListTile(
                  title: Text("Button Widget"),
                  value: selectedCheckboxes.contains("save"),
                  onChanged: (value) {
                    updateCheckboxState("save", value!);
                    emitStates();
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.green),
                      foregroundColor: MaterialStatePropertyAll(Colors.black)),
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShowWidgetsUi(
                            showWidgetsBloc: widget.showWidgetsBloc),
                      ),
                    );
                  },
                  child: Text("Import Widgets"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void updateCheckboxState(String checkbox, bool value) {
    setState(() {
      if (value) {
        selectedCheckboxes.add(checkbox);
      } else {
        selectedCheckboxes.remove(checkbox);
      }
    });
  }
}
