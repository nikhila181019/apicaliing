// To parse this JSON data, do
//
//     final fetchData = fetchDataFromJson(jsonString);

import 'dart:convert';

List<FetchData> fetchDataFromJson(String str) => List<FetchData>.from(json.decode(str).map((x) => FetchData.fromJson(x)));

String fetchDataToJson(List<FetchData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FetchData {
  FetchData({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  int userId;
  int id;
  String title;
  String body;

  factory FetchData.fromJson(Map<String, dynamic> json) => FetchData(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}
