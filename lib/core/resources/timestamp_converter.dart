import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class TimestampConverter implements JsonConverter<Timestamp, Object> {
  const TimestampConverter();

  @override
  Timestamp fromJson(Object json) {
    if (json is Map<String, dynamic>) {
      return Timestamp(json['seconds'] as int, json['nanoseconds'] as int);
    }
    throw Exception('Invalid timestamp format');
  }

  @override
  Object toJson(Timestamp object) {
    return {'seconds': object.seconds, 'nanoseconds': object.nanoseconds};
  }
}
