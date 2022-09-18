import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/product_model.dart';
import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/provider/search_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/utill/images.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/product_widget.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/search/widget/search_filter_bottom_sheet.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class SearchProductWidget extends StatefulWidget {
  final bool? isViewScrollable;
  final SearchProvider? searchProvider;

  SearchProductWidget({
    this.isViewScrollable,
    this.searchProvider,
  });

  @override
  State<SearchProductWidget> createState() => _SearchProductWidgetState();
}

class _SearchProductWidgetState extends State<SearchProductWidget> {
  final ScrollController _scrollController = ScrollController();
  bool isLoading = false;
  int page = 1;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent &&
          !isLoading) {
        if (widget.searchProvider!.searchProductList!.length <=
            widget.searchProvider!.totalSize!) {
          print('FETCH NEW DATA');
          setState(() {
            isLoading = true;
          });
          widget.searchProvider!.searchProduct(
              widget.searchProvider!.searchText, page + 1, context);

          setState(() {
            isLoading = false;
            page = page++;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
      child: Column(
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: '${getTranslated('searched_item', context)}',
                    style: robotoBold.copyWith(
                        fontSize: Dimensions.FONT_SIZE_LARGE,
                        color: ColorResources.getReviewRattingColor(context))),
                TextSpan(
                    text:
                        '(${widget.searchProvider!.searchProductList!.length} ' +
                            '${getTranslated('item_found', context)})'),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                  child: Text(
                '${getTranslated('products', context)}',
                style: robotoBold,
              )),
              InkWell(
                onTap: () => showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (c) => SearchFilterBottomSheet()),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                      horizontal: Dimensions.PADDING_SIZE_SMALL),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Image.asset(Images.dropdown, scale: 3),
                ),
              ),
            ],
          ),
          SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
          Expanded(
            child: StaggeredGridView.countBuilder(
              controller: _scrollController,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.all(0),
              crossAxisCount: 2,
              itemCount: widget.searchProvider!.searchProductList!.length,
              //shrinkWrap: true,
              staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
              itemBuilder: (BuildContext context, int index) {
                return ProductWidget(
                    productModel:
                        widget.searchProvider!.searchProductList![index]);
              },
            ),
          ),
          isLoading
              ? SizedBox(
                  child: CircularProgressIndicator(
                    strokeWidth: 5,
                    valueColor: new AlwaysStoppedAnimation<Color>(
                      Theme.of(context).primaryColor,
                    ),
                  ),
                  height: 30.0,
                  width: 30.0,
                )
              : SizedBox()
        ],
      ),
    );
  }
}
