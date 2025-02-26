import '../models/feed.dart';

abstract class FeedInterface {
  Future<List<Feed>> getFeedPosts();
}
