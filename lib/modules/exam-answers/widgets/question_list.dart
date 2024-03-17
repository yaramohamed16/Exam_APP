
import 'package:exams_app/modules/exam_report/bloc/cubit.dart';
import 'package:flutter/material.dart';


import 'question_card.dart';

class QuestionList extends StatelessWidget {
  const QuestionList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 610,
      child: ListView.separated(
          itemBuilder: (context, index) => QuestionCard(model: ExamReportCubit.get(context).examReport!.data?.questions?[index], index: index,),
          separatorBuilder: (context, index) => SizedBox(height: 5,),
          itemCount: ExamReportCubit.get(context).examReport!.data!.questions!.length
      ),
    );
  }
}
