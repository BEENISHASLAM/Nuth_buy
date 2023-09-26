import 'dart:core';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuth_buy/components/text_input_controller.dart';



class TextInput extends StatelessWidget {
  final String? hint;
  final bool? obscure;
  final TextEditingController? controller;
  final  Widget? suffixIcon;
  final FocusNode? focus;
  final  onValidate;
  TextInput({
    this.obscure = false,
    this.hint,
    this.controller,
    this.suffixIcon,
    this.focus,
    this.onValidate,

  });

  @override
  Widget build(BuildContext context) {
    final TextInputController textInputController = Get.put(TextInputController());
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal:8,
        vertical:2,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: textInputController.hasError.value ? Colors.red : Colors.white12,
          width: 1,
        ),
      ),
      child: TextFormField(
        controller: controller,
        validator:onValidate,
        focusNode: focus,
        obscureText: obscure!,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          suffixIconColor:Colors.grey.shade500,
          border: InputBorder.none,
          hintText: hint!,
          fillColor: Colors.white,
          hintStyle: TextStyle(
            color: Colors.black54,fontSize:11
          ),
        ),


      ),
    );
  }
}
