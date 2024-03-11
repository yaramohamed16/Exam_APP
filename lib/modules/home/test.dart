// import 'package:exams_app/shared/components/constants.dart';
// import 'package:exams_app/shared/components/customeWidgets/dialog_custome.dart';
// import 'package:exams_app/shared/components/customeWidgets/multi_choice_question.dart';
// import 'package:exams_app/shared/components/customeWidgets/single_choice_question.dart';
// import 'package:exams_app/shared/cubit/exam_questions_cubit/states.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../models/exam_questions_model/exam_questions_model.dart';
// import '../../shared/cubit/exam_questions_cubit/cubit.dart';
//
// class ExamQuestionsPage extends StatelessWidget {
//   ExamQuestionsPage({super.key, required this.index, this.model});
//
//   int index;
//   final Data? model;
//   var QuestionsController = PageController();
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (BuildContext context) => ExamsCubit()..getExamQuestions(),
//       child: BlocConsumer<ExamsCubit, ExamQuestionStats>(
//         listener: (BuildContext context, Object? state) {},
//         builder: (BuildContext context, state) {
//           final cubit = ExamsCubit.get(context);
//           final examquestionsData = cubit.examquestionsData;
//           return Scaffold(
//             appBar: AppBar(
//               leading: Padding(
//                 padding: const EdgeInsetsDirectional.symmetric(
//                   vertical: 6,
//                   horizontal: 9,
//                 ),
//                 child: CircleAvatar(
//                   backgroundColor: iconBackgroundColor,
//                   // radius: 14,
//                   child: IconButton(
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                     icon: const Icon(
//                       Icons.arrow_back,
//                       size: 20,
//                     ),
//                     color: mainColor,
//                   ),
//                 ),
//               ),
//               actions: [
//                 GestureDetector(
//                   onTap: () {
//                     showDialog(
//                         context: context,
//                         builder: (context) {
//                           return CustomeDialog(
//                             title: 'Pause Exam',
//                             imageUrl: 'assets/images/pausetimer.PNG',
//                             onConfirm: () {},
//                             onCancel: () {
//                               Navigator.pop(context);
//                             },
//                             subTitle: 'Are you sure you want o puse exam ?',
//                             leftColor: const Color(0xff0225FF),
//                             buttonText: 'Pause',
//                           );
//                         });
//                   },
//                   child: Container(
//                     alignment: Alignment.center,
//                     width: 82,
//                     height: 35,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(8),
//                         border: Border.all(color: const Color(0xffE5E7EB))),
//                     child: const Padding(
//                       padding: EdgeInsets.all(5),
//                       child: Row(children: [
//                         Icon(Icons.pause_circle_outline_outlined),
//                         SizedBox(width: 5),
//                         Text("Pause", style: TextStyle(fontSize: 12))
//                       ]),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 GestureDetector(
//                   onTap: () {
//                     showDialog(
//                       barrierDismissible: false,
//                       context: context,
//                       builder: (context) => CustomeDialog(
//                           title: 'End Exam',
//                           imageUrl: 'assets/images/endexam.PNG',
//                           subTitle: 'Are you sure you want to end exam ?',
//                           leftColor: const Color(0xffE64646),
//                           buttonText: 'Yes, End',
//                           onConfirm: () {},
//                           onCancel: () {
//                             Navigator.pop(context);
//                           }),
//                     );
//                   },
//                   child: Container(
//                     alignment: Alignment.center,
//                     width: 35,
//                     height: 35,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(8),
//                         color: const Color(0xffF3F4F6)),
//                     child: const Icon(Icons.stop_circle_outlined),
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Container(
//                     alignment: Alignment.center,
//                     width: 35,
//                     height: 35,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(8),
//                         color: const Color(0xffF3F4F6)),
//                     child: const Icon(Icons.more_horiz_outlined)),
//                 const SizedBox(
//                   width: 10,
//                 )
//               ],
//             ),
//             body: ExamsCubit.get(context).examquestionsData != null?
//             Padding(
//               padding: const EdgeInsets.only(
//                   right: 25.0, left: 25.0, top: 15, bottom: 15),
//               child: PageView.builder(
//                   physics: const BouncingScrollPhysics(),
//                   controller: QuestionsController,
//                   itemCount: 5,
//                   itemBuilder: (context, index){
//                     return Column(
//                       children: [
//                         Row(
//                           children: [
//                             Text(
//                               'QUESTION ${examquestionsData?.data?[index].id} of ${examquestionsData?.data?.length}',
//                               style: const TextStyle(
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 12,
//                                 fontFamily: 'Roboto',
//                                 color: Color(
//                                   0xff020939,
//                                 ),
//                               ),
//                             ),
//                             const Spacer(
//                               flex: 1,
//                             ),
//                             const Icon(
//                               Icons.access_alarm,
//                               color: Color(0xff0225FF),
//                             ),
//                             const SizedBox(
//                               width: 8,
//                             ),
//                             const Text(
//                               '00:50:20',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 14,
//                                 fontFamily: 'Roboto',
//                                 color: Color(
//                                   0xff020939,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(
//                             right: 5.0,
//                             left: 5.0,
//                             top: 20,
//                             bottom: 20,
//                           ),
//                           child: Container(
//                             height: 0.5,
//                             width: 355,
//                             color: const Color(0xffF0F0F0),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 10.0),
//                           child: Container(
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               '${examquestionsData?.data?[index].id} -  ${examquestionsData?.data?[index].title}',
//                               style: const TextStyle(
//                                 color: Color(
//                                   0xff020939,
//                                 ),
//                                 fontFamily: 'Roboto',
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 16,
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         Stack(
//                           children: [
//                             ClipRRect(
//                               borderRadius: BorderRadius.circular(12),
//                               child: const Image(
//                                 image: NetworkImage(
//                                     'https://s3-alpha-sig.figma.com/img/5bfb/8dde/08100b2cd65af4064f8a80863926b854?Expires=1710115200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Nepa7aJ4bzcD2MzwrV45ZaHI7S8WOu9tMYK-b0evxmRLKvGoB~cqJbYzy1NXivyf0qSHzcnBOEeQnJeV1XqLZcN~fZ17p6i9XFmmgFOpCgW4gAN2t9~RZ8sbxB4TapRZZVlncDp7-uDiB84D1oE9xwIA8I-j8R6y5QsNf62PtuH-8Jz-XRpkD~LeTqTQJ8ZYe01PfGYTy1DsRMCAbh9yny27obACp708SA77WLD3hTZTSkQ6D4DtKfG~ByqBvBcl7ukGXZxrKsYfZmoKo4zg2rAtzVGhfKueuFwcQGSzXlEZfUaECNSLOIwfY0rxfgxl8y3qnprrAEY7OPLnLx2hbg__'),
//                                 fit: BoxFit.cover,
//                                 width: 327,
//                                 height: 146,
//                               ),
//                             ),
//                             Positioned(
//                               top: 8,
//                               right: 7,
//                               child: Container(
//                                 height: 35,
//                                 width: 35,
//                                 decoration: BoxDecoration(
//                                     color: Colors.white,
//                                     borderRadius: BorderRadius.circular(100)),
//                                 child: Row(
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.only(left: 6.0),
//                                       child: GestureDetector(
//                                         child: const Icon(
//                                           Icons.hide_image_outlined,
//                                           color: Color(0xff0225FF),
//                                           size: 20,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         Container(
//                           alignment: Alignment.centerLeft,
//                           child: const Text(
//                             'Answers',
//                             style: TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.w500,
//                               fontFamily: 'Roboto',
//                               color: Color(0xff9CA3AF),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 15,
//                         ),
//                         examquestionsData?.data?[0].multiple != 0 ? const MultiChoice() : const SingleChoice(),
//
//                         const SizedBox(
//                           height: 70,
//                         ),
//                         Row(
//                           children: [
//                             InkWell(
//                               onTap: (){
//                                 QuestionsController.previousPage(duration: const Duration(milliseconds: 750), curve: Curves.fastLinearToSlowEaseIn,);
//
//                               },
//                               child: Container(
//                                 height: 44,
//                                 width: 120,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(8),
//                                   color: Colors.white,
//                                 ),
//                                 child: const Padding(
//                                   padding: EdgeInsets.only(right: 20.0),
//                                   child: Row(
//                                       children: [
//                                         Padding(
//                                           padding: EdgeInsets.only(right: 10.0),
//                                           child: Icon(Icons.arrow_back,
//                                             color: Color(0xff0225FF),
//                                             size: 24,
//                                           ),
//                                         ),
//
//                                         Text(
//                                           'Previous',
//                                           style: TextStyle(
//                                             color: Color(0xff0225FF),
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.w500,
//                                           ),
//                                         ),
//
//
//
//                                       ]
//                                   ),
//                                 ),
//                               ),
//                             ),
//
//                             const Spacer(
//                               flex: 1,
//                             ),
//                             InkWell(
//                               onTap: (){
//                                 QuestionsController.nextPage(duration: const Duration(milliseconds: 750), curve: Curves.fastOutSlowIn,);
//
//                               },
//                               child: Container(
//                                 height: 44,
//                                 width: 108,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(8),
//                                   color: const Color(0xff0225FF),
//                                 ),
//                                 child: const Padding(
//                                   padding: EdgeInsets.only(left: 20.0),
//                                   child: Row(
//                                       children: [
//                                         Text(
//                                           'Next',
//                                           style: TextStyle(
//                                               color: Colors.white,
//                                               fontSize: 14,
//                                               fontWeight: FontWeight.w500),
//                                         ),
//
//                                         Padding(
//                                           padding: EdgeInsets.only(left: 10.0),
//                                           child: Icon(Icons.arrow_forward,
//                                               color: Colors.white, size: 24),
//                                         ),
//
//                                       ]
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     );
//                   }
//
//               ),
//             ):
//             Center(child: CircularProgressIndicator(color: mainColor,),),
//           );
//         },
//       ),
//     );
//   }
// }
