class UserModel {
  final String id;
  final String name;
  final String avatar;
  final bool isOnline;

  UserModel({
    required this.id,
    required this.name,
    required this.avatar,
    required this.isOnline,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      avatar: json['avatar'],
      isOnline: json['isOnline'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'avatar': avatar,
      'isOnline': isOnline,
    };
  }
}