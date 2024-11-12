import 'package:get/get.dart';
import 'package:test_project/core/local_storage/hive.dart';
import 'package:test_project/ui/homescreen/domain/model/home_page_res_model.dart';
import 'package:test_project/ui/homescreen/domain/repository/home_page_repo.dart';
import 'package:test_project/ui/homescreen/presentation/state/home_page_state.dart';

class HomeController extends GetxController with StorageServiceMixin {
  Rx<HomePageState>isLoad=const HomePageState.initial().obs;

  Future<void> getHomeData() async {
    isLoad.value=const HomePageState.loading();
    try {
      if (getData<HomePageResModel?>(MainBoxKeys.productData) == null) {
        final repo=Get.find<HomePageRepo>();
        var data = await repo.getHomePageRepo();
        isLoad.value=data.fold(((failure) {
          return HomePageState.failure(failure.message);
        }), (success) {
          addData(MainBoxKeys.productData, success);
          return HomePageSuccess(success);
        });
      } else {
        HomePageResModel data =
            getData<HomePageResModel>(MainBoxKeys.productData);
        isLoad.value=HomePageSuccess(data);
      }
    } catch (e) {
      isLoad.value=const HomePageState.failure('failure.message');
    }
  }
}
