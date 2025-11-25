class UserModelGalang {
  final String userId;
  final String email;
  final String fullName;
  final String password;

  UserModelGalang({
    required this.userId,
    required this.email,
    required this.fullName,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'email': email,
      'fullName': fullName,
      'password': password,
    };
  }
  
  factory UserModelGalang.fromJson(Map<String, dynamic> json) {
    return UserModelGalang(
      userId: json['userId'],
      email: json['email'],
      fullName: json['fullName'],
      password: json['password'],
    );
  }
}