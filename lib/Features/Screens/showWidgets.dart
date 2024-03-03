import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ubixstarassignment/Features/Screens/buttonsUi.dart';

import '../BLoc/show_widgets_bloc.dart';
import '../Models/model.dart';
import '../filePicker.dart';
import '../provider/selectOptions.dart';
import 'Widgets/buildScreen.dart';
import 'Widgets/textFields.dart';

class ShowWidgetsUi extends StatefulWidget {
  final ShowWidgetsBloc showWidgetsBloc;
  ShowWidgetsUi({required this.showWidgetsBloc});

  @override
  State<ShowWidgetsUi> createState() => _ShowWidgetsUiState();
}

class _ShowWidgetsUiState extends State<ShowWidgetsUi> {
  TextEditingController _textFieldController = TextEditingController();
  String? _storedText;

  // ===============fireabase Utitlities==============================

  Future<void> _retrieveText() async {
    // Retrieve text from Firestore
    String? storedText = await retrieveTextFromFirestore();

    setState(() {
      _storedText = storedText;
      if (storedText != null) {
        // Set the retrieved text to the text field controller
        _textFieldController.text = storedText;
      }
    });
  }

  Future<void> saveTextToFirestore(String text) async {
    CollectionReference textCollection =
        FirebaseFirestore.instance.collection('text_data');

    await textCollection.doc('data').set({'text': text});
  }

  Future<String?> retrieveTextFromFirestore() async {
    CollectionReference textCollection =
        FirebaseFirestore.instance.collection('text_data');

    try {
      DocumentSnapshot snapshot = await textCollection.doc('data').get();
      Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;

      return data?['text'];
    } catch (e) {
      print('Error retrieving text: $e');
      return null;
    }
  }

  // ===============fireabase Utitlities==============================
  @override
  void initState() {
    super.initState();
    //get the name from firebase
    _retrieveText();
  }

