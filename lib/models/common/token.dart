import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:mono_app/models/user.dart';

class Token extends Equatable {
  final String? accessToken;
  final int? refreshToken;
  final User? user;
  const Token({
    this.accessToken,
    this.refreshToken,
    this.user,
  });

  Token copyWith({
    String? accessToken,
    int? refreshToken,
  }) {
    return Token(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }

  Map<String, dynamic> toMap() {
    return {'token': accessToken, 'expires_in': refreshToken, 'user': user};
  }

  factory Token.fromMap(Map<String, dynamic> map) {
    return Token(
      accessToken: map['token'],
      refreshToken: map['expires_in'],
      user: map['user'] != null && map['user'].runtimeType != String
          ? User.fromMap(map['user'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Token.fromJson(String source) => Token.fromMap(json.decode(source));

  @override
  String toString() =>
      'Token(token: $accessToken, expires_in: $refreshToken), user: ($user)';

  @override
  List<Object?> get props => [accessToken, refreshToken, user];
}
