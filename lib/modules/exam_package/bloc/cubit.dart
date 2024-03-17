//cubit
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/exam_package_model/exam_packages_model.dart';
import '../../../shared/network/remote/dio_helper.dart';
import 'states.dart';

class ExamsCubit extends Cubit<ExamsStats> {
  ExamsCubit() : super(ExamsInitialStats());

  bool wishlist = false;

  static ExamsCubit get(context) => BlocProvider.of(context);

  ExamPackagesModel? examPackagesData;
  void getExamPackages({String? value}) {
    emit(ExamPackagesLoading());
    DioHelper.getData(
      url: 'exam-packages',
      token: 'Bearer 14|fHJ371jakReEo5G8in6j4nFLFfTImCeDQ3Prqj6Z',
      query: {
        'limit': '5',
        'page': '1',
      },
    ).then((value) {
      emit(ExamPackagesSuccess());
      examPackagesData = ExamPackagesModel.fromJson(value.data);
      allExams = examPackagesData?.data ?? [];
      // print(allExams?.length);
    }).catchError((error) {
      emit(ExamPackagesError());
      // print(error);
    });
  }

  void IsLiked() {
    wishlist = !wishlist;
    emit(WishListState());
  }

  List<Data>? allExams = [];

  void filterExamPackages(String query) {
    emit(ExamPackagesLoading());
    if (query.isEmpty) {
      examPackagesData = ExamPackagesModel(data: allExams);
      emit(ExamPackagesSuccess());
      return;
    } else {
      List<Data> allExams = examPackagesData?.data
              ?.where((exam) =>
                  exam.title!.toLowerCase().contains(query.toLowerCase()))
              .toList() ??
          [];
      examPackagesData = ExamPackagesModel(data: allExams);
      // print(examPackagesData?.data?.length);
    }
    emit(ExamPackagesSuccess());
  }
}
