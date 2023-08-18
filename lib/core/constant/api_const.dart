class ApiConst {
  static const String baseUrl = "http://192.168.1.18:3000/api"; //ip Address

  //auth apis
  static const String register = "$baseUrl/register";
  static const String login = "$baseUrl/login";
  static const String getProfile = "$baseUrl/profilgetById";
  static const String updateProfil = "$baseUrl/UpdateProfil";

  //product apis
  static const String products = "$baseUrl/products";
  static const String category = "$baseUrl/products/category";

  //review apis
  static const String reviews = "$baseUrl/reviews";


}
