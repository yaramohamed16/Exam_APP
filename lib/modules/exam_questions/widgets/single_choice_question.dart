import 'package:exams_app/modules/exam_questions/bloc/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/exam_questions_model/exam_questions_model.dart';

class SingleChoice extends StatelessWidget {
  final DataQuestions? model;
  final int questionIndex;
  const SingleChoice({super.key, this.model, required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    final cubit = ExamsCubit.get(context);
    return Container(
      height: 320,
      child: ListView.separated(
        itemBuilder: (context, index) => Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: RadioListTile(
                title: Text(
                  '${model?.options?[index].title}',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                ),
                activeColor: Color(0xff0225FF),
                value: '${model?.options?[index].key}',
                groupValue: cubit.selectedOptionForQuestion(questionIndex),
                onChanged: (val) => cubit.updateOption(questionIndex, val!),
              ),
            ),
          ],
        ),
        separatorBuilder: (context, index) => SizedBox(
          height: 8,
        ),
        itemCount: model?.options?.length??0,
      ),
    );
  }
}
