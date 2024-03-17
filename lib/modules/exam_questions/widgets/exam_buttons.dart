import 'package:exams_app/modules/exam_report/view/exam_report_screen.dart';
import 'package:flutter/material.dart';

class ExamButtons extends StatelessWidget {
  final questionsController;

  final examquestionsData;

  final cubit;
  final idString;

  const ExamButtons(
      {super.key,
      required this.questionsController,
      required this.examquestionsData,
      required this.cubit,
      required this.idString});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            questionsController.previousPage(
              duration: const Duration(milliseconds: 750),
              curve: Curves.fastLinearToSlowEaseIn,
            );
          },
          child: Container(
            height: 44,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              // Adjust padding here
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Icon(
                      Icons.arrow_back,
                      color: Color(0xff0225FF),
                      size: 24,
                    ),
                  ),
                  Text(
                    'Previous',
                    style: TextStyle(
                      color: Color(0xff0225FF),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const Spacer(flex: 1),
        InkWell(
          onTap: () {
            questionsController.nextPage(
              duration: const Duration(milliseconds: 750),
              curve: Curves.fastOutSlowIn,
            );
          },
          child: Container(
            height: 44,
            width: 108,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xff0225FF),
            ),
            child: Row(
              children: [
                examquestionsData?.data?.length != null &&
                        cubit.currentIndex !=
                            (examquestionsData?.data?.length ?? 0) - 1
                    ? Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          'Next',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    : TextButton(
                        onPressed: () {
                          cubit.submitStudentAnswers(
                              idString!, cubit.selectedOptions, (responseData) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ExamReportScreen(
                                    responseData: responseData),
                              ),
                            );
                          });
                        },
                        child: Text(
                          'Submit',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child:
                      Icon(Icons.arrow_forward, color: Colors.white, size: 24),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
