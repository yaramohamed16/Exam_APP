
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/constants.dart';
import '../../shared/components/customeWidgets/custome_app_bar.dart';
import '../../shared/components/customeWidgets/question_list.dart';
import '../../shared/cubit/exam_report_cubit/cubit.dart';
import '../../shared/cubit/exam_report_cubit/state.dart';


class ExamAnswers extends StatelessWidget {
   ExamAnswers({super.key,required this.responseData});
  final Map<String, dynamic> responseData;
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context) => ExamReportCubit()..getExamReport(responseData: responseData),
      child: BlocConsumer <ExamReportCubit , ExamReportStates>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, Object? state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar:appBarCustom(pageName: "Exam Answers", context: context),
            body: ExamReportCubit.get(context).examReport != null ?
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${ExamReportCubit.get(context).examReport?.data?.title}',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: titleColor
                      ),
                    ),
                    SizedBox(height: 16,),
                    QuestionList(),
                  ],
                ),
              ),
            ) :
            Center(child: CircularProgressIndicator(color: mainColor,)),
          );
        },
      ),
    );
  }
}
