import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/category.dart';
import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/provider/category_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/splash_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/theme_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/utill/images.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/custom_app_bar.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/product/brand_and_category_product_screen.dart';
import 'package:provider/provider.dart';

import '../../../provider/search_provider.dart';
import '../search/search_screen.dart';

class AllCategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.getIconBg(context),
      body: Column(
        children: [
          CustomAppBar(title: getTranslated('CATEGORY', context)),
          Expanded(child: Consumer<CategoryProvider>(
            builder: (context, categoryProvider, child) {
              return categoryProvider.categoryList.length != 0
                  ? Row(children: [
                      Container(
                        width: 100,
                        margin: EdgeInsets.only(top: 3),
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Theme.of(context).highlightColor,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey[
                                    Provider.of<ThemeProvider>(context)
                                            .darkTheme
                                        ? 700
                                        : 200]!,
                                spreadRadius: 1,
                                blurRadius: 1)
                          ],
                        ),
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: categoryProvider.categoryList.length,
                          padding: EdgeInsets.all(0),
                          itemBuilder: (context, index) {
                            Category _category =
                                categoryProvider.categoryList[index];
                            return InkWell(
                              onTap: () {
                                Provider.of<CategoryProvider>(context,
                                        listen: false)
                                    .changeSelectedIndex(index);
                              },
                              child: CategoryItem(
                                title: _category.name,
                                icon: _category.icon,
                                isSelected:
                                    categoryProvider.categorySelectedIndex ==
                                        index,
                              ),
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.fromLTRB(
                              Dimensions.PADDING_SIZE_SMALL,
                              0.2,
                              Dimensions.PADDING_SIZE_SMALL,
                              0),
                          itemCount: categoryProvider
                              .categoryList[
                                  categoryProvider.categorySelectedIndex!]
                              .subCategories!
                              .length,
                          itemBuilder: (context, index) {
                            SubCategory subCategory = categoryProvider
                                .categoryList[
                                    categoryProvider.categorySelectedIndex!]
                                .subCategories![index];

                            List<SubSubCategory> _sub_sub_cate =
                                subCategory.subSubCategories!;
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  categoryProvider
                                      .categoryList[categoryProvider
                                          .categorySelectedIndex!]
                                      .subCategories![index]
                                      .name!,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                GridView.builder(
                                  padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 0,
                                    childAspectRatio: (1 / 1.3),
                                  ),
                                  itemCount: _sub_sub_cate.length,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return InkWell(
                                      onTap: () async {
                                        var slug = _sub_sub_cate[index].slug;

                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => SearchScreen(
                                              keyword: slug,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        child: Column(children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Theme.of(context)
                                                      .primaryColor
                                                      .withOpacity(.2)),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions
                                                          .PADDING_SIZE_SMALL),

                                              // boxShadow: [BoxShadow(
                                              //   color: Colors.grey.withOpacity(0.3),
                                              //   spreadRadius: 1,
                                              //   blurRadius: 3,
                                              //   offset: Offset(0, 3), // changes position of shadow
                                              // )],
                                            ),
                                            // child:
                                            //     Text(_sub_sub_cate[index].icon!),

                                            // child: Image.network(
                                            //     _sub_sub_cate[index].icon!)

                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions
                                                          .PADDING_SIZE_SMALL),
                                              // child: FadeInImage.assetNetwork(
                                              //   fit: BoxFit.cover,
                                              //   placeholder: Images.placeholder,
                                              //   image: _sub_sub_cate[index].icon!,
                                              //   imageErrorBuilder: (c, o, s) =>
                                              //       Image.asset(
                                              //     Images.placeholder,
                                              //     fit: BoxFit.cover,
                                              //   ),
                                              // ),
                                              child: Image.network(
                                                _sub_sub_cate[index].icon!,
                                              ),
                                            ),
                                          ),
                                          //  SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                          Center(
                                            child: Container(
                                              width: 100,
                                              height: 13,

                                              child: FittedBox(
                                                child: Text(
                                                  _sub_sub_cate[index].name!,
                                                  textAlign: TextAlign.center,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style:
                                                      titilliumRegular.copyWith(
                                                          fontSize: Dimensions
                                                              .FONT_SIZE_DEFAULT,
                                                          color: ColorResources
                                                              .getTextTitle(
                                                                  context)),
                                                ),
                                              ),
                                              // child: Center(
                                              //   child: Text(
                                              //     categoryProvider.categoryList.length != 0
                                              //         ? "BAG"
                                              //         : getTranslated('CATEGORY', context)!,
                                              //     textAlign: TextAlign.center,
                                              //     maxLines: 1,
                                              //     overflow: TextOverflow.ellipsis,
                                              //     style: titilliumRegular.copyWith(
                                              //         fontSize: Dimensions.FONT_SIZE_SMALL,
                                              //         color: ColorResources.getTextTitle(context)),
                                              //   ),
                                              // ),
                                            ),
                                          ),
                                        ]),
                                      ),
                                    );
                                  },
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    ])
                  : Center(
                      child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Theme.of(context).primaryColor)));
            },
          )),
        ],
      ),
    );
  }

  List<Widget> _getSubSubCategories(
      BuildContext context, SubCategory subCategory) {
    List<Widget> _subSubCategories = [];
    _subSubCategories.add(Container(
      color: ColorResources.getIconBg(context),
      margin:
          EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL),
      child: ListTile(
        title: Row(
          children: [
            Container(
              height: 7,
              width: 7,
              decoration: BoxDecoration(
                  color: ColorResources.getPrimary(context),
                  shape: BoxShape.circle),
            ),
            SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
            Flexible(
                child: Text(
              getTranslated('all', context)!,
              style: titilliumSemiBold.copyWith(
                  color: Theme.of(context).textTheme.bodyText1!.color),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )),
          ],
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => BrandAndCategoryProductScreen(
                        isBrand: false,
                        id: subCategory.id.toString(),
                        name: subCategory.name,
                      )));
        },
      ),
    ));
    for (int index = 0; index < subCategory.subSubCategories!.length; index++) {
      _subSubCategories.add(Container(
        color: ColorResources.getIconBg(context),
        margin: EdgeInsets.symmetric(
            horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL),
        child: ListTile(
          title: Row(
            children: [
              Container(
                height: 7,
                width: 7,
                decoration: BoxDecoration(
                    color: ColorResources.getPrimary(context),
                    shape: BoxShape.circle),
              ),
              SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
              Flexible(
                  child: Text(
                subCategory.subSubCategories![index].name!,
                style: titilliumSemiBold.copyWith(
                    color: Theme.of(context).textTheme.bodyText1!.color),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )),
            ],
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => BrandAndCategoryProductScreen(
                          isBrand: false,
                          id: subCategory.subSubCategories![index].id
                              .toString(),
                          name: subCategory.subSubCategories![index].name,
                        )));
          },
        ),
      ));
    }
    return _subSubCategories;
  }
}

