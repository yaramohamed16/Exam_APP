import 'package:flutter/material.dart';

import '../../../shared/components/colors/constants.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Morning,',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 24,
                color: mainColor,
              ),
            ),
            Text(
              ' Ahmed 🌞',
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 24,
                  color: mainColor),
            )
          ],
        ),
        const Text(
          'What do you want to learn today?',
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color.fromRGBO(75, 85, 99, 1)),
        ),
        const SizedBox(
          height: 25,
        ),
      ],
    );
  }
}
