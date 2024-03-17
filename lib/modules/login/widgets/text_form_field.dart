import 'package:exams_app/shared/components/colors/constants.dart';
import 'package:flutter/material.dart';

Widget defaultTextFormField({
  required TextEditingController control,
  required String text,
  required TextInputType type,
  bool isPassword = false,
  IconData? suffix,
  void Function(String)? onSubmit, // Update the type to accept a string
  void Function(String)? onChange, // Update the type to accept a string

  VoidCallback? suffixPressed,
}) =>
    TextFormField(
      controller: control,
      decoration: InputDecoration(
        hintText: text,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            color: Color(0xffD1D5DB),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            color: Color(0xffD1D5DB),
          ),
        ),
        suffixIcon: suffix != null
            ? IconButton(
          onPressed: suffixPressed,
          icon: Icon(suffix,color: mainColor),
        )
            : null,
      ),
      keyboardType: type,
      obscureText: isPassword,
      onFieldSubmitted: onSubmit,
      // Pass onSubmit directly
      onChanged: onChange,
      // Pass onChange directly

    );