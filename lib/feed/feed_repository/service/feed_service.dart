import 'package:turbo/feed/feed_repository/interface/feed_interface.dart';
import 'package:turbo/feed/feed_repository/models/feed.dart';

class FeedService implements FeedInterface {
  //final FeedRemoteDataSource remoteDataSource;

  // FeedService(this.remoteDataSource);

  @override
  Future<List<Feed>> getFeedPosts() async {
    //return await remoteDataSource.fetchFeedPosts();
    return [];
  }
}
