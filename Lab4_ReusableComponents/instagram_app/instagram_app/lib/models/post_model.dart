class PostModel {
  final String id;
  final String userId;
  final String username;
  final String userAvatarUrl;
  final bool isVerified;
  final List<String> imageUrls;
  final String caption;
  final int likeCount;
  final int commentCount;
  final String timeAgo;
  final String? musicName;

  const PostModel({
    required this.id,
    required this.userId,
    required this.username,
    required this.userAvatarUrl,
    required this.imageUrls,
    required this.caption,
    required this.likeCount,
    required this.commentCount,
    required this.timeAgo,
    this.isVerified = false,
    this.musicName,
  });
}
