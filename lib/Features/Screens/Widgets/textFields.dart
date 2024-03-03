import 'package:flutter/material.dart';

//textfield widget
Widget textField(TextEditingController _textFieldController){
  return  Container(
    width: 250,
    child: TextFormField(
      controller: _textFieldController,
      decoration: InputDecoration(
          label: Text("Enter Text"),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)
          )

      ),
    ),
  );
}