import 'dart:ui';

import 'package:flutter/material.dart';

Widget SignInButton({
  required VoidCallback onPress,
  required String text
}) =>
    ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        backgroundColor: const Color(0xFF0225FF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ), // Call signIn function on button press
      child:  Text(
        text,
        style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            fontFamily: 'Roboto'),
      ),
    );
