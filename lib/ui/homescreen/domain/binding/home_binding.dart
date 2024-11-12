import 'package:get/get.dart';
import 'package:test_project/ui/homescreen/data/datasource/home_page_datasource.dart';
import 'package:test_project/ui/homescreen/data/repository_impl/home_page_repo_impl.dart';
import 'package:test_project/ui/homescreen/domain/repository/home_page_repo.dart';
import 'package:test_project/ui/homescreen/presentation/controller/home_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(()=>HomeController());
    Get.lazyPut<HomePageRepo>(()=>HomePageRepoImpl());
    Get.lazyPut<HomePageDatasource>(()=>HomePageDatasourceImpl());

  }

}