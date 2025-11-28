import 'package:flutteretc/api/model/greeting_cats.dart';

import 'package:flutteretc/api/model/greeting_mids.dart';
import 'package:flutteretc/api/service_api_manager.dart';
import 'package:flutteretc/domain/repository/greeting_repository.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

class GreetingRepositoryImpl implements GreetingRepository {
  ServiceApiManager manager;

  GreetingRepositoryImpl({required this.manager});

  @override
  Future<GreetingMids> getGreetingMids(
      {required int mainCatKey, int? midCatKey}) {
    return manager.getGreetAssistDetails(
        mainCatKey: mainCatKey, midCatKey: midCatKey);
  }

  @override
  Future<GreetingCats> getGreetingCats() {
    return manager.getGreetAssistCategories();
  }
}
