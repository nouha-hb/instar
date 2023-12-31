class ApiConst {
  static const String ipAddress = "192.168.1.19";
  static const String baseUrl = "http://$ipAddress:9000/api"; //ip Address
  static const String register = "$baseUrl/register";
  static const String login = "$baseUrl/login";
  static const String getProfile = "$baseUrl/profilgetById";
  static const String updateProfil = "$baseUrl/UpdateProfil";
  static const String paiement = "$baseUrl/payment";

  //product apis
  static const String products = "$baseUrl/products";
  static const String category = "$baseUrl/products/category";

  //3Dproduct apis
  static const String product3D = "$baseUrl/3Dproducts";
  static const String allproduct3D = "$baseUrl/3Dproducts/all";

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
  
  //fournisseur apis 
  static const String fournisseur = "$baseUrl/fournisseurs";

  //category apis
  static const String getCategories = "$baseUrl/categories";

 //category apis
  static const String sales = "$baseUrl/sales";

  //category apis
  static const String reclamations = "$baseUrl/reclamations";

  //assets apis
  static const String files = "http://$ipAddress:9000/public/images";

   //category apis
  static const String getSubCategories = "$baseUrl/subCategories";
  static const String ForgetPassword="$baseUrl/ForgetPassword";
    static const String VerifCode="$baseUrl//VerifCode";
      static const String Resetpassword="$baseUrl/Resetpassword";
}