// To parse this JSON data, do
//
//     final putModel = putModelFromJson(jsonString);

import 'dart:convert';

List<PutModel> putModelFromJson(String str) => List<PutModel>.from(json.decode(str).map((x) => PutModel.fromJson(x)));

String putModelToJson(List<PutModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PutModel {
    int? createdAt;
    String? name;
    String? avatar;
    String? id;

    PutModel({
        this.createdAt,
        this.name,
        this.avatar,
        this.id,
    });

    factory PutModel.fromJson(Map<String, dynamic> json) => PutModel(
        createdAt: json["createdAt"],
        name: json["name"],
        avatar: json["avatar"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "name": name,
        "avatar": avatar,
        "id": id,
    };
}
