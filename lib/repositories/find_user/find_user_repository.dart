import 'package:dartz/dartz.dart';
import 'package:rahyab_flutter/core/network/global_config.dart';
import 'package:dio/dio.dart';
import 'package:rahyab_flutter/models/error_model/error_model.dart';
import 'package:rahyab_flutter/models/find_user/find_user_model.dart';

import '../../core/network/exeption.dart';

class FindUserRepository {
  final Dio _dio = dioClient();

  Future<Either<ErrorModel, FindUserModel>> getUser(
      {required String userName}) async {
    try {
      var getUser = await _dio.get('users/$userName');
      final result = FindUserModel.fromJson(getUser.data);
      return Right(result);
    }

    on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();

      return Left(ErrorModel(message: errorMessage.toString()));
    }


    catch (e) {
      return Left(ErrorModel(message: e.toString()));
    }
  }
}
