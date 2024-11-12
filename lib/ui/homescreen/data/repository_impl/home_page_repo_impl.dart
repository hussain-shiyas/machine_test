import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:test_project/core/model/failure_exception.dart';
import 'package:test_project/ui/homescreen/data/datasource/home_page_datasource.dart';
import 'package:test_project/ui/homescreen/domain/model/home_page_res_model.dart';
import 'package:test_project/ui/homescreen/domain/repository/home_page_repo.dart';

class HomePageRepoImpl implements HomePageRepo{
  HomePageRepoImpl();

  @override
  Future<Either<FailureException, HomePageResModel>> getHomePageRepo() {
    final dataSource=Get.find<HomePageDatasource>();
    return dataSource.getHomePageDatasource();
  }

}