  // to show the message
  void showSnack(message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.green.shade300,
        content: Text(style: TextStyle(color: Colors.black), "${message}")));
  }

  //variable to show the message
  bool showMessage = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShowWidgetsBloc, ShowWidgetsState>(
      bloc: widget.showWidgetsBloc,
      buildWhen: (previous, current) => current is ShowWidgetsState,
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.runtimeType) {
          //building the ui according to the states emitted by the events
          case onlyText:
            return Scaffold(
                body: SafeArea(
              child: Center(
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Assignment App",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 250,
                      height: 500,
                      decoration: BoxDecoration(
                        color: Colors.green.shade300,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            showWidgets(_textFieldController, true, false),
                            Text(
                              textAlign: TextAlign.center,
                              "Please add button Widget",
                              style: TextStyle(fontSize: 22),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.green.shade300),
                            foregroundColor:
                                MaterialStatePropertyAll(Colors.black)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ButtonsUi(
                                    showWidgetsBloc: widget.showWidgetsBloc),
                              ));
                        },
                        child: Text("Add Widgets"))
                  ],
                ),
              ),
            ));

          case onlyfile:
            return Scaffold(
                body: SafeArea(
              child: Center(
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Assignment App",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 250,
                      height: 500,
                      decoration: BoxDecoration(
                        color: Colors.green.shade300,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            showWidgets(_textFieldController, false, true),
                            Text(
                              textAlign: TextAlign.center,
                              "Please add button Widget",
                              style: TextStyle(fontSize: 22),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.green.shade300),
                            foregroundColor:
                                MaterialStatePropertyAll(Colors.black)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ButtonsUi(
                                    showWidgetsBloc: widget.showWidgetsBloc),
                              ));
                        },
                        child: Text("Add Widgets"))
                  ],
                ),
              ),
            ));

          case showTextImageState:
            return Scaffold(
                body: SafeArea(
              child: Center(
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Assignment App",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 250,
                      height: 500,
                      decoration: BoxDecoration(
                        color: Colors.green.shade300,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            showWidgets(_textFieldController, false, false),
                            Text(
                              textAlign: TextAlign.center,
                              "Please add button Widget",
                              style: TextStyle(fontSize: 22),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.green.shade300),
                            foregroundColor:
                                MaterialStatePropertyAll(Colors.black)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ButtonsUi(
                                    showWidgetsBloc: widget.showWidgetsBloc),
                              ));
                        },
                        child: Text("Add Widgets"))
                  ],
                ),
              ),
            ));
          case showSaveButtonState:
            return Scaffold(
                body: SafeArea(
              child: Center(
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Assignment App",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 250,
                      height: 500,
                      decoration: BoxDecoration(
                        color: Colors.green.shade300,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            showWidgets(_textFieldController, false, false),
                            if (showMessage == true)
                              Text(
                                textAlign: TextAlign.center,
                                "Please add at least two Widgets",
                                style: TextStyle(fontSize: 22),
                              ),
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.green),
                                        foregroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.black)),
                                    onPressed: () {
                                      setState(() {
                                        showMessage = true;
                                      });
                                    },
                                    child: Text("Save"))),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.green.shade300),
                            foregroundColor:
                                MaterialStatePropertyAll(Colors.black)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ButtonsUi(
                                    showWidgetsBloc: widget.showWidgetsBloc),
                              ));
                        },
                        child: Text("Add Widgets"))
                  ],
                ),
              ),
            ));

          case showTextButtonState:
            return Scaffold(
                body: SafeArea(
              child: Center(
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Assignment App",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 250,
                      height: 500,
                      decoration: BoxDecoration(
                        color: Colors.green.shade300,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            showWidgets(_textFieldController, true, false),
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.green),
                                        foregroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.black)),
                                    onPressed: () {
                                      // saveTextToFirestore(_textFieldController.text.trim());
                                      showSnack("Please add all the widgets");
                                    },
                                    child: Text("Save")))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.green.shade300),
                            foregroundColor:
                                MaterialStatePropertyAll(Colors.black)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ButtonsUi(
                                    showWidgetsBloc: widget.showWidgetsBloc),
                              ));
                        },
                        child: Text("Add Widgets"))
                  ],
                ),
              ),
            ));
          case showFileUploadState:
            return Scaffold(
                body: SafeArea(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Assignment App",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 250,
                      height: 500,
                      decoration: BoxDecoration(
                        color: Colors.green.shade300,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          showWidgets(_textFieldController, false, true),
                          Align(
                              alignment: Alignment.bottomCenter,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Colors.green),
                                      foregroundColor: MaterialStatePropertyAll(
                                          Colors.black)),
                                  onPressed: () {
                                    showSnack("Please add Text Widget");
                                  },
                                  child: Text("Save")))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.green.shade300),
                            foregroundColor:
                                MaterialStatePropertyAll(Colors.black)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ButtonsUi(
                                    showWidgetsBloc: widget.showWidgetsBloc),
                              ));
                        },
                        child: Text("Add Widgets"))
                  ],
                ),
              ),
            ));
          case showAllFieldsState:
            return Scaffold(
                body: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Assignment App",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 250,
                        height: 550,
                        decoration: BoxDecoration(
                          color: Colors.green.shade300,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              showWidgets(_textFieldController, true, true),
                              Align(
                                  alignment: Alignment.bottomCenter,
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Colors.green),
                                          foregroundColor:
                                              MaterialStatePropertyAll(
                                                  Colors.black)),
                                      onPressed: () async {
                                        await saveTextToFirestore(
                                            _textFieldController.text.trim());
                                        showSnack(
                                            "Information saved successfully");
                                      },
                                      child: Text("Save")))
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ));
          case showNoneState:
            return Scaffold(
                body: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Assignment App",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 250,
                        height: 550,
                        decoration: BoxDecoration(
                          color: Colors.green.shade300,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                                child: Text(
                                    style: TextStyle(), "No Widgets selected"))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  Colors.green.shade300),
                              foregroundColor:
                                  MaterialStatePropertyAll(Colors.black)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ButtonsUi(
                                      showWidgetsBloc: widget.showWidgetsBloc),
                                ));
                          },
                          child: Text("Add Widgets"))
                    ],
                  ),
                ),
              ),
            ));

          default:
            return Scaffold(
                body: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Assignment App",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 250,
                        height: 550,
                        decoration: BoxDecoration(
                          color: Colors.green.shade300,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                                child: Text(
                                    style: TextStyle(), "No Widgets selected"))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  Colors.green.shade300),
                              foregroundColor:
                                  MaterialStatePropertyAll(Colors.black)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ButtonsUi(
                                      showWidgetsBloc: widget.showWidgetsBloc),
                                ));
                          },
                          child: Text("Add Widgets"))
                    ],
                  ),
                ),
              ),
            ));
        }
      },
    );
  }
}
// Center(child: Text("Nothing to show please select the buttons")),
