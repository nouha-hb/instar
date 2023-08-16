
class ServerException implements Exception {
    final String? message;
  ServerException({
     this.message,
  });

}

class ConnectionException implements Exception {}

class RegistrationException implements Exception {}

class LoginException implements Exception {
  final String message;

  LoginException(this.message);}

class ProductNotFoundException implements Exception {}

class NotAuthorizedException implements Exception {}

class LocalStorageException implements Exception {


}
