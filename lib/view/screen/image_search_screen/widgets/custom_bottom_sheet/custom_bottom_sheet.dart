import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/provider/image_provider.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/image_search_screen/image_search_screen.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../../../provider/search_provider.dart';
import '../../../../basewidget/product_widget.dart';
import '../ImageItem/image_item_widget.dart';

// 1. NEW SLIDING UP ------------------------------------------------------------------------------------------------------------------

//2 PANEL -------------------------------------------------------
//2.A A ICON ARROW UP ------------------------------------------------------------
//2. B B INSPIRATION BOARD TEXT ------------------------------------------------------------------

class CustomButtomSheet {
  static double _initFabHeight = 150.0;

  static double _panelHeightClosed = 150.0;

// 1. NEW SLIDING UP ------------------------------------------------------------------------------------------------------------------

  static Widget showSlidingPanel(
    getImage,
    fromCrop,
    isLoading,
    isTop,
    isMiddle,
    _panelHeightOpen,
    setFabHeight,
    context, {
    panelController,
  }) {
    return SlidingUpPanel(
        isDraggable: true,
        maxHeight: _panelHeightOpen,
        minHeight: _panelHeightClosed,
        parallaxEnabled: true,
        parallaxOffset: .2,
        controller: panelController,
        snapPoint: 0.6,
        // body: _body(),
        panelBuilder: (sc) => _panel(
              getImage,
              fromCrop,
              isLoading,
              isTop,
              isMiddle,
              sc,
              panelController,
              context,
            ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(18.0),
          topRight: Radius.circular(
            18.0,
          ),
        ),
        onPanelSlide: (double pos) {
          if (pos == 1) {
            setFabHeight(
                pos * (_panelHeightOpen - _panelHeightClosed) + _initFabHeight,
                true,
                false);
          } else if (pos > 0.5 && pos < 0.8) {
            setFabHeight(
                pos * (_panelHeightOpen - _panelHeightClosed) + _initFabHeight,
                false,
                true);
          } else {
            setFabHeight(
                pos * (_panelHeightOpen - _panelHeightClosed) + _initFabHeight,
                false,
                false);
          }
        });
  }

  //2 PANEL -------------------------------------------------------

