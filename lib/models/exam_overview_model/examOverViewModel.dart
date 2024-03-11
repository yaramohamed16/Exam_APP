class ExamOverviewModel {
  Data? data;
  int? statusCode;
  Null meta;

  ExamOverviewModel({this.data, this.statusCode, this.meta});

  ExamOverviewModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    statusCode = json['status_code'];
    meta = json['meta'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status_code'] = statusCode;
    data['meta'] = meta;
    return data;
  }
}

class Data {
  int? id;
  String? title;
  int? price;
  int? isFree;
  String? description;
  String? image;
  int? examsCount;
  int? discountPrice;
  Enrollment? enrollment;
  List<ExamsOverview>? exams;
  int? wishlist;

  Data(
      {this.id,
      this.title,
      this.price,
      this.isFree,
      this.description,
      this.image,
      this.examsCount,
      this.discountPrice,
      this.enrollment,
      this.exams,
      this.wishlist});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    isFree = json['is_free'];
    description = json['description'];
    image = json['image'];
    examsCount = json['exams_count'];
    discountPrice = json['discount_price'];
    enrollment = json['enrollment'] != null
        ? Enrollment.fromJson(json['enrollment'])
        : null;
    if (json['exams'] != null) {
      exams = <ExamsOverview>[];
      json['exams'].forEach((v) {
        exams!.add(ExamsOverview.fromJson(v));
      });
    }
    wishlist = json['wishlist'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['is_free'] = isFree;
    data['description'] = description;
    data['image'] = image;
    data['exams_count'] = examsCount;
    data['discount_price'] = discountPrice;
    if (enrollment != null) {
      data['enrollment'] = enrollment!.toJson();
    }
    if (exams != null) {
      data['exams'] = exams!.map((v) => v.toJson()).toList();
    }
    data['wishlist'] = wishlist;
    return data;
  }
}

class Enrollment {
  int? isBought;
  String? expiredAt;
  String? boughtAt;
  int? canAccess;

  Enrollment({this.isBought, this.expiredAt, this.boughtAt, this.canAccess});

  Enrollment.fromJson(Map<String, dynamic> json) {
    isBought = json['is_bought'];
    expiredAt = json['expired_at'];
    boughtAt = json['bought_at'];
    canAccess = json['can_access'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['is_bought'] = isBought;
    data['expired_at'] = expiredAt;
    data['bought_at'] = boughtAt;
    data['can_access'] = canAccess;
    return data;
  }
}

class ExamsOverview {
  int? id;
  String? title;
  String? description;
  Null image;
  int? examTime;
  String? examPackage;
  int? examPackageId;
  int? allowedAttempts;
  int? allowBack;
  String? startTime;
  int? minScore;
  int? showAnswer;
  int? desc;
  int? questionsCount;
  Null pausedAttempts;
  int? previousAttempts;
  List<Breaks>? breaks;
  bool? breakExists;

  ExamsOverview(
      {this.id,
      this.title,
      this.description,
      this.image,
      this.examTime,
      this.examPackage,
      this.examPackageId,
      this.allowedAttempts,
      this.allowBack,
      this.startTime,
      this.minScore,
      this.showAnswer,
      this.desc,
      this.questionsCount,
      this.pausedAttempts,
      this.previousAttempts,
      this.breaks,
      this.breakExists});

  ExamsOverview.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    examTime = json['exam_time'];
    examPackage = json['exam_package'];
    examPackageId = json['exam_package_id'];
    allowedAttempts = json['allowed_attempts'];
    allowBack = json['allow_back'];
    startTime = json['start_time'];
    minScore = json['min_score'];
    showAnswer = json['show_answer'];
    desc = json['desc'];
    questionsCount = json['questions_count'];
    pausedAttempts = json['paused_attempts'];
    previousAttempts = json['previous_attempts'];
    if (json['breaks'] != null) {
      breaks = <Breaks>[];
      json['breaks'].forEach((v) {
        breaks!.add(Breaks.fromJson(v));
      });
    }
    breakExists = json['breakExists'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['image'] = image;
    data['exam_time'] = examTime;
    data['exam_package'] = examPackage;
    data['exam_package_id'] = examPackageId;
    data['allowed_attempts'] = allowedAttempts;
    data['allow_back'] = allowBack;
    data['start_time'] = startTime;
    data['min_score'] = minScore;
    data['show_answer'] = showAnswer;
    data['desc'] = desc;
    data['questions_count'] = questionsCount;
    data['paused_attempts'] = pausedAttempts;
    data['previous_attempts'] = previousAttempts;
    if (breaks != null) {
      data['breaks'] = breaks!.map((v) => v.toJson()).toList();
    }
    data['breakExists'] = breakExists;
    return data;
  }
}

class Breaks {
  int? time;
  int? question;
  String? message;

  Breaks({this.time, this.question, this.message});

  Breaks.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    question = json['question'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['question'] = question;
    data['message'] = message;
    return data;
  }
}
