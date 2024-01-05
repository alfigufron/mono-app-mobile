import 'dart:convert';
import 'package:equatable/equatable.dart';

class Transaction extends Equatable {
  final int? id;
  final String? name;
  final String? type;
  final String? amount;
  final String? date;

  const Transaction({this.id, this.name, this.type, this.amount, this.date});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'type': type,
      'amount': amount,
      'date': date,
    };
  }

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      type: map['type'] != null ? map['type'] as String : null,
      amount: map['amount'] != null ? map['amount'] as String : null,
      date: map['date'] != null ? map['date'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Transaction.fromJson(String source) => Transaction.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object?> get props {
    return [
      id,
      name,
      type,
      amount,
      date,
    ];
  }

  @override
  bool get stringify => true;

  Transaction copyWith({
    int? id,
    String? name,
    String? type,
    String? amount,
    String? date,
  }) {
    return Transaction(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      amount: amount ?? this.amount,
      date: date ?? this.date,
    );
  }
}
