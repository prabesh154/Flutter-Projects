import 'user.dart';

class Post {
  final String id;
  final User postedby;
  final String imageUrl;
  final String title;
  final String location;
  final String caption;
  final String postedTimeAgo;
  final String totalLikes;
  final String totalComments;
  final bool isLikedd;
  final bool isBookmarked;

  Post(
      this.id,
      this.postedby,
      this.imageUrl,
      this.title,
      this.location,
      this.caption,
      this.postedTimeAgo,
      this.totalLikes,
      this.totalComments,
      this.isLikedd,
      this.isBookmarked);
}
