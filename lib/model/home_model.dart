class HomeModel {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<Data>? data;
  Support? support;

  HomeModel(
      {this.page,
      this.perPage,
      this.total,
      this.totalPages,
      this.data,
      this.support});

  HomeModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    perPage = json['per_page'];
    total = json['total'];
    totalPages = json['total_pages'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        // ignore: unnecessary_new
        data!.add(new Data.fromJson(v));
      });
    }
    support =
        // ignore: unnecessary_new
        json['support'] != null ? new Support.fromJson(json['support']) : null;
  }

  Map<String, dynamic> toJson() {
    // ignore: unnecessary_new, prefer_collection_literals
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // ignore: unnecessary_this
    data['page'] = this.page;
    // ignore: unnecessary_this
    data['per_page'] = this.perPage;
    // ignore: unnecessary_this
    data['total'] = this.total;
    // ignore: unnecessary_this
    data['total_pages'] = this.totalPages;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    // ignore: unnecessary_this
    if (this.support != null) {
      // ignore: unnecessary_this
      data['support'] = this.support!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  Data({this.id, this.email, this.firstName, this.lastName, this.avatar});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    // ignore: unnecessary_new, prefer_collection_literals
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // ignore: unnecessary_this
    data['id'] = this.id;
    // ignore: unnecessary_this
    data['email'] = this.email;
    // ignore: unnecessary_this
    data['first_name'] = this.firstName;
    // ignore: unnecessary_this
    data['last_name'] = this.lastName;
    // ignore: unnecessary_this
    data['avatar'] = this.avatar;
    return data;
  }
}

class Support {
  String? url;
  String? text;

  Support({this.url, this.text});

  Support.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals, unnecessary_new
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // ignore: unnecessary_this
    data['url'] = this.url;
    // ignore: unnecessary_this
    data['text'] = this.text;
    return data;
  }
}