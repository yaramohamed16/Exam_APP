//state
abstract class PackageDetailsStates {}

class PackageDetailsInitialState extends PackageDetailsStates {}

class ExamShownState extends PackageDetailsStates {}

class GetPackageDetailsLoading extends PackageDetailsStates {}

class GetPackageDetailsSuccess extends PackageDetailsStates {}

class GetPackageDetailsError extends PackageDetailsStates {
  final String error;

  GetPackageDetailsError(this.error);
}


class ExamPackagesLoading extends PackageDetailsStates {}

class ExamPackagesSuccess extends PackageDetailsStates {}

class ExamPackagesError extends PackageDetailsStates {}