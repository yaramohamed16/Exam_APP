
import 'package:flutter/material.dart';


import '../../../../cubit/exam_report_cubit/cubit.dart';
import '../answers_card/question_card.dart';

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
