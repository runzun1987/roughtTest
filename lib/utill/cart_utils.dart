import '../models/Cart.dart';
import '../models/Order.dart';
import '../models/ProductInfo.dart';
import 'shipping_cost_and_estimated_delivery.dart';

class CartUtils {
  static double getGrandTotal(Cart cart) {
    int grandTotal = 0;

    for (int i = 0; i < cart.items!.length; i++) {
      grandTotal += (cart.items![i].price! * cart.items![i].qty!) +
          ShippingCostAndEstimatedDelivery.sumOfShipping(
            cart.items![i].provider,
            cart.items![i].sellerPrice,
            cart.items![i].price,
            cart.items![i].shippingType,
            cart.items![i].tier,
            cart.items![i].qty,
          );
    }

    return double.parse(grandTotal.toString());
  }

  static double getTotalItemCost(Cart cart) {
    int grandTotal = 0;

    for (int i = 0; i < cart.items!.length; i++) {
      grandTotal += (cart.items![i].price! * cart.items![i].qty!);
    }

    return double.parse(grandTotal.toString());
  }
    static double getTotalItemOrderCost(Order order) {
    int grandTotal = 0;

    for (int i = 0; i < order.cartList!.length; i++) {
      grandTotal += (order.cartList![i].price! * order.cartList![i].qty!);
    }

    return double.parse(grandTotal.toString());
  }

  static double getTotalShippingCost(Cart cart) {
    int grandTotal = 0;

    for (int i = 0; i < cart.items!.length; i++) {
      grandTotal += ShippingCostAndEstimatedDelivery.sumOfShipping(
        cart.items![i].provider,
        cart.items![i].sellerPrice,
        cart.items![i].price,
        cart.items![i].shippingType,
        cart.items![i].tier,
        cart.items![i].qty,
      );
    }

    return double.parse(grandTotal.toString());
  }

  static Cart updateQty(bool isIncrease, Cart cart, int index) {
    Cart copiedCart = cart.copyWith();

    List<ProductInfo> items = [...copiedCart.items!];

    ProductInfo item = items[index];

    int qty = isIncrease ? item.qty! + 1 : item.qty! - 1;

    final itemWithNewQtyPrice = item.copyWith(
      qty: qty,
      sum: item.price! * qty,
    );
    items[index] = itemWithNewQtyPrice;

    final updatedCart = cart.copyWith(items: items);

    return updatedCart;
  }
}
