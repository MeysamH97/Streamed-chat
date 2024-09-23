// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_time_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomTimeModelImpl _$$CustomTimeModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomTimeModelImpl(
      seconds: (json['seconds'] as num).toInt(),
      nanoseconds: (json['nanoseconds'] as num).toInt(),
    );

Map<String, dynamic> _$$CustomTimeModelImplToJson(
        _$CustomTimeModelImpl instance) =>
    <String, dynamic>{
      'seconds': instance.seconds,
      'nanoseconds': instance.nanoseconds,
    };
