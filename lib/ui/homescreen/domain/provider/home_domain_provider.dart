import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/ui/homescreen/data/datasource/home_page_datasource.dart';
import 'package:test_project/ui/homescreen/data/repository_impl/home_page_repo_impl.dart';
import 'package:test_project/ui/homescreen/domain/repository/home_page_repo.dart';

final datasourceProvider=Provider<HomePageDatasource>((ref){
  return HomePageDatasourceImpl();
});
final repositoryProvider=Provider<HomePageRepo>((ref){
  final dataSource=ref.watch(datasourceProvider);
  return HomePageRepoImpl(dataSource);
});