import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final String labelText;
  final Function validator;
  final Function onTap;
  final bool isReadOnly;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final TextInputType textInputType;

  MyTextFormField({
    this.labelText,
    this.onTap,
    @required this.isReadOnly,
    @required this.validator,
    @required this.controller,
    @required this.textInputAction,
    @required this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        onTap: this.onTap,
        readOnly: this.isReadOnly,
        controller: this.controller,
        validator: this.validator,
        cursorColor: Colors.grey[700],
        style: TextStyle(color: Colors.grey[700], fontSize: 18),
        textInputAction: this.textInputAction,
        keyboardType: this.textInputType,
        textAlignVertical: TextAlignVertical.bottom,
        decoration: InputDecoration(
          labelText: '${this.labelText}',
          labelStyle: TextStyle(
            color: Colors.grey[700],
            fontWeight: FontWeight.w600,
          ),
          isCollapsed: true,
          contentPadding: EdgeInsets.fromLTRB(15, 20, 15, 10),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.grey[400],
              width: 2,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              width: 3,
              color: Colors.grey[400],
            ),
          ),
        ),
      ),
    );
  }
}
