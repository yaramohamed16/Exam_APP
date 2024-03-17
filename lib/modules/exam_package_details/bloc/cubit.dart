//cubit


import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/exam_overview_model/examOverViewModel.dart';
import '../../../models/exam_package_model/exam_packages_model.dart';
import '../../../shared/network/remote/dio_helper.dart';
import 'state.dart';

class PackageDetailsCubit extends Cubit<PackageDetailsStates> {
  PackageDetailsCubit() : super(PackageDetailsInitialState());

  static PackageDetailsCubit get(context) => BlocProvider.of(context);

  bool isShown = false;

  void examsList() {
    isShown = !isShown;
    emit(ExamShownState());
  }

  ExamOverviewModel? detailsModel;

  void getExamPackages({int? id}) {
    emit(GetPackageDetailsLoading());

    DioHelper.getData(
        url: 'exam-packages-details',
        token: 'Bearer 5|tg2Bac1o460zI88cgfKk8BvkjyeFXqymUcP9VBrN',
        query: {
          'id': id,
          'land': 'ar',
        }).then((value) {
      emit(GetPackageDetailsSuccess());
      detailsModel = ExamOverviewModel.fromJson(value.data);
      print(detailsModel?.data);
    }).catchError((error) {
      emit(GetPackageDetailsError(error.toString()));
      print(error.toString());
    });
  }

  ExamPackagesModel? examPackagesData;
  void getExamPackage() {
    emit(ExamPackagesLoading());
    DioHelper.getData(
        url: 'exam-packages',
        token: 'Bearer 17|laAM4n9VKAtZbWzMZPpT8rpprwEMLGVkkOzEqith',
        query: {'limit': '5', 'page': '1', 'home': '1'}).then((value) {
      emit(ExamPackagesSuccess());
      examPackagesData = ExamPackagesModel.fromJson(value.data);
      // print(examPackagesData?.data);
    }).catchError((error) {
      emit(ExamPackagesError());
      // print(error);
    });
  }
}
