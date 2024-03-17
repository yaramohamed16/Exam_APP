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
<<<<<<< HEAD
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Timer stopped'),
            ),
          );
=======
>>>>>>> e71ff4b00835062775c4e235dd29b7b80478289d
        },
        onCancel: () {
          Navigator.pop(context);
          controller.resume();
<<<<<<< HEAD
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Timer Resumed'),
            ),
          );
=======
>>>>>>> e71ff4b00835062775c4e235dd29b7b80478289d
        },
        subTitle: 'Are you sure you want to pause exam ?',
        leftColor: const Color(0xff0225FF),
        buttonText: 'Pause',
      );
    },
  );
}