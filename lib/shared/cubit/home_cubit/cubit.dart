import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/exam_package_model/exam_packages_model.dart';
import '../../network/remote/dio_helper.dart';
import 'states.dart';

class ExamsCubit extends Cubit<ExamsStats> {
  ExamsCubit() : super(ExamsInitialStats());

  static ExamsCubit get(context) => BlocProvider.of(context);

  ExamPackagesModel? examPackagesData;

  void getExamPackages() {
    emit(ExamPackagesLoading());
    DioHelper.getData(
        url: 'exam-packages',
        token: 'Bearer 17|laAM4n9VKAtZbWzMZPpT8rpprwEMLGVkkOzEqith',
        query: {'limit': '5', 'page': '1', 'home': '1'}).then((value) {
      emit(ExamPackagesSuccess());
      examPackagesData = ExamPackagesModel.fromJson(value.data);
      // print(examPackagesData?.data?[0].title);
    }).catchError((error) {
      emit(ExamPackagesError());
      // print(error);
    });
  }
}
