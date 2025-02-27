import 'package:freezed_annotation/freezed_annotation.dart';

import '../reviews_model/review.dart';

part 'place.freezed.dart';
part 'place.g.dart';

@Freezed()
@JsonSerializable()
class Place with _$Place {
  const factory Place({
    required int id,
    required String name,
    required String description,
    required String address,
    required double averagePrice,
    required List<String> imageUrls,
    required double rating,
    required List<Review> reviews,
  }) = _Place;

  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PlaceToJson(this);
}
