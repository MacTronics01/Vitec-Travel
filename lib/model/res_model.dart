import 'dart:convert';

ResModel resModelFromJson(String str) => ResModel.fromJson(json.decode(str));
String resModelToJson(ResModel data) => json.encode(data.toJson());

String resModelDataToString(dynamic data) => json.encode(data);
dynamic resModelDataToJson(String data) => json.decode(data);

class ResModel {
  bool? status;
  String? message;
  List<Null>? data;

  ResModel({this.status, this.message, this.data});

  ResModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    // if (json['data'] != null) {
    //   data = <Null>[];
    //   json['data'].forEach((v) {
    //     data!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    // if (this.data != null) {
    //   data['data'] = this.data!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}