  static Widget _panel(
    Function getImage,
    bool fromCrop,
    bool isLoading,
    bool isTop,
    bool isMiddle,
    ScrollController sc,
    PanelController pc,
    context,
  ) {
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
          controller: sc,
          children: <Widget>[
            Row(
              children: [
                //2.A A ICON ARROW UP ------------------------------------------------------------
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 3,
                    ),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(0.0),
                        margin: const EdgeInsets.all(0),
                        child: IconButton(
                          color: Colors.black,
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          iconSize: 40,
                          icon: Icon(
                            isTop ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                          ),
                          onPressed: () {
                            isTop
                                ? pc.animatePanelToPosition(0.00001,
                                    duration: Duration(
                                      milliseconds: 200,
                                    ))
                                : pc.animatePanelToPosition(0.6,
                                    curve: Curves.easeIn);

                            isMiddle
                                ? pc.animatePanelToPosition(1,
                                    duration: Duration(
                                      milliseconds: 200,
                                    ))
                                : null;
                          },
                        ),
                      ),
                    ),
                    //2. B B INSPIRATION BOARD TEXT ------------------------------------------------------------------
                    Text(
                      fromCrop ? "Results " : 'Your photo album',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),

                isMiddle
                    ? Center(
                        child: Container(
                          padding: const EdgeInsets.all(0.0),
                          margin: const EdgeInsets.all(0),
                          child: IconButton(
                            color: Colors.black,
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            iconSize: 40,
                            icon: Icon(
                              isTop
                                  ? Icons.arrow_drop_down
                                  : Icons.arrow_drop_down,
                            ),
                            onPressed: () {
                              isTop
                                  ? pc.animatePanelToPosition(0.00001,
                                      duration: Duration(
                                        milliseconds: 200,
                                      ))
                                  : pc.animatePanelToPosition(0.6,
                                      curve: Curves.easeIn);

                              isMiddle
                                  ? pc.animatePanelToPosition(0.00001,
                                      duration: Duration(
                                        milliseconds: 200,
                                      ))
                                  : null;
                            },
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
            // const SizedBox(
            //   height: 15.0,
            // ),
            !isLoading
                ? Consumer<SearchProvider>(
                    builder: (context, searchProvider, value) {
                      if (searchProvider.searchProductList!.length <= 0 &&
                          fromCrop) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              width: 200,
                              height: 300,
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Text(
                                  'No result found',
                                ),
                              ),
                            ),
                          ],
                        );
                      }

                      return fromCrop
                          ? Container(
                              // padding: EdgeInsets.symmetric(
                              //   horizontal: 8.0,
                              // ),
                              height: MediaQuery.of(context).size.height,
                              child: StaggeredGridView.countBuilder(
                                physics: BouncingScrollPhysics(),
                                padding: EdgeInsets.all(0),
                                crossAxisCount: 2,
                                itemCount:
                                    searchProvider!.searchProductList!.length,
                                //shrinkWrap: true,
                                staggeredTileBuilder: (int index) =>
                                    StaggeredTile.fit(1),
                                itemBuilder: (BuildContext context, int index) {
                                  return ProductWidget(
                                    productModel: searchProvider
                                        .searchProductList![index],
                                  );
                                },
                              ),
                            )
                          :

                          ////////////////////////////////////////////////////////

                          //     Column(
                          //         children: [
                          //           Row(
                          //             mainAxisAlignment:
                          //                 MainAxisAlignment.spaceEvenly,
                          //             children: <Widget>[
                          //               _button(
                          //                   "Popular", Icons.favorite, Colors.blue),
                          //               _button(
                          //                   "Food", Icons.restaurant, Colors.red),
                          //               _button(
                          //                   "Events", Icons.event, Colors.amber),
                          //               _button(
                          //                   "More", Icons.more_horiz, Colors.green),
                          //             ],
                          //           ),
                          //           const SizedBox(
                          //             height: 36.0,
                          //           ),
                          //           Container(
                          //             padding: const EdgeInsets.only(
                          //                 left: 24.0, right: 24.0),
                          //             child: Column(
                          //               crossAxisAlignment:
                          //                   CrossAxisAlignment.start,
                          //               children: <Widget>[
                          //                 const Text("Images",
                          //                     style: TextStyle(
                          //                       fontWeight: FontWeight.w600,
                          //                     )),
                          //                 const SizedBox(
                          //                   height: 12.0,
                          //                 ),
                          //                 Row(
                          //                   mainAxisAlignment:
                          //                       MainAxisAlignment.spaceBetween,
                          //                   children: <Widget>[
                          //                     CachedNetworkImage(
                          //                       imageUrl:
                          //                           "https://images.fineartamerica.com/images-medium-large-5/new-pittsburgh-emmanuel-panagiotakis.jpg",
                          //                       height: 120.0,
                          //                       width: (MediaQuery.of(context)
                          //                                       .size
                          //                                       .width -
                          //                                   48) /
                          //                               2 -
                          //                           2,
                          //                       fit: BoxFit.cover,
                          //                     ),
                          //                     CachedNetworkImage(
                          //                       imageUrl:
                          //                           "https://cdn.pixabay.com/photo/2016/08/11/23/48/pnc-park-1587285_1280.jpg",
                          //                       width: (MediaQuery.of(context)
                          //                                       .size
                          //                                       .width -
                          //                                   48) /
                          //                               2 -
                          //                           2,
                          //                       height: 120.0,
                          //                       fit: BoxFit.cover,
                          //                     ),
                          //                   ],
                          //                 ),
                          //               ],
                          //             ),
                          //           ),
                          //           const SizedBox(
                          //             height: 36.0,
                          //           ),
                          //           Container(
                          //             padding: const EdgeInsets.only(
                          //                 left: 24.0, right: 24.0),
                          //             child: Column(
                          //               crossAxisAlignment:
                          //                   CrossAxisAlignment.start,
                          //               children: const <Widget>[
                          //                 Text("About",
                          //                     style: TextStyle(
                          //                       fontWeight: FontWeight.w600,
                          //                     )),
                          //                 SizedBox(
                          //                   height: 12.0,
                          //                 ),
                          //                 Text(
                          //                   """Pittsburgh is a city in the state of Pennsylvania in the United States, and is the county seat of Allegheny County. A population of about 302,407 (2018) residents live within the city limits, making it the 66th-largest city in the U.S. The metropolitan population of 2,324,743 is the largest in both the Ohio Valley and Appalachia, the second-largest in Pennsylvania (behind Philadelphia), and the 27th-largest in the U.S.\n\nPittsburgh is located in the southwest of the state, at the confluence of the Allegheny, Monongahela, and Ohio rivers. Pittsburgh is known both as "the Steel City" for its more than 300 steel-related businesses and as the "City of Bridges" for its 446 bridges. The city features 30 skyscrapers, two inclined railways, a pre-revolutionary fortification and the Point State Park at the confluence of the rivers. The city developed as a vital link of the Atlantic coast and Midwest, as the mineral-rich Allegheny Mountains made the area coveted by the French and British empires, Virginians, Whiskey Rebels, and Civil War raiders.\n\nAside from steel, Pittsburgh has led in manufacturing of aluminum, glass, shipbuilding, petroleum, foods, sports, transportation, computing, autos, and electronics. For part of the 20th century, Pittsburgh was behind only New York City and Chicago in corporate headquarters employment; it had the most U.S. stockholders per capita. Deindustrialization in the 1970s and 80s laid off area blue-collar workers as steel and other heavy industries declined, and thousands of downtown white-collar workers also lost jobs when several Pittsburgh-based companies moved out. The population dropped from a peak of 675,000 in 1950 to 370,000 in 1990. However, this rich industrial history left the area with renowned museums, medical centers, parks, research centers, and a diverse cultural district.\n\nAfter the deindustrialization of the mid-20th century, Pittsburgh has transformed into a hub for the health care, education, and technology industries. Pittsburgh is a leader in the health care sector as the home to large medical providers such as University of Pittsburgh Medical Center (UPMC). The area is home to 68 colleges and universities, including research and development leaders Carnegie Mellon University and the University of Pittsburgh. Google, Apple Inc., Bosch, Facebook, Uber, Nokia, Autodesk, Amazon, Microsoft and IBM are among 1,600 technology firms generating \$20.7 billion in annual Pittsburgh payrolls. The area has served as the long-time federal agency headquarters for cyber defense, software engineering, robotics, energy research and the nuclear navy. The nation's eighth-largest bank, eight Fortune 500 companies, and six of the top 300 U.S. law firms make their global headquarters in the area, while RAND Corporation (RAND), BNY Mellon, Nova, FedEx, Bayer, and the National Institute for Occupational Safety and Health (NIOSH) have regional bases that helped Pittsburgh become the sixth-best area for U.S. job growth.
                          // """,
                          //                   softWrap: true,
                          //                 ),
                          //               ],
                          //             ),
                          //           ),
                          //           const SizedBox(
                          //             height: 24,
                          //           ),
                          //         ],
                          //       );

                          ////////////////////////////////////////
                          ///
                          Consumer<CustomImageProvider>(
                              builder: (context, imageProvider, child) {
                              return Container(
                                // padding: EdgeInsets.symmetric(
                                //   horizontal: 8.0,
                                // ),
                                height: MediaQuery.of(context).size.height,
                                child: StaggeredGridView.countBuilder(
                                  physics: BouncingScrollPhysics(),
                                  padding: EdgeInsets.all(0),
                                  crossAxisCount: 2,
                                  itemCount: imageProvider.entities!.length,
                                  //shrinkWrap: true,
                                  staggeredTileBuilder: (int index) =>
                                      StaggeredTile.fit(1),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return InkWell(
                                      onTap: () async {
                                        AssetEntity assetEntity =
                                            imageProvider.entities![index];
                                        File? file =
                                            await assetEntity.loadFile();
                                        getImage(
                                          getImageFile.customGallery,
                                          assetImage: file,
                                        );
                                      },
                                      child: ImageItemWidget(
                                        key: ValueKey<int>(1),
                                        entity: imageProvider.entities![index],
                                        option: const ThumbnailOption(
                                          size: ThumbnailSize.square(
                                            50,
                                          ),
                                        ),
                                      ),
                                    );
                                    // return ProductWidget(
                                    //   productModel: searchProvider
                                    //       .searchProductList![index],
                                    // );
                                  },
                                ),
                              );
                            });
                    },
                  )
                : Center(
                    child: LoadingAnimationWidget.staggeredDotsWave(
                      color: Colors.red,
                      size: 100,
                    ),
                  )
          ],
        ));
  }

  static Widget _button(String label, IconData icon, Color color) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(16.0),
          child: Icon(
            icon,
            color: Colors.white,
          ),
          decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.15),
                  blurRadius: 8.0,
                )
              ]),
        ),
        const SizedBox(
          height: 12.0,
        ),
        Text(label),
      ],
    );
  }
}
