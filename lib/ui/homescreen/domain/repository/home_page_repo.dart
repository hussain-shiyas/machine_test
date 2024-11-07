import 'package:test_project/core/model/failure_exception.dart';
import 'package:test_project/ui/homescreen/domain/model/home_page_res_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomePageRepo{
  Future<Either<FailureException,HomePageResModel>> getHomePageRepo();
}