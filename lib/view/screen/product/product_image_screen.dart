import 'package:flutter/material.dart';

import 'package:flutter_sixvalley_ecommerce/provider/product_details_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/splash_provider.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/custom_app_bar.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ProductImageScreen extends StatefulWidget {
  final String? title;
  final List? imageList;

  final Function? valueHandler;
  bool isDefault = true;
  ProductImageScreen({
    required this.title,
    required this.imageList,
    required this.isDefault,
    this.valueHandler,
  });

  @override
  _ProductImageScreenState createState() => _ProductImageScreenState();
}

class _ProductImageScreenState extends State<ProductImageScreen> {
  int? pageIndex;
  PageController? _pageController;

  @override
  void initState() {
    super.initState();

    if (widget.isDefault) {
      pageIndex = Provider.of<ProductDetailsProvider>(context, listen: false)
          .imageSliderIndex;
    } else {
      List emptyList =
          Provider.of<ProductDetailsProvider>(context, listen: false).emptyList!;

      String? id;
      for (var list in emptyList) {
        if (list[2] != null) {
          id = list[0];
          break;
        }
      }
      // [image, keys, valueName, ind]
      pageIndex = widget.imageList!.indexWhere((element) => element[1] == id);
      WidgetsBinding.instance.addPostFrameCallback(
          (_) => scrollToItem(pageIndex, isAnimate: true));
    }

    _pageController = PageController(initialPage: pageIndex!);
  }

  final itemScrollController = ItemScrollController();

  Future scrollToItem(int? index, {bool isAnimate = false}) async {
    final double alignment = 0.4;

    if (isAnimate) {
      await itemScrollController.scrollTo(
          index: index!, duration: Duration(seconds: 1), alignment: alignment);
    } else {
      itemScrollController.jumpTo(
        index: index!,
        alignment: alignment,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        widget.isDefault
            ? CustomAppBar(title: widget.title)
            : CustomAppBar(
                title: widget.title,
                icon: Icons.check,
                onActionPressed: () {
                  widget.valueHandler!(
                    widget.imageList![pageIndex!][1],
                    widget.imageList![pageIndex!][3],
                    widget.imageList![pageIndex!][2],
                    widget.imageList![pageIndex!][0],
                  );
                  Navigator.pop(context);
                }),
        Expanded(
          child: Stack(
            children: [
              PhotoViewGallery.builder(
                scrollPhysics: const BouncingScrollPhysics(),
                builder: (BuildContext context, int index) {
                  return PhotoViewGalleryPageOptions(
                    imageProvider: NetworkImage(
                      '${widget.isDefault ? widget.imageList![index] : widget.imageList![index][0]}',
                    ),
                    initialScale: PhotoViewComputedScale.contained,
                    heroAttributes:
                        PhotoViewHeroAttributes(tag: index.toString()),
                  );
                },
                backgroundDecoration:
                    BoxDecoration(color: Theme.of(context).highlightColor),
                itemCount: widget.imageList!.length,
                loadingBuilder: (context, event) => Center(
                  child: Container(
                    width: 20.0,
                    height: 20.0,
                    child: CircularProgressIndicator(
                      value: event == null
                          ? 0
                          : event.cumulativeBytesLoaded /
                              event.expectedTotalBytes!,
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).primaryColor),
                    ),
                  ),
                ),
                pageController: _pageController,
                onPageChanged: (int index) {
                  setState(() {
                    pageIndex = index;
                    scrollToItem(index, isAnimate: true);
                  });
                },
              ),
              pageIndex != 0
                  ? Positioned(
                      left: 5,
                      top: 0,
                      bottom: 0,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                        child: InkWell(
                          onTap: () {
                            if (pageIndex! > 0) {
                              _pageController!.animateToPage(pageIndex! - 1,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeInOut);
                            }
                          },
                          child: Icon(Icons.chevron_left_outlined, size: 40),
                        ),
                      ),
                    )
                  : SizedBox.shrink(),
              pageIndex != widget.imageList!.length - 1
                  ? Positioned(
                      right: 5,
                      top: 0,
                      bottom: 0,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                        child: InkWell(
                          onTap: () {
                            if (pageIndex! < widget.imageList!.length) {
                              _pageController!.animateToPage(pageIndex! + 1,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeInOut);
                            }
                          },
                          child: Icon(Icons.chevron_right_outlined, size: 40),
                        ),
                      ),
                    )
                  : SizedBox.shrink(),
              !widget.isDefault
                  ? Align(
                      alignment: AlignmentDirectional.bottomEnd,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 0,
                          right: 0,
                          left: 0,
                          bottom: 40.0,
                        ),
                        child: Container(
                          height: 70,
                          child: ScrollablePositionedList.separated(
                            itemScrollController: itemScrollController,
                            scrollDirection: Axis.horizontal,
                            itemCount: widget.imageList!.length,
                            separatorBuilder: (context, _) =>
                                SizedBox(width: 12),
                            itemBuilder: (context, index) => Container(
                              width: 70,

                              // height: 50,
                              decoration: BoxDecoration(
                                border: pageIndex == index
                                    ? Border.all(color: Colors.red, width: 3)
                                    : Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    10,
                                  ),
                                ),
                              ),

                              // color: Colors.red,
                              child: InkWell(
                                onTap: () {
                                  setState(
                                    () {
                                      pageIndex = index;
                                      _pageController!.animateToPage(
                                        index,
                                        duration: Duration(milliseconds: 1),
                                        curve: Curves.bounceIn,
                                      );
                                    },
                                  );
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    widget.imageList![index][0],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : SizedBox()
            ],
          ),
        ),
      ]),
    );
  }
}
