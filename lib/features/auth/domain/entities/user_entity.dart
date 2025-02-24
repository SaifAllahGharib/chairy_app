class UserEntity {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? token;

  UserEntity({
    this.firstName,
    this.lastName,
    this.email,
    this.token,
  });

  factory UserEntity.fromJson(dynamic json) {
    return UserEntity(
      firstName: json['name'],
      lastName: json['lastName'],
      email: json['email'],
      token: json['token'],
    );
  }
}
