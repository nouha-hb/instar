class ApiConst {
  static const String ipAddress = "192.168.1.18";
  static const String baseUrl = "http://$ipAddress:9000/api"; //ip Address
  static const String register = "$baseUrl/register";
  static const String login = "$baseUrl/login";
  static const String getProfile = "$baseUrl/profilgetById";
  static const String updateProfil = "$baseUrl/UpdateProfil";
  static const String paiement = "$baseUrl/payment";

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

  //assets apis
  static const String files = "http://$ipAddress:9000/public/images";
}
