class ApiConst {
  static const String baseUrl = "http://192.168.1.17:3000/api"; //ip Address

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

  //promotions apis
  static const String getPromotions = "$baseUrl/";

  //wishlist apis
  static const String wishlist = "$baseUrl/wishlist";
  static const String getWishlist = "$baseUrl/wishlist/find";

  //cart apis
  static const String cart = "$baseUrl/carts";
  static const String getCart = "$baseUrl/carts/find";

}
