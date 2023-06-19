import 'package:reservation_app/data/common/utils/serializable.dart';

class BaseResponse<T extends Serializable> {
  bool success;
  String? resultMsg;
  int code;
  T? data;

  BaseResponse(
      {required this.success,
      required this.resultMsg,
      required this.data,
      required this.code});

  factory BaseResponse.fromJson(
      Map<String, dynamic> json, Function(Map<String, dynamic>) create) {
    return BaseResponse<T>(
        success: json["success"],
        resultMsg: json["resultMsg"],
        code: json["code"],
        data: create(json["data"]));
  }

  Map<String, dynamic> toJson() {
    return {
      "success": this.success,
      "resultMsg": this.resultMsg,
      "code": this.code,
      "data": this.data?.toJson()
    };
  }
}

class BaseListResponse<T extends Serializable> {
  bool success;
  String? resultMsg;
  int code;
  List<T>? data;

  BaseListResponse(
      {required this.success,
      required this.resultMsg,
      required this.code,
      this.data});

  factory BaseListResponse.fromJson(
      Map<String, dynamic> json, Function(List<dynamic>) create) {
    return BaseListResponse(
        success: json["success"],
        resultMsg: json["resultMsg"],
        code: json["code"],
        data: create(json["data"]));
  }

  Map<String, dynamic> toJson() {
    return {
      "success": this.success,
      "resultMsg": this.resultMsg,
      "code": this.code,
      "data": this.data,
    };
  }
}
