import 'package:injectable/injectable.dart';
import 'package:mono_app/common/constants/endpoints.dart';
import 'package:mono_app/common/network/api_result.dart';
import 'package:mono_app/common/network/datasource_execution_mixin.dart';
import 'package:mono_app/common/network/dio_interceptors.dart';
import 'package:sprintf/sprintf.dart';
import 'package:mono_app/models/transaction.dart';

abstract class TransactionDatasource {
  Future<APIResult> getAllTransaction();
  Future<APIResult> getDetailTransaction(int id);
  Future<APIResult> getWallet();
  Future<APIResult> createTransaction(Transaction request);
  Future<APIResult> updateTrasaction(Transaction request);
  Future<APIResult> deleteTransaction(int id);
}

@LazySingleton(as: TransactionDatasource)
class TransactioDatasourceImpl extends TransactionDatasource
    with DatasourceExecutionMixin {
  final HTTPClient httpClient;

  TransactioDatasourceImpl(this.httpClient);

  @override
  Future<APIResult> createTransaction(Transaction request) async {
    return await exec(
      httpClient.dio.post(
        Endpoints.transaction.create,
        data: request.toJson(),
      ),
    );
  }

  @override
  Future<APIResult> deleteTransaction(int id) async {
    return await exec(
      httpClient.dio.delete(
        sprintf(
          Endpoints.transaction.delete,
          [id],
        ),
      ),
    );
  }

  @override
  Future<APIResult> getAllTransaction() async {
    return await exec(
      httpClient.dio.get(
        Endpoints.transaction.getAll,
      ),
    );
  }

  @override
  Future<APIResult> getDetailTransaction(int id) async {
    return await exec(
      httpClient.dio.get(
        sprintf(
          Endpoints.transaction.detail,
          [id],
        ),
      ),
    );
  }

  @override
  Future<APIResult> getWallet() async {
    return await exec(
      httpClient.dio.get(
        Endpoints.transaction.wallet,
      ),
    );
  }

  @override
  Future<APIResult> updateTrasaction(Transaction request) async {
    return await exec(
      httpClient.dio.put(
        sprintf(
          Endpoints.transaction.update,
          [request.id],
        ),
        data: request.toJson(),
      ),
    );
  }
}
