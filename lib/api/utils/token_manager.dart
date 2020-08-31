class TokenManager {

  TokenManager._privateConstructor();
  static final TokenManager _instance = TokenManager._privateConstructor();
  static TokenManager get getInstance => _instance;

  Future<String> get token => Future.value("token");
}