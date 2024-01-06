// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Wallet extends Equatable {
  final String? income;
  final String? expense;
  final String? balance;

  const Wallet({this.income, this.expense, this.balance});

  @override
  List<Object?> get props => [income, expense, balance];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'income': income,
      'expense': expense,
      'balance': balance,
    };
  }

  factory Wallet.fromMap(Map<String, dynamic> map) {
    return Wallet(
      income: map['income'] != null ? map['income'] as String : null,
      expense: map['expense'] != null ? map['expense'] as String : null,
      balance: map['balance'] != null ? map['balance'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Wallet.fromJson(String source) => Wallet.fromMap(json.decode(source) as Map<String, dynamic>);

  Wallet copyWith({
    String? income,
    String? expense,
    String? balance,
  }) {
    return Wallet(
      income: income ?? this.income,
      expense: expense ?? this.expense,
      balance: balance ?? this.balance,
    );
  }

  @override
  bool get stringify => true;
}
