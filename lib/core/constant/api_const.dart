class ApiConst {
  static const String ipAddress = "192.168.154.1";
  static const String baseUrl = "http://$ipAddress:9000/api"; //ip Address
  static const String register = "$baseUrl/register";
  static const String login = "$baseUrl/login";
  static const String getProfile = "$baseUrl/profilgetById";
  static const String updateProfil = "$baseUrl/UpdateProfil";
  static const String paiement = "$baseUrl/payment";

  //product apis
  static const String products = "$baseUrl/products";
  static const String category = "$baseUrl/products/category";
  static const String subCategory = "$baseUrl/products/subCategory";

  //review apis
  static const String reviews = "$baseUrl/reviews";

  //rating apis
  static const String ratings = "$baseUrl/ratings";

  //promotions apis
  static const String getPromotions = "$baseUrl/";

  //wishlist apis
  static const String wishlist = "$baseUrl/wishlist";
  // static const String getWishlist = "$baseUrl/wishlist/find";

  //cart apis
  static const String cart = "$baseUrl/carts";
  static const String getCart = "$baseUrl/carts/find";
  //fournisseur apis
  static const String fournisseur = "$baseUrl/fournisseurs";

  //category apis
  static const String getCategories = "$baseUrl/categories";
  static const String getSubCategories = "$baseUrl/subCategories";

  //assets apis
  static const String files = "http://$ipAddress:9000/public/images";
}
