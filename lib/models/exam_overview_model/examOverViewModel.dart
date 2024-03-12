class ExamOverviewModel {
  Data? data;
  int? statusCode;
  Null? meta;

  ExamOverviewModel({this.data, this.statusCode, this.meta});

  ExamOverviewModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    statusCode = json['status_code'];
    meta = json['meta'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status_code'] = this.statusCode;
    data['meta'] = this.meta;
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
        ? new Enrollment.fromJson(json['enrollment'])
        : null;
    if (json['exams'] != null) {
      exams = <ExamsOverview>[];
      json['exams'].forEach((v) {
        exams!.add(new ExamsOverview.fromJson(v));
      });
    }
    wishlist = json['wishlist'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['is_free'] = this.isFree;
    data['description'] = this.description;
    data['image'] = this.image;
    data['exams_count'] = this.examsCount;
    data['discount_price'] = this.discountPrice;
    if (this.enrollment != null) {
      data['enrollment'] = this.enrollment!.toJson();
    }
    if (this.exams != null) {
      data['exams'] = this.exams!.map((v) => v?.toJson()).toList();
    }
    data['wishlist'] = this.wishlist;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_bought'] = this.isBought;
    data['expired_at'] = this.expiredAt;
    data['bought_at'] = this.boughtAt;
    data['can_access'] = this.canAccess;
    return data;
  }
}

class ExamsOverview {
  int? id;
  String? title;
  String? description;
  Null? image;
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
  PausedAttempts? pausedAttempts;
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
    examPackage = json['exam_package_widgets'];
    examPackageId = json['exam_package_id'];
    allowedAttempts = json['allowed_attempts'];
    allowBack = json['allow_back'];
    startTime = json['start_time'];
    minScore = json['min_score'];
    showAnswer = json['show_answer'];
    desc = json['desc'];
    questionsCount = json['questions_count'];
    pausedAttempts = json['paused_attempts'] != null
        ? new PausedAttempts.fromJson(json['paused_attempts'])
        : null;
    previousAttempts = json['previous_attempts'];
    if (json['breaks'] != null) {
      breaks = <Breaks>[];
      json['breaks'].forEach((v) {
        breaks!.add(new Breaks.fromJson(v));
      });
    }
    breakExists = json['breakExists'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    data['exam_time'] = this.examTime;
    data['exam_package_widgets'] = this.examPackage;
    data['exam_package_id'] = this.examPackageId;
    data['allowed_attempts'] = this.allowedAttempts;
    data['allow_back'] = this.allowBack;
    data['start_time'] = this.startTime;
    data['min_score'] = this.minScore;
    data['show_answer'] = this.showAnswer;
    data['desc'] = this.desc;
    data['questions_count'] = this.questionsCount;
    if (this.pausedAttempts != null) {
      data['paused_attempts'] = this.pausedAttempts!.toJson();
    }
    data['previous_attempts'] = this.previousAttempts;
    if (this.breaks != null) {
      data['breaks'] = this.breaks!.map((v) => v.toJson()).toList();
    }
    data['breakExists'] = this.breakExists;
    return data;
  }
}

class PausedAttempts {
  int? attemptId;
  int? questionsCount;
  int? unansweredQuestions;
  String? remainingTime;
  int? lastOne;
  String? createdAt;
  int? attemptNumber;
  int? packageId;

  PausedAttempts(
      {this.attemptId,
        this.questionsCount,
        this.unansweredQuestions,
        this.remainingTime,
        this.lastOne,
        this.createdAt,
        this.attemptNumber,
        this.packageId});

  PausedAttempts.fromJson(Map<String, dynamic> json) {
    attemptId = json['attempt_id'];
    questionsCount = json['questions_count'];
    unansweredQuestions = json['unanswered_questions'];
    remainingTime = json['remaining_time'];
    lastOne = json['last_one'];
    createdAt = json['created_at'];
    attemptNumber = json['attempt_number'];
    packageId = json['package_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['attempt_id'] = this.attemptId;
    data['questions_count'] = this.questionsCount;
    data['unanswered_questions'] = this.unansweredQuestions;
    data['remaining_time'] = this.remainingTime;
    data['last_one'] = this.lastOne;
    data['created_at'] = this.createdAt;
    data['attempt_number'] = this.attemptNumber;
    data['package_id'] = this.packageId;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['question'] = this.question;
    data['message'] = this.message;
    return data;
  }
}
