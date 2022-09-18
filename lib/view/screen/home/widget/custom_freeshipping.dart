import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/models/ModelProvider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/banner_provider.dart';
import 'package:provider/provider.dart';

import '../../../../helper/price_converter.dart';
import '../../../../utill/color_resources.dart';
import '../../../../utill/custom_themes.dart';
import '../../../../utill/dimensions.dart';

List<Map<String, dynamic>> data = [
  {
    "title": "title one",
    "price": 10,
    "image":
        "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"
  },
  {
    "title": "title one",
    "price": 10,
    "image":
        "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"
  },
  {
    "title": "title one",
    "price": 10,
    "image":
        "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"
  },
  {
    "title": "title one",
    "price": 10,
    "image":
        "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"
  },
  {
    "title": "title one",
    "price": 10,
    "image":
        "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"
  },
  {
    "title": "title one",
    "price": 10,
    "image":
        "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"
  },
  {
    "title": "title one",
    "price": 10,
    "image":
        "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"
  },
  {
    "title": "title one",
    "price": 10,
    "image":
        "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"
  },
  {
    "title": "title one",
    "price": 10,
    "image":
        "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"
  },
  {
    "title": "title one",
    "price": 10,
    "image":
        "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"
  },
  {
    "title": "title one",
    "price": 10,
    "image":
        "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"
  },
  {
    "title": "title one",
    "price": 10,
    "image":
        "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"
  },
  {
    "title": "title one",
    "price": 10,
    "image":
        "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"
  },
  {
    "title": "title one",
    "price": 10,
    "image":
        "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"
  },
  {
    "title": "title one",
    "price": 10,
    "image":
        "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"
  },
  {
    "title": "title one",
    "price": 10,
    "image":
        "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"
  }
];

class FreeShippingWidget extends StatelessWidget {
  const FreeShippingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorResources.WHITE,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  Text(
                    "Free",
                    style: robotoBold.copyWith(
                      fontSize: 20,
                      color: ColorResources.getReviewRattingColor(context),
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Text(
                    "Shipping",
                    style: robotoBold.copyWith(
                      fontSize: 20,
                      color: ColorResources.RED,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Center(
                    child: Icon(
                      size: 18,
                      Icons.arrow_forward,
                    ),
                  )
                ],
              ),
            ),
            Consumer<BannerProvider>(
              builder: (context, bannerProvider, child) {
                List<quickSale>? _freeShippings = bannerProvider.mainBannerList;
                return _freeShippings != null && _freeShippings.length > 0
                    ? SizedBox(
                        width: double.infinity,
                        height: 300,
                        child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _freeShippings.length,
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 90,
                            childAspectRatio: 1 / 3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 0,
                          ),
                          itemBuilder: (context, index) {
                            return GridTile(
                              child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        elevation: 4,
                                        margin: EdgeInsets.all(0),
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(
                                              10,
                                            ),
                                          ),
                                          child: Image.network(
                                            _freeShippings[index].bigImageUrl,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 6,
                                      child: Padding(
                                        padding: EdgeInsets.all(6),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              PriceConverter.convertPrice(
                                                context,
                                                double.parse(
                                                  (_freeShippings[index].price)
                                                      .toString(),
                                                ),
                                              ),
                                              style: robotoBold.copyWith(
                                                fontWeight: FontWeight.w800,
                                                fontSize: 21,
                                                color: ColorResources.RED
                                                    .withAlpha(700),
                                              ),
                                            ),
                                            Text(
                                              _freeShippings[index]
                                                  .title
                                                  .toString(),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: robotoBold.copyWith(
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            Text(
                                              "Free Shipping",
                                              style: robotoBold.copyWith(
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ]),
                            );
                          },
                        ),
                      )
                    : Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
