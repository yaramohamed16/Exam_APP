import 'package:exams_app/modules/exam_questions/core/exam_questions_core.dart';
import 'package:exams_app/modules/exam_questions/widgets/dialog_custom.dart';
import 'package:exams_app/modules/exam_questions/widgets/custom_bottom_sheet.dart';
import 'package:exams_app/modules/exam_report/exam_report_screen.dart';
import 'package:flutter/material.dart';

List<Widget> actionsOfExam(context ,controller , cubit , idString , exams ,examquestionsData ,questionsController){
  return [
    // Updated GestureDetector for the Pause button
    GestureDetector(
      onTap: () {
        pauseExam(context: context , controller: controller);
      },
      child: Container(
        alignment: Alignment.center,
        height: 35,
        width: 82,
        // Adjusted width for the container
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xffE5E7EB)),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.pause_circle_outline_outlined,
              color: const Color(0xff0225FF),
              size: 20,
            ),
            const SizedBox(width: 5), // Added SizedBox for spacing
            Text(
              "Pause",
              style: TextStyle(
                  fontSize: 12, color: const Color(0xff0225FF)),
            ),
          ],
        ),
      ),
    ),

    const SizedBox(width: 10),
    //submit
    GestureDetector(
      onTap: () {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => CustomDialog(
            title: 'End Exam',
            imageUrl: 'assets/images/endexam.PNG',
            subTitle: 'Are you sure you want to end exam ?',
            leftColor: const Color(0xffE64646),
            buttonText: 'Yes, End',
            onConfirm: () {
              controller.pause();

              // print("id: ${exams?.id}");
              cubit.submitStudentAnswers(
                  idString!, cubit.selectedOptions, (responseData) {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExamReportScreen(
                        responseData: responseData),
                  ),
                );
              });
              print(cubit.selectedOptions);
            },
            onCancel: () {
              Navigator.pop(context);
            },
          ),
        );
      },
      child: Container(
        alignment: Alignment.center,
        width: 35,
        height: 35,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xffF3F4F6)),
        child: const Icon(Icons.stop_circle_outlined),
      ),
    ),
    const SizedBox(width: 10),
    GestureDetector(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (BuildContext context) => CustomBottomSheet(
              data: examquestionsData?.data,
              exams: exams,
              updatePageViewController: (value) {
                questionsController.animateToPage(
                  value,
                  duration: Duration(milliseconds: 500),
                  // Optional: Animation duration
                  curve:
                  Curves.ease, // Optional: Animation curve
                );
                Navigator.pop(context);
              },
            ));
      },
      child: Container(
          alignment: Alignment.center,
          width: 35,
          height: 35,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xffF3F4F6)),
          child: const Icon(Icons.more_horiz_outlined)),
    ),
    const SizedBox(
      width: 10,
    ),
  ];
}
