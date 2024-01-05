// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:mono_app/models/transaction.dart';

class History extends Equatable {
  final int? currentPage;
  final int? totalPage;
  final int? totalRecords;
  final List<Transaction>? records;

  const History(
      {this.currentPage, this.totalPage, this.totalRecords, this.records});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'currentPage': currentPage,
      'totalPage': totalPage,
      'totalRecords': totalRecords,
      'records': records?.map((x) => x.toMap()).toList(),
    };
  }

  factory History.fromMap(Map<String, dynamic> map) {
    return History(
      currentPage:
          map['currentPage'] != null ? map['currentPage'] as int : null,
      totalPage: map['totalPage'] != null ? map['totalPage'] as int : null,
      totalRecords:
          map['totalRecords'] != null ? map['totalRecords'] as int : null,
      records: map['records'] != null
          ? List<Transaction>.from(
              (map['records'] as List<dynamic>).map<Transaction?>(
                (x) => Transaction.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory History.fromJson(String source) =>
      History.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object?> get props => [currentPage, totalPage, totalRecords, records];

  @override
  bool get stringify => true;

  History copyWith({
    int? currentPage,
    int? totalPage,
    int? totalRecords,
    List<Transaction>? records,
  }) {
    return History(
      currentPage: currentPage ?? this.currentPage,
      totalPage: totalPage ?? this.totalPage,
      totalRecords: totalRecords ?? this.totalRecords,
      records: records ?? this.records,
    );
  }
}
