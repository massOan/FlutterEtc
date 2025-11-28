import 'package:flutteretc/api/model.dart';

abstract class AuthStorage {
  /// 로컬 스토리지에 Access Token 저장
  Future<bool> saveToken({required String accessToken});

  /// 로컬 스토리지로부터 Access Token을 조회
  Future<String?> getAccessToken();
}

abstract class ServiceApiManager {
  static ServiceApiManager? _instance;

  static Future<ServiceApiManager> create([
    AuthStorage? authStorage,
    // Header header = Header.dummyHeader,
  ]) async {
    // _instance ??= await ServiceApiManagerImpl.create(
    //     authStorage ?? DefaultAuthStorage(),
    //     header,
    //     );
    return _instance!;
  }

  // Future<AppVersion> getAppInitialInfo({required String version});

  Future<MainScreen> getMainScreenInfo();

  Future<GreetingCats> getGreetAssistCategories();

  Future<GreetingMids> getGreetAssistDetails({
    required int mainCatKey,
    int? midCatKey,
  });

  // Future<LifestyleMenuResponse> getLifestyleCategories();

  Future<LifestyleDetails> getLifestyleDetail({required String lifestyleKey});

  // Future<ProposeMenuResponse> getProposeCategories();

  Future<ProposeProducts> getProposeProducts({required int proposeKey});
}
