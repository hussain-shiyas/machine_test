import 'dart:convert';

import 'package:test_project/core/endpoints/endpoints.dart';
import 'package:test_project/core/model/failure_exception.dart';
import 'package:test_project/ui/homescreen/domain/model/home_page_res_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

abstract class HomePageDatasource{
  Future<Either<FailureException,HomePageResModel>> getHomePageDatasource();
}

class HomePageDatasourceImpl implements HomePageDatasource{

  @override
  Future<Either<FailureException, HomePageResModel>> getHomePageDatasource() async{
    try {
      String endpoint =EndPoints.homePage;
      var homeUrl = Uri.parse(endpoint);
      var homeResponse = await http.get(homeUrl);
      if (homeResponse.statusCode == 200) {
        var data = jsonDecode(homeResponse.body);
        return Right(HomePageResModel.fromJson(data));
      } else {
        return Left(FailureException(
          'Failed to fetch data from the server',
          homeResponse.statusCode.toString(),
        ));
      }
    } catch (e) {
      return Left(FailureException(
        'Failed to fetch data from the server',
        '500',
      ));
    }
  }

}