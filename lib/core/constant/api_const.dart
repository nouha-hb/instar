class ApiConst {
  static const String ipAddress = "192.168.80.1";
  static const String baseUrl = "http://$ipAddress:9000/api"; //ip Address
  static const String register = "$baseUrl/register";
  static const String login = "$baseUrl/login";
  static const String getProfile = "$baseUrl/profilgetById";
  static const String updateProfil = "$baseUrl/UpdateProfil";
  static const String paiement = "$baseUrl/payment";

  //category apis
  static const String category = "$baseUrl/products/category";
  //product apis
  static const String products = "$baseUrl/products";

  //review apis
  static const String reviews = "$baseUrl/reviews";

  //rating apis
  static const String ratings = "$baseUrl/ratings";

  //promotions apis
  static const String getPromotions = "$baseUrl/";

  //wishlist apis
  static const String wishlist = "$baseUrl/wishlist";
  static const String getWishlist = "$baseUrl/wishlist/find";

  //cart apis
  static const String cart = "$baseUrl/carts";
  static const String getCart = "$baseUrl/carts/find";

  //category apis
  static const String getCategories = "$baseUrl/categories";

  //assets apis
  static const String files = "http://$ipAddress:9000/public/images";

  //fournisseur apis
  static const String fournisseur = "$baseUrl/fournisseurs";

  //category apis
  static const String getSubCategories = "$baseUrl/subCategories";
  static const String ForgetPassword="$baseUrl/ForgetPassword";
    static const String VerifCode="$baseUrl//VerifCode";
      static const String Resetpassword="$baseUrl/Resetpassword";
}
