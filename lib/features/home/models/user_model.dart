class UserModel {
  final String uid;
  final String name;
  final String email;
  final String profileUrl;

  UserModel({required this.uid, required this.name, required this.email, required this.profileUrl});

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      uid: data['uid'] ?? '',
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      profileUrl: data['profileUrl'] ?? '',
    );
  }
}