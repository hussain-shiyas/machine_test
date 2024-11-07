import 'package:test_project/ui/homescreen/domain/model/home_page_res_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_page_state.freezed.dart';

@freezed
class HomePageState with _$HomePageState{
const factory HomePageState.initial()= Initial;
const factory HomePageState.loading()= Loading;
const factory HomePageState.success(HomePageResModel homePageSuccess)= HomePageSuccess;
const factory HomePageState.failure(String message)= HomePageFailure;
}