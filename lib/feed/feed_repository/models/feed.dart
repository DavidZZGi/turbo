import 'package:freezed_annotation/freezed_annotation.dart';
part 'feed.freezed.dart';
part 'feed.g.dart';

@Freezed()
@JsonSerializable()
class Feed with _$Feed {
  const factory Feed({
    required int id,
    required String author,
    required String content,
    required String imageUrl,
    required DateTime timestamp,
  }) = _Feed;

  factory Feed.fromJson(Map<String, dynamic> json) => _$FeedFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$FeedToJson(this);
}
