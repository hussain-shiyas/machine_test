import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/ui/homescreen/presentation/provider/notifier/home_page_notifier.dart';
import 'package:test_project/ui/homescreen/presentation/state/home_page_state.dart';

import '../../domain/provider/home_domain_provider.dart';

final homePageNotifierProvider=StateNotifierProvider<HomePageNotifier,HomePageState>((ref){
  final repo =ref.read(repositoryProvider);
  return HomePageNotifier(repo);
});