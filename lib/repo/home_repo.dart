// ignore_for_file: non_constant_identifier_names

import 'package:dartz/dartz.dart';
import 'package:getapp1/model/home_model.dart';
import 'package:getapp1/model/post_one.dart';
import 'package:getapp1/model/put_model.dart';
import 'package:getapp1/model/second_model.dart';
import 'package:getapp1/model/three_model.dart';
import 'package:getapp1/repo/api_expation.dart';
import 'package:getapp1/repo/api_faliur.dart';
import 'package:getapp1/repo/api_manager.dart';

class HomeRepo {
  final ApiManager apiManager = ApiManager();

  Future<Either<Failure, HomeModel?>> getData() async {
    try {
      var response = await apiManager.get("https://reqres.in/api/users?page=2");
      var json = HomeModel.fromJson(response);
      return right(json);
    } on AppException catch (e) {
      return left(ApiFailure(message: e.message));
    } catch (e) {
      return left(ApiFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, SecondModel?>> SecondData() async {
    try {
      var response = await apiManager.get("https://api.publicapis.org/entries");
      var json = SecondModel.fromJson(response);
      return right(json);
    } on AppException catch (e) {
      return left(ApiFailure(message: e.message));
    } catch (e) {
      return left(ApiFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, PostOneModel>> postOneData(
      Map<String, Object?> data) async {
    try {
      var jsonResponse = await apiManager.post(
          'https://65804ce16ae0629a3f54dbdb.mockapi.io/Apiendpoint/PostApi',
          data);
      var response = PostOneModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (e) {
      return left(ApiFailure(message: e.message));
    } catch (e) {
      return left(ApiFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, ThreeModel?>> threeData() async {
    try {
      var response = await apiManager.get("https://reqres.in/api/users?page=2");
      var json = ThreeModel.fromJson(response);
      return Right(json);
    } on AppException catch (e) {
      return left(ApiFailure(message: e.message));
    } catch (e) {
      return left(ApiFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, dynamic>> deleteData(int? id) async {
    try {
      // ignore: unused_local_variable
      var response = await apiManager.delete(
          'https://65804ce16ae0629a3f54dbdb.mockapi.io/Apiendpoint/PostApi/$id');
      // var json = ThreeModel.fromJson(response);

      return right("response");
    } on AppException catch (e) {
      return left(ApiFailure(message: e.message));
    } catch (e) {
      return left(ApiFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, PutModel>> putData(
      Map<String, dynamic> data, int? id) async {
    try {
      var jsonresponse = await apiManager.put(
          'https://65804ce16ae0629a3f54dbdb.mockapi.io/Apiendpoint/PostApi/$id',
          data);
      var response = PutModel.fromJson(jsonresponse);
      return right(response);
    } on AppException catch (e) {
      return left(ApiFailure(message: e.message));
    } catch (e) {
      return left(ApiFailure(message: e.toString()));
    }
  }

 
}
