class ApiEndpoints {
  static const String baseApiUrl = 'https://api.escuelajs.co/api/v1';
  static const String loginEndpoint = '$baseApiUrl/auth/login';

  static String productListingEndpoint(int limit, {int offset = 10}) =>
      '$baseApiUrl/products?limit=$limit&offset=$offset';

  static String getProductDetailEndpoint(int id) => '$baseApiUrl/products/$id';

  static const String categoriesEndpoint = '$baseApiUrl/categories';

  static String productByCategoryIdEndpoint(int id) => '$baseApiUrl/categoryId=$id';
}