class CategoryItem extends StatelessWidget {
  final String? title;
  final String? icon;
  final bool isSelected;
  CategoryItem(
      {required this.title, required this.icon, required this.isSelected});

  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 50,
      margin: EdgeInsets.symmetric(
          vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL, horizontal: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isSelected ? ColorResources.getPrimary(context) : null,
      ),
      child: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          // Container(
          //   height: 50,
          //   width: 50,
          //   decoration: BoxDecoration(
          //     border: Border.all(width: 2, color: isSelected ? Theme.of(context).highlightColor : Theme.of(context).hintColor),
          //     borderRadius: BorderRadius.circular(10),
          //   ),
          //   child: ClipRRect(
          //     borderRadius: BorderRadius.circular(10),
          //     child: FadeInImage.assetNetwork(
          //       placeholder: Images.placeholder, fit: BoxFit.cover,
          //       image: '${Provider.of<SplashProvider>(context,listen: false).baseUrls!.categoryImageUrl}/$icon',
          //       imageErrorBuilder: (c, o, s) => Image.asset(Images.placeholder, fit: BoxFit.cover),
          //     ),
          //   ),
          // ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL),
            child: Text(title!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: titilliumSemiBold.copyWith(
                  fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                  color: isSelected
                      ? Theme.of(context).highlightColor
                      : Theme.of(context).hintColor,
                )),
          ),
        ]),
      ),
    );
  }
}
