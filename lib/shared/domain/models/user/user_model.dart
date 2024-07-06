import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String fullName;
  final String role;
  final List<double> location;
  final String status;
  final String email;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int loginAttempts;

  const User({
    required this.id,
    required this.fullName,
    required this.role,
    required this.location,
    required this.status,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
    required this.loginAttempts,
  });

  @override
  List<Object?> get props => [
        id,
        fullName,
        role,
        location,
        status,
        email,
        createdAt,
        updatedAt,
        loginAttempts,
      ];

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'fullName': fullName,
      'role': role,
      'location': location,
      'status': status,
      'email': email,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'loginAttempts': loginAttempts,
    };
  }

  factory User.fromJson(Map<String, dynamic> map) => User(
        id: map['id'] ?? '',
        fullName: map['fullName'] ?? '',
        role: map['role'] ?? '',
        location: (map['location'] as List<dynamic>?)
                ?.map((item) => item as double)
                .toList() ??
            [],
        status: map['status'] ?? '',
        email: map['email'] ?? '',
        createdAt: DateTime.parse(map['createdAt']),
        updatedAt: DateTime.parse(map['updatedAt']),
        loginAttempts: map['loginAttempts'] ?? 0,
      );

  User copyWith({
    String? id,
    String? fullName,
    String? role,
    List<double>? location,
    String? status,
    String? email,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? loginAttempts,
  }) {
    return User(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      role: role ?? this.role,
      location: location ?? this.location,
      status: status ?? this.status,
      email: email ?? this.email,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      loginAttempts: loginAttempts ?? this.loginAttempts,
    );
  }
}

class AuthResponse extends Equatable {
  final int exp;
  final String message;
  final String token;
  final User user;

  const AuthResponse({
    required this.exp,
    required this.message,
    required this.token,
    required this.user,
  });

  @override
  List<Object?> get props => [exp, message, token, user];

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'exp': exp,
      'message': message,
      'token': token,
      'user': user.toJson(),
    };
  }

  factory AuthResponse.fromJson(Map<String, dynamic> map) => AuthResponse(
        exp: map['exp'],
        message: map['message'] ?? '',
        token: map['token'] ?? '',
        user: User.fromJson(map['user'] ?? {}),
      );
}
