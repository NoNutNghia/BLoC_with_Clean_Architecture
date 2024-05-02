import 'package:json_annotation/json_annotation.dart';

const String successStatus = "0";
const String parseError = "-1";
const String timeOut = "-2";
const String unknownError = "-99";
const String tokenExprired = "401";

@JsonSerializable()
class BaseResponse<T> {
  final String? requestId;
  final T? data;
  final String? message;
  final String? status;
  final String? desc;
  BaseResponse({
    this.requestId,
    this.data,
    this.message,
    this.status,
    this.desc,
  });

  bool isSuccess() => successStatus == status;

  bool isTimeOut() => timeOut == status;

  bool isTokenExpired() => tokenExprired == status;

  // factory BaseResponse.fromJson(
  //     Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
  //     _$BaseResponseFromJson<T>(json, fromJsonT);

  // Map<String, dynamic> toJson(Object Function(T) toJsonT) =>
  //     _$ModelBaseResponseToJson<T>(this, toJsonT);
}
