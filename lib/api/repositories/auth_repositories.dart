import 'package:http/http.dart';

abstract class RegistrationRepo {
  static const String ROUTE_URL = "/profile/";

 // Future<Response> register(RegistrationRequest registrationRequest);
}

abstract class LoginRepo {
  static const String ROUTE_AUTHORIZE_URL = "signup";
  static const String ROUTE_LOGIN_URL = "login";

  //Future<Response> authorizeLogin(AuthorizeLoginRequest authorizeLoginRequest);
 // Future<Response> reLogin(ReLoginRequest reLoginRequest);
}
abstract class ResetpassRepo {
  static const String RESET_URL = "reset/password/email/";

}