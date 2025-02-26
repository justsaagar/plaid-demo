abstract class AuthRepository {
  Future<String?> getLinkToken();
  Future<String?> getAccessToken(String publicToken);
}
