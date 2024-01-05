import 'dart:convert';

import 'package:equatable/equatable.dart';

class SignUpRequest extends Equatable {
  final String email;
  final String? fullname;
  final String password;
  const SignUpRequest({
    required this.email,
    this.fullname,
    required this.password,
  });

  SignUpRequest copyWith({
    String? email,
    String? fullname,
    String? password,
  }) {
    return SignUpRequest(
      email: email ?? this.email,
      fullname: fullname ?? this.fullname,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': fullname,
      'password': password,
    };
  }

  factory SignUpRequest.initial() {
    return const SignUpRequest(
      email: '',
      fullname: '',
      password: '',
    );
  }

  factory SignUpRequest.fromMap(Map<String, dynamic> map) {
    return SignUpRequest(
      email: map['email'] ?? '',
      fullname: map['name'],
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SignUpRequest.fromJson(String source) =>
      SignUpRequest.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SignUpRequest(email: $email, fullname: $fullname, password: $password)';
  }

  @override
  List<Object?> get props {
    return [
      email,
      fullname,
      password,
    ];
  }
}
