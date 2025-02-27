import 'package:freezed_annotation/freezed_annotation.dart';

part 'review.freezed.dart';
part 'review.g.dart';

@Freezed()
@JsonSerializable()
class Review with _$Review {
  const factory Review({
    required int id,
    required String userName,
    required String userAvatar,
    required String comment,
    required double rating,
    required DateTime date,
  }) = _Review;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}
