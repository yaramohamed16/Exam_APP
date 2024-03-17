
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/exam_package_model/exam_packages_model.dart';
import '../../../models/home_model/HomeAds.dart';
import '../../../shared/network/remote/dio_helper.dart';
import 'states.dart';




class ExamsCubit extends Cubit <ExamsStats> {
  ExamsCubit() : super (ExamsInitialStats());

  static ExamsCubit get(context) => BlocProvider.of(context);

  ExamPackagesModel ? examPackagesData;
  void getExamPackages() {
    emit(ExamPackagesLoading());
    DioHelper.getData(
        url: 'exam-packages',
        token: 'Bearer 17|laAM4n9VKAtZbWzMZPpT8rpprwEMLGVkkOzEqith',
        query: {
          'limit': '5',
          'page' : '1',
          'home' : '1'
        }
    ).then((value) {
      emit(ExamPackagesSuccess());
      examPackagesData = ExamPackagesModel.fromJson(value.data);
      print(examPackagesData?.data?[0].title);
    }).catchError((error) {
      emit(ExamPackagesError());
      print(error);
    });
  }
  void update(String ?value) {
    emit(ExamsState(opt: value));
  }

  int currentIndex = 0;
  HomeAds ? homeAds;
  void getHomeAds() {
    emit(HomeAdsLoading());
    DioHelper.getData(
        url: 'homeAds',
        token: 'Bearer 17|laAM4n9VKAtZbWzMZPpT8rpprwEMLGVkkOzEqith',
        query: {
          'lang': 'en',
        }
    ).then((value) {
      emit(HomeAdsSuccess());
      homeAds = HomeAds.fromJson(value.data);
    }).catchError((error) {
      emit(HomeAdsError());
      print(error);
    });
  }

  void updateIndex(int index) {
    currentIndex = index; // Assign the new index to the currentIndex variable
    emit(UpdateIndex());
  }

}
