// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'userAvatar': instance.userAvatar,
      'comment': instance.comment,
      'rating': instance.rating,
      'date': instance.date.toIso8601String(),
    };

_$ReviewImpl _$$ReviewImplFromJson(Map<String, dynamic> json) => _$ReviewImpl(
      id: (json['id'] as num).toInt(),
      userName: json['userName'] as String,
      userAvatar: json['userAvatar'] as String,
      comment: json['comment'] as String,
      rating: (json['rating'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$ReviewImplToJson(_$ReviewImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'userAvatar': instance.userAvatar,
      'comment': instance.comment,
      'rating': instance.rating,
      'date': instance.date.toIso8601String(),
    };
