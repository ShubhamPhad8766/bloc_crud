// To parse this JSON data, do
//
//     final postOneModel = postOneModelFromJson(jsonString);

import 'dart:convert';

List<PostOneModel> postOneModelFromJson(String str) => List<PostOneModel>.from(json.decode(str).map((x) => PostOneModel.fromJson(x)));

String postOneModelToJson(List<PostOneModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostOneModel {
    int? createdAt;
    String? name;
    String? avatar;
    String? id;
    int? rol;

    PostOneModel({
        this.createdAt,
        this.name,
        this.avatar,
        this.id,
        this.rol,
    });

    factory PostOneModel.fromJson(Map<String, dynamic> json) => PostOneModel(
        createdAt: json["createdAt"],
        name: json["name"],
        avatar: json["avatar"],
        id: json["id"],
        rol: json["rol"],
    );

    Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "name": name,
        "avatar": avatar,
        "id": id,
        "rol": rol,
    };
}
