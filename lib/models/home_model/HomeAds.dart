class HomeAds {
  List<Data>? data;
  int? statusCode;
  Null? meta;

  HomeAds({this.data, this.statusCode, this.meta});

  HomeAds.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    statusCode = json['status_code'];
    meta = json['meta'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status_code'] = this.statusCode;
    data['meta'] = this.meta;
    return data;
  }
}

class Data {
  int? id;
  String? title;
  int? courseId;
  String? image;
  int? price;

  Data({this.id, this.title, this.courseId, this.image, this.price});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    courseId = json['course_id'];
    image = json['image'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['course_id'] = this.courseId;
    data['image'] = this.image;
    data['price'] = this.price;
    return data;
  }
}