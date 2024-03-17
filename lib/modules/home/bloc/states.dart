abstract class ExamsStats {}

class ExamsInitialStats extends ExamsStats {}

class ExamPackagesLoading extends ExamsStats {}

class ExamPackagesSuccess extends ExamsStats {}

class ExamPackagesError extends ExamsStats {}

class ExamAnswersLoading extends ExamsStats {}

class ExamAnswersSuccess extends ExamsStats {}

class ExamAnswersError extends ExamsStats {}

class HomeAdsLoading extends ExamsStats {}

class HomeAdsSuccess extends ExamsStats {}

class HomeAdsError extends ExamsStats {}

class UpdateIndex extends ExamsStats {}



class ExamsState extends ExamsStats {
  final String? opt;

  ExamsState({this.opt});
}