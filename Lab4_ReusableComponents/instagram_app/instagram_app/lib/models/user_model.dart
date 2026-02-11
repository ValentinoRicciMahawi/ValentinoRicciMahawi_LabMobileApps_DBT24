class UserModel {
  final String id;
  final String username;
  final String displayName;
  final String avatarUrl;
  final bool hasStory;
  final bool isVerified;

  const UserModel({
    required this.id,
    required this.username,
    required this.displayName,
    required this.avatarUrl,
    this.hasStory = false,
    this.isVerified = false,
  });
}
