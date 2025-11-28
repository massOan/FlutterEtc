import 'package:flutteretc/api/model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_all_greeting.g.dart';

@riverpod
Future<GreetingCats> getGreetingMainCategory(
    GetGreetingMainCategoryRef ref) async {
  await Future.delayed(const Duration(milliseconds: 200)); // optional 로딩
  return GreetingCats.dummy();
}

@riverpod
Future<GreetingMids> getGreetingSubCategory(
  GetGreetingSubCategoryRef ref, {
  required int mainCatKey,
  int? midCatKey,
}) async {
  await Future.delayed(const Duration(milliseconds: 200)); // optional 로딩
  return GreetingMids.dummy();
}
