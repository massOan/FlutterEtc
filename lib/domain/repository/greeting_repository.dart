import '../../api/model.dart';

abstract class GreetingRepository {
  Future<GreetingMids> getGreetingMids({required int mainCatKey, int? midCatKey});

  Future<GreetingCats> getGreetingCats();
}