import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/core/local_storage/hive.dart';
import 'package:test_project/ui/homescreen/domain/model/home_page_res_model.dart';
import 'package:test_project/ui/homescreen/domain/repository/home_page_repo.dart';
import 'package:test_project/ui/homescreen/presentation/state/home_page_state.dart';

class HomePageNotifier extends StateNotifier<HomePageState> with StorageServiceMixin{
  final HomePageRepo repo;

  HomePageNotifier(this.repo) : super(const Initial());

  Future<void> getHomeData() async {
    state = const HomePageState.loading();
    try {
      if(getData<HomePageResModel?>(MainBoxKeys.productData)==null){
        var data = await repo.getHomePageRepo();
        state = data.fold(((failure) {
          return HomePageState.failure(failure.message);
        }), (success) {
          addData(MainBoxKeys.productData,success);
          return HomePageSuccess(success);
        });
      }else{
        HomePageResModel data=getData<HomePageResModel>(MainBoxKeys.productData);
        state= HomePageSuccess(data);
      }

    } catch (e) {
      state = const HomePageState.failure('failure.message');
    }
  }
}
