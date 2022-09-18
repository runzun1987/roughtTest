import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/product_model.dart';
import 'package:flutter_sixvalley_ecommerce/helper/product_type.dart';
import 'package:flutter_sixvalley_ecommerce/provider/product_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/search_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/product_shimmer.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/product_widget.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/home/widget/banners_view.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class CustomProductView extends StatelessWidget {
  final bool isHomePage;
  final ProductType productType;
  final ScrollController? scrollController;
  final String? sellerId;
  CustomProductView(
      {required this.isHomePage,
      required this.productType,
      this.scrollController,
      this.sellerId});

  @override
  Widget build(BuildContext context) {
    int offset = 1;
    scrollController?.addListener(() {


      if (scrollController!.position.maxScrollExtent ==
              scrollController!.position.pixels &&
          !Provider.of<SearchProvider>(context, listen: false)
              .moreForYouLoading &&
          Provider.of<SearchProvider>(context, listen: false).moreForYouPage >
              0) {
      
        Provider.of<SearchProvider>(context, listen: false)
            .addMoreForYou(context);
      }
    });

    return Consumer<SearchProvider>(
      builder: (context, searchProvider, child) {
        List<Product>? productList = searchProvider.moreForYou;
        productList!.length;
        // print('========hello hello===>${productList!.length}');

        return Column(children: [
          productList.length != 0
              ? StaggeredGridView.countBuilder(
                  itemCount: isHomePage
                      ? productList.length > 4
                          ? 4
                          : productList.length
                      : productList.length,
                  crossAxisCount: 2,
                  padding: EdgeInsets.all(0),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
                  itemBuilder: (BuildContext context, int index) {
                    return index == 0
                        ? BannersView()
                        : ProductWidget(productModel: productList![index]);
                  },
                )
              // : SizedBox.shrink(),
              : ProductShimmer(isHomePage: isHomePage, isEnabled: true),
          searchProvider.moreForYouLoading
              ? Center(
                  child: Padding(
                  padding: EdgeInsets.all(Dimensions.ICON_SIZE_EXTRA_SMALL),
                  child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).primaryColor)),
                ))
              : SizedBox.shrink(),
        ]);
      },
    );
  }
}
