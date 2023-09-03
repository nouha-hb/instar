
class ServerException implements Exception {}

class ConnectionException implements Exception {}

class RegistrationException implements Exception {}
class ForgetPasswordException implements Exception {}
class VerifCodeException implements Exception {}
class ResetpasswordException implements Exception {}

class LoginException implements Exception {
  final String message;

  LoginException(this.message);}

class ProductNotFoundException implements Exception {}

class LocalStorageException implements Exception {


}
