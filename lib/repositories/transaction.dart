import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mono_app/common/failures/base_failure.dart';
import 'package:mono_app/common/failures/common_failure.dart';
import 'package:mono_app/common/mixins/api_result_error_checker_mixin.dart';
import 'package:mono_app/common/network/network_check.dart';
import 'package:mono_app/datasources/transaction.dart';
import 'package:mono_app/models/history.dart';
import 'package:mono_app/models/transaction.dart';
import 'package:mono_app/models/wallet.dart';

abstract class TransactionRepository {
  Future<Either<BaseFailure, History>> getAllTransaction();
  Future<Either<BaseFailure, Wallet>> getWallet();
  Future<Either<BaseFailure, Transaction>> getDetailTransaction(int id);
  Future<Either<BaseFailure, bool>> createTransaction(Transaction request);
  Future<Either<BaseFailure, bool>> updateTransaction(Transaction request);
  Future<Either<BaseFailure, bool>> deleteTransaction(int id);
}

@LazySingleton(as: TransactionRepository)
class TransactionRepositoryImpl extends TransactionRepository
    with APIResultErrorChecker {
  final NetworkCheck networkCheck;
  final TransactionDatasource transactionDatasource;
  TransactionRepositoryImpl({
    required this.networkCheck,
    required this.transactionDatasource,
  });

  @override
  Future<Either<BaseFailure, bool>> createTransaction(
      Transaction request) async {
    final result = await transactionDatasource.createTransaction(request);
    return checkServiceResultError<bool>(
      result: result,
      errorPrefix: 'createTransaction Error: ',
      executeNext: () {
        try {
          if (result.internalResponse?.responseData?['meta']['status'] ==
              'success') {
            return const Right(true);
          } else {
            return const Right(false);
          }
        } catch (e) {
          return Left(JSONParseFailure(error: e));
        }
      },
    );
  }

  @override
  Future<Either<BaseFailure, bool>> deleteTransaction(int id) async {
    final result = await transactionDatasource.deleteTransaction(id);
    return checkServiceResultError<bool>(
      result: result,
      errorPrefix: 'deleteTransaction Error: ',
      executeNext: () {
        try {
          if (result.internalResponse?.responseData?['meta']['status'] ==
              'success') {
            return const Right(true);
          } else {
            return const Right(false);
          }
        } catch (e) {
          return Left(JSONParseFailure(error: e));
        }
      },
    );
  }

  @override
  Future<Either<BaseFailure, History>> getAllTransaction() async {
    final result = await transactionDatasource.getAllTransaction();
    return checkServiceResultError<History>(
      result: result,
      errorPrefix: 'getAllTransaction Error: ',
      executeNext: () {
        try {
          return Right(History.fromJson(
              jsonEncode(result.internalResponse?.responseData?['data'])));
        } catch (e) {
          return Left(JSONParseFailure(error: e));
        }
      },
    );
  }

  @override
  Future<Either<BaseFailure, Transaction>> getDetailTransaction(int id) async {
    final result = await transactionDatasource.getDetailTransaction(id);
    return checkServiceResultError<Transaction>(
      result: result,
      errorPrefix: 'getDetailTransaction Error: ',
      executeNext: () {
        try {
          return Right(Transaction.fromJson(
              jsonEncode(result.internalResponse?.responseData?['data'])));
        } catch (e) {
          return Left(JSONParseFailure(error: e));
        }
      },
    );
  }

  @override
  Future<Either<BaseFailure, Wallet>> getWallet() async {
    final result = await transactionDatasource.getWallet();
    return checkServiceResultError<Wallet>(
      result: result,
      errorPrefix: 'getDetailTransaction Error: ',
      executeNext: () {
        try {
          return Right(Wallet.fromJson(
              jsonEncode(result.internalResponse?.responseData?['data'])));
        } catch (e) {
          return Left(JSONParseFailure(error: e));
        }
      },
    );
  }

  @override
  Future<Either<BaseFailure, bool>> updateTransaction(
      Transaction request) async {
    final result = await transactionDatasource.updateTrasaction(request);
    return checkServiceResultError<bool>(
      result: result,
      errorPrefix: 'updateTrasaction Error: ',
      executeNext: () {
        try {
          if (result.internalResponse?.responseData?['meta']['status'] ==
              'success') {
            return const Right(true);
          } else {
            return const Right(false);
          }
        } catch (e) {
          return Left(JSONParseFailure(error: e));
        }
      },
    );
  }
}
