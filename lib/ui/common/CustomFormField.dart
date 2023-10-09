import 'package:flutter/material.dart';


typedef Validator = String? Function(String?);
class CustomFormFiled extends StatelessWidget {
  String hintText;
  TextInputType keyboardType;
  bool secureText;
  Validator? validator;
  TextEditingController? controller;
  CustomFormFiled(
      {required this.hintText,
      this.keyboardType = TextInputType.text,
      this.secureText = false,
        this.validator,this.controller

      });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller:controller ,
      validator: validator ,
      obscureText: secureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(labelText: hintText),
    );
  }
}
