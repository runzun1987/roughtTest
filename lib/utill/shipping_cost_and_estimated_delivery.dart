import '../data/model/response/base/api_provider.dart';
import '../data/model/response/base/city_tier.dart';
import '../data/model/response/base/shipping_type.dart';

class ShippingCostAndEstimatedDelivery {
  static List<String> month = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  static String estimatedDelivery(String? shippingType, int tier) {
    DateTime datenow = new DateTime.now();

    if (tier == 1) {
      if (shippingType == ShippingType.standard) {
        DateTime day30 =
            new DateTime(datenow.year, datenow.month, datenow.day + 30);
        DateTime day60 =
            new DateTime(datenow.year, datenow.month, datenow.day + 60);

        String day30String = "${day30.day}-${month[day30.month - 1]}";
        String day60String = "${day60.day}-${month[day60.month - 1]}";
        String finalStandardShipping = "${day30String} - ${day60String}";
        return finalStandardShipping;
      } else if (shippingType == ShippingType.express) {
        DateTime day7 =
            new DateTime(datenow.year, datenow.month, datenow.day + 7);
        DateTime day20 =
            new DateTime(datenow.year, datenow.month, datenow.day + 20);
        String day7String = "${day7.day}-${month[day7.month - 1]}";
        String day20String = "${day20.day}-${month[day20.month - 1]}";
        String finalExpressShipping = "${day7String} - ${day20String}";
        return finalExpressShipping;
      } else {
        return '1 - 3 days';
      }
    } else if (tier == 2) {
      if (shippingType == ShippingType.standard) {
        DateTime day30 =
            new DateTime(datenow.year, datenow.month, datenow.day + 30 + 10);
        DateTime day60 =
            new DateTime(datenow.year, datenow.month, datenow.day + 60 + 10);

        String day30String = "${day30.day}-${month[day30.month - 1]}";
        String day60String = "${day60.day}-${month[day60.month - 1]}";
        String finalStandardShipping = "${day30String} - ${day60String}";
        return finalStandardShipping;
      } else if (shippingType == ShippingType.express) {
        DateTime day7 =
            new DateTime(datenow.year, datenow.month, datenow.day + 7 + 2);
        DateTime day20 =
            new DateTime(datenow.year, datenow.month, datenow.day + 20 + 2);

        String day7String = "${day7.day}-${month[day7.month - 1]}";
        String day20String = "${day20.day}-${month[day20.month - 1]}";
        String finalExpressShipping = "${day7String} - ${day20String}";
        return finalExpressShipping;

        // const day7String = `${day7.getDate()}-${month[day7.getMonth()]}`;
        // const day20String = `${day20.getDate()}-${month[day20.getMonth()]}`;
        // const finalExpressShipping = `${day7String} - ${day20String}`;
        // return finalExpressShipping;
      } else {
        return '1 - 3 days';
      }
    } else if (tier == 3) {
      if (shippingType == ShippingType.standard) {
        DateTime day30 =
            new DateTime(datenow.year, datenow.month, datenow.day + 30 + 10);
        DateTime day60 =
            new DateTime(datenow.year, datenow.month, datenow.day + 60 + 10);

        String day30String = "${day30.day}-${month[day30.month - 1]}";
        String day60String = "${day60.day}-${month[day60.month - 1]}";
        String finalStandardShipping = "${day30String} - ${day60String}";
        return finalStandardShipping;
        // const day30 = new Date(nowDate.setDate(nowDate.getDate() + 60 + 10));
        // const day60 = new Date(nowDate.setDate(nowDate.getDate() + 60 + 10));
        // const day30String = `${day30.getDate()}-${month[day30.getMonth()]}`;
        // const day60String = `${day60.getDate()}-${month[day60.getMonth()]}`;
        // const finalStandardShipping = `${day30String} - ${day60String}`;
        // return finalStandardShipping;
      } else if (shippingType == ShippingType.express) {
        DateTime day7 =
            new DateTime(datenow.year, datenow.month, datenow.day + 7 + 3);
        DateTime day20 =
            new DateTime(datenow.year, datenow.month, datenow.day + 20 + 3);

        String day7String = "${day7.day}-${month[day7.month - 1]}";
        String day20String = "${day20.day}-${month[day20.month - 1]}";
        String finalExpressShipping = "${day7String} - ${day20String}";
        return finalExpressShipping;
        // const day7 = new Date(nowDate.setDate(nowDate.getDate() + 7 + 3));
        // const day20 = new Date(nowDate.setDate(nowDate.getDate() + 20 + 3));
        // const day7String = `${day7.getDate()}-${month[day7.getMonth()]}`;
        // const day20String = `${day20.getDate()}-${month[day20.getMonth()]}`;
        // const finalExpressShipping = `${day7String} - ${day20String}`;
        // return finalExpressShipping;
      } else {
        return '1 - 3 days';
      }
    } else {
      return 'in valid';
    }
  }

  static int sumOfShipping(
    String? provider,
    int? sellerPrice,
    int? price,
    String? shippingType,
    int? tier,
    int? qty,
  ) {
    int? nepexShippingPrice(String shippingType, int tier) {
      int? price;
      if (shippingType == ShippingType.standard) {
        if (tier == ShippingTier.tier1) price = 100;
        if (tier == ShippingTier.tier2) price = 150;
        if (tier == ShippingTier.tier3) price = 200;
        // if (tier == 4) price = 250;
      } else {
        if (tier == ShippingTier.tier1) price = 100;
        if (tier == ShippingTier.tier2) price = 155;
        if (tier == ShippingTier.tier3) price = 200;
        // if (tier == 4) price = 250;
      }

      return price;
    }

    int ourExpressShipping(num totalPrice) => totalPrice.ceil() * 80;

    if (provider != null && provider == ApiProvider.freeShipping) {
      return 0;
    }

    int sp = sellerPrice == null ? 0 : sellerPrice;

    int prc = price == null ? 0 : price;

    String sT = shippingType == null ? ShippingType.standard : shippingType;

    int tir = tier == null ? 1 : tier;

    int totalPrice = prc + sp;

    int? nepexShipping = nepexShippingPrice(sT, tir);

    // const ourExShipping = ourExpressShipping(totalPrice / 10, 100);
    int ourExShipping = ourExpressShipping(totalPrice / 1000);

    if (shippingType == ShippingType.standard) {
      return (nepexShipping! + sellerPrice!) * qty!;
    } else {
      return (nepexShipping! + ourExShipping + sellerPrice!) * qty!;
    }
  }
}
