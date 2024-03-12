import 'package:flutter/material.dart';

class CustomeLine extends StatelessWidget {
  const CustomeLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.5,
      width: double.infinity,
      color: Colors.grey.withOpacity(0.4),
    );
  }
}
