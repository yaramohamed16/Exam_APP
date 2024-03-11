import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CustomeAttemptsCard extends StatelessWidget {
  const CustomeAttemptsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Container(
        ///mostatel
        width: 380,
        height: 92,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xffF3F4F6))),
        child: Row(
          //inside square
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: CircularPercentIndicator(
                radius: 30,
                lineWidth: 6,
                percent: 0.9,

                ///
                center: const Text("80%"),
                progressColor: Colors.green,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Attempt 2",
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff020939),
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "20 Dec 2023 | 12:30:00 PM",
                    style: TextStyle(color: Color(0xff9CA3AF), fontSize: 12),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(60, 0, 0, 60),
              child: Container(
                ///mostatel

                width: 57,
                height: 20,
                decoration: BoxDecoration(
                  color: const Color(0xffEEF8EF),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Center(
                    child: Text(
                  "Passed",
                  style: TextStyle(color: Color(0xff59B764)),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
