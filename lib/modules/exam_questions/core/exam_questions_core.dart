import 'package:exams_app/modules/exam_questions/widgets/dialog_custom.dart';
import 'package:flutter/material.dart';

void pauseExam({required context ,required controller , }){
  showDialog(
    context: context,
    builder: (context) {
      return CustomDialog(
        title: 'Pause Exam',
        imageUrl: 'assets/images/pausetimer.PNG',
        onConfirm: () {
          controller.pause();
        },
        onCancel: () {
          Navigator.pop(context);
          controller.resume();
        },
        subTitle: 'Are you sure you want to pause exam ?',
        leftColor: const Color(0xff0225FF),
        buttonText: 'Pause',
      );
    },
  );
}