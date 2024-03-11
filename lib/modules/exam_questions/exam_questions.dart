//exam questions

import 'dart:developer';

import 'package:exams_app/shared/components/constants.dart';
import 'package:exams_app/shared/components/customeWidgets/dialog_custome.dart';
import 'package:exams_app/shared/components/customeWidgets/multi_choice_question.dart';
import 'package:exams_app/shared/components/customeWidgets/single_choice_question.dart';
import 'package:exams_app/shared/cubit/exam_questions_cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../../models/exam_overview_model/examOverViewModel.dart';
import '../../shared/components/customeWidgets/custom_bottom_sheet.dart';
import '../../shared/components/customeWidgets/custom_question_progress.dart';
import '../../shared/cubit/exam_questions_cubit/cubit.dart';
import '../exam_report/exam_report_screen.dart';

class ExamQuestionsPage extends StatelessWidget {
  ExamQuestionsPage(
      {super.key, required this.exams, this.model, this.questionIndex});

  ExamsOverview? exams;
  final int? questionIndex;
  final Data? model;
  var questionsController = PageController();

  @override
  Widget build(BuildContext context) {
    int? secondsRemaining;
    final CountdownController _controller =
        new CountdownController(autoStart: true);

    return BlocProvider(
      create: (BuildContext context) => ExamsCubit()
        ..getExamQuestions()
        ..getExamOverview(),
      child: BlocConsumer<ExamsCubit, ExamQuestionStats>(
        listener: (BuildContext context, Object? state) {},
        builder: (BuildContext context, state) {
          final cubit = ExamsCubit.get(context);
          final examquestionsData = cubit.examquestionsData;
          secondsRemaining = exams?.examTime;
          print(cubit.examOverviewData?.data?.exams);
          final idString =
              exams?.id.toString(); // Track the number of answered questions
          return Scaffold(
            appBar: AppBar(
              leading: Padding(
                padding: const EdgeInsetsDirectional.symmetric(
                  vertical: 6,
                  horizontal: 9,
                ),
                child: CircleAvatar(
                  backgroundColor: iconBackgroundColor,
                  // radius: 14,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 20,
                    ),
                    color: mainColor,
                  ),
                ),
              ),
              actions: [
                // Updated GestureDetector for the Pause button
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return CustomeDialog(
                          title: 'Pause Exam',
                          imageUrl: 'assets/images/pausetimer.PNG',
                          onConfirm: () {
                            _controller.pause();
                          },
                          onCancel: () {
                            Navigator.pop(context);
                            _controller.resume();
                          },
                          subTitle: 'Are you sure you want to pause exam ?',
                          leftColor: const Color(0xff0225FF),
                          buttonText: 'Pause',
                        );
                      },
                    );
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
                    child: Row(
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
                      builder: (context) => CustomeDialog(
                        title: 'End Exam',
                        imageUrl: 'assets/images/endexam.PNG',
                        subTitle: 'Are you sure you want to end exam ?',
                        leftColor: const Color(0xffE64646),
                        buttonText: 'Yes, End',
                        onConfirm: () {
                          _controller.pause();

                          print("id: ${exams?.id}");
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
              ],
            ),
            body: ExamsCubit.get(context).examquestionsData != null &&
                    ExamsCubit.get(context).examOverviewData != null
                ? Padding(
                    padding:
                        const EdgeInsetsDirectional.only(start: 24, end: 24),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: BlocBuilder<ExamsCubit, ExamQuestionStats>(
                                builder: (context, state) {
                                  return Text(
                                    'QUESTION ${cubit.currentIndex + 1} of ${examquestionsData?.data?.length}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      fontFamily: 'Roboto',
                                      color: Color(
                                        0xff020939,
                                      ),
                                    ),
                                    textAlign: TextAlign.start,
                                  );
                                },
                              ),
                            ),
                            const Icon(
                              Icons.access_alarm,
                              color: Color(0xff0225FF),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Countdown(
                              controller: _controller,
                              onFinished: () {
                                cubit.submitStudentAnswers(
                                    idString!, cubit.selectedOptions,
                                    (responseData) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ExamReportScreen(
                                          responseData: responseData),
                                    ),
                                  );
                                });
                                print('timer is done');
                              },
                              interval: const Duration(milliseconds: 100),
                              seconds: secondsRemaining! * 60,
                              build: (BuildContext context, double time) {
                                // Convert the time to a Duration object
                                Duration duration =
                                    Duration(seconds: time.toInt());

                                // Format the duration to display hours, minutes, and seconds
                                String hours =
                                    duration.inHours.toString().padLeft(2, '0');
                                String minutes =
                                    (duration.inMinutes.remainder(60))
                                        .toString()
                                        .padLeft(2, '0');
                                String seconds =
                                    (duration.inSeconds.remainder(60))
                                        .toString()
                                        .padLeft(2, '0');
                                // Return the formatted time as text
                                return Text(
                                  '$hours:$minutes:$seconds',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    fontFamily: 'Roboto',
                                    color: Color(
                                      0xff020939,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        QuestionProgress(
                          question_numbers:
                              examquestionsData?.data?.length ?? 0,
                          index: model != null
                              ? questionIndex!
                              : cubit.currentIndex + 1,
                        ),
                        Expanded(
                          child: PageView.builder(
                            physics: const BouncingScrollPhysics(),
                            controller: questionsController,
                            itemCount: examquestionsData?.data?.length ?? 0,
                            onPageChanged: (int index) {
                              ExamsCubit.get(context).updateCurrentIndex(index);
                            },
                            itemBuilder: (context, index) {
                              if (questionIndex != null) index = questionIndex!;
                              log("This the Index : $index");
                              return SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Container(
                                      height: 0.5,
                                      width: double.infinity,
                                      color: const Color(0xffF0F0F0),
                                    ),
                                    const SizedBox(height: 15),
                                    Container(
                                      height: 0.5,
                                      width: 355,
                                      color: const Color(0xffF0F0F0),
                                    ),
                                    const SizedBox(height: 25),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          '${index + 1} -  ${examquestionsData?.data?[index].title}',
                                          style: const TextStyle(
                                            color: Color(0xff020939),
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    cubit.showimage
                                        ? Stack(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                child: const Image(
                                                  image: NetworkImage(
                                                      "https://s3-alpha-sig.figma.com/img/5bfb/8dde/08100b2cd65af4064f8a80863926b854?Expires=1711324800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=BHnzZWoYfAbO16GZPXsMGmxTe~o756Uix7U6ii6FxRl0GYrdyPq3OThNerXmf7aaIszaDdwAqet36yrVk1TrGJpCY4X~u3tpfgBvVLWL-VnOHkwTSRjiviYKmEl8n8~5Iv83tAtwV5eLrSfrRcOaTs4v2rPhKCibO4z8v5pFvv53zaxPxsMfquof425OgV3CH2p2w496NztFOEeZExPAExGl8~uJs~qr82sjUc~2iG1bHpBG4qD56bBiaAZ8fJ6T22m5NCVSvF8FGBLPLDKcWr9deJvSosHV~DRMKxjpTmiMSJrUuNNNyGKWBWH7enw~fYmF7KRqQAGyaQSyKkhBxw__"),
                                                  fit: BoxFit.cover,
                                                  width: 327,
                                                  height: 146,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 285.0),
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  height: 35,
                                                  width: 35,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100),
                                                  ),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      cubit.IsVisible();
                                                    },
                                                    child: const Icon(
                                                      Icons.hide_image_outlined,
                                                      color: Color(0xff0225FF),
                                                      size: 20,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        : Padding(
                                            padding: const EdgeInsets.only(
                                                left: 270.0),
                                            child: Container(
                                              height: 20,
                                              child: IconButton(
                                                icon: const Icon(
                                                  Icons.image,
                                                  size: 20,
                                                ),
                                                color: const Color(0xff0225FF),
                                                onPressed: () {
                                                  cubit.IsVisible();
                                                },
                                              ),
                                            ),
                                          ),
                                    const SizedBox(height: 20),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: const Text(
                                        'Answers',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Roboto',
                                          color: Color(0xff9CA3AF),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    examquestionsData?.data?[index].multiple !=
                                            0
                                        ? MultiChoice(
                                            model:
                                                examquestionsData?.data?[index],
                                            questionIndex: examquestionsData
                                                    ?.data?[index].id ??
                                                0,
                                          )
                                        : SingleChoice(
                                            model:
                                                examquestionsData?.data?[index],
                                            questionIndex: examquestionsData
                                                    ?.data?[index].id ??
                                                0,
                                          ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
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
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 12.0),
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
                                                (examquestionsData
                                                            ?.data?.length ??
                                                        0) -
                                                    1
                                        ? Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20.0),
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
                                                  idString!,
                                                  cubit.selectedOptions,
                                                  (responseData) {
                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        ExamReportScreen(
                                                            responseData:
                                                                responseData),
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
                                      child: Icon(Icons.arrow_forward,
                                          color: Colors.white, size: 24),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(
                      color: mainColor,
                    ),
                  ),
          );
        },
      ),
    );
  }
}
