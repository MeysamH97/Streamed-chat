import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_time_model.freezed.dart';
part 'custom_time_model.g.dart';

@freezed
class CustomTimeModel with _$CustomTimeModel {
  const factory CustomTimeModel({
    required int seconds,
    required int nanoseconds,
  }) = _CustomTimeModel;

  factory CustomTimeModel.fromJson(Map<String, dynamic> json) =>
      _$CustomTimeModelFromJson(json);


}
