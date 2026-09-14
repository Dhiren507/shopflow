import 'package:shopflow/features/shop/models/product_model.dart';

class PriceCalculationUtils {
  static Map<String, num> calculateProductPrice(num actualPrice, int discount) {
    if (discount <= 0) {
      return {
        'finalPrice' : actualPrice,
        'discountedAmount' : 0
      };
    }

    final num finalPrice = actualPrice * (1 - (discount / 100));
    final num discountedAmount = actualPrice - finalPrice;

    return {
      'finalPrice' : actualPrice,
      'discountedAmount' : discountedAmount
    };
  }

  static Map<String, num> calculateCartTotals(List<ProductModel> cartItems) {
    double totalOriginalPrice = 0.0;
    double totalDiscountAmount = 0.0;

    for (final item in cartItems) {
      final price = item.price ?? 0.0;
      final discountPercent = item.discount ?? 0.0;
      final qty = item.productQuantity ?? 1;

      totalOriginalPrice += price * qty;
      totalDiscountAmount += price * (discountPercent / 100) * qty;
    }

    final finalPayoutAmount = (totalOriginalPrice - totalDiscountAmount);

    return {
      "totalCartAmount": totalOriginalPrice,
      "totalCartDiscount": totalDiscountAmount,
      "payableAmount": finalPayoutAmount,
    };
  }

}