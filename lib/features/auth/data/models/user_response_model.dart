import 'package:chairy_app/features/auth/domain/entities/user_entity.dart';

class UserResponseModel {
  final bool isSuccessful;
  final bool hasContent;
  final int code;
  final String message;
  final String? detailedError;
  final UserEntity data;

  UserResponseModel({
    required this.isSuccessful,
    required this.hasContent,
    required this.code,
    required this.message,
    this.detailedError,
    required this.data,
  });

  factory UserResponseModel.fromJson(Map<String, dynamic> json) {
    return UserResponseModel(
      isSuccessful: json['isSuccessful'] ?? false,
      hasContent: json['hasContent'] ?? false,
      code: json['code'] ?? 0,
      message: json['message'] ?? '',
      detailedError: json['detailed_error'],
      data: UserEntity.fromJson(json['data']),
    );
  }
}
