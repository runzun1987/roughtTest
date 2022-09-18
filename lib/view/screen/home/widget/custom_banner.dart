import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sixvalley_ecommerce/models/ModelProvider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/banner_provider.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;
import 'dart:async';

import 'package:shimmer/shimmer.dart';

import '../../../../helper/price_converter.dart';
import '../../../../provider/theme_provider.dart';
import '../../../../utill/color_resources.dart';
import '../../../../utill/custom_themes.dart';
import '../../../../utill/dimensions.dart';
import '../../../../utill/images.dart';

class CustomBannerView extends StatefulWidget {
  const CustomBannerView({super.key});

  @override
  State<CustomBannerView> createState() => _CustomBannerViewState();
}

class _CustomBannerViewState extends State<CustomBannerView>
    with TickerProviderStateMixin {
  ui.Image? bgImage;
  late ScrollController _scrollController;
  late AnimationController _animationController;

  late Animation _animation;

  late double _height = 0.0;
  double _scrollControllerOffset = 1.0;
  bool isFirstTime = true;

  _scrollListener() {
    setState(() {
      var _off = _scrollController.offset;

      print(_off);
      if (_off == 0.0) {
        _scrollControllerOffset = 1.0;
      } else if (_off <= 1.72) {
        _scrollControllerOffset = 0.8;
      } else if (_off <= 10.5) {
        _scrollControllerOffset = 0.6;
      } else if (_off <= 15.0) {
        _scrollControllerOffset = 0.4;
      } else if (_off <= 20.0) {
        _scrollControllerOffset = 0.2;
      } else {
        _scrollControllerOffset = 0.0;
      }
    });
  }

  Future<ui.Image> loadImage(Uint8List img) async {
    final Completer<ui.Image> completer = Completer();
    ui.decodeImageFromList(img, (ui.Image img) {
      return completer.complete(img);
    });
    return completer.future;
  }

  Future<void> getImage() async {
    var bytes = await rootBundle.load('assets/images/1.png');
    var uint8List = bytes.buffer.asUint8List();
    ui.Image myBackground = await loadImage(uint8List);

    setState(() {
      bgImage = myBackground;
    });
  }

  @override
  void initState() {
    getImage();
    super.initState();

    _scrollController = ScrollController();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 900,
      ),
    );

    Timer(Duration(microseconds: 1), () {
      _animation = Tween(begin: 5.0, end: 1.08).animate(_animationController)
        ..addListener(() {
          setState(() {
            print(_animation.value);

            print(MediaQuery.of(context).size);
            _height = _animation.value;
          });
        });
      _scrollController.jumpTo(-300.00);

      _scrollController.animateTo(
        _scrollController.position.minScrollExtent,
        curve: Curves.easeInOut,
        duration: Duration(
          seconds: 1,
        ),
      );
      _animationController.forward();
    });

    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double outer_height = MediaQuery.of(context).size.height * 0.20;
    double inner_height = MediaQuery.of(context).size.height * 0.18;
    double fourty_width = MediaQuery.of(context).size.width * 0.40;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;

    // if (isFirstTime) {

    //   setState(() {
    //     isFirstTime = false;
    //   });
    // }

    return Stack(
      children: [
        Container(
          color: ColorResources.WHITE,
          height: outer_height,
          width: width,
        ),
        Container(
          color: Theme.of(context).primaryColor.withAlpha(600),
          height: outer_height,
          width: width,
        ),
        ClipPath(
          clipper: DrawPath(),
          child: Shimmer.fromColors(
            period: const Duration(seconds: 3),
            baseColor: Theme.of(context).primaryColor.withAlpha(100),
            highlightColor: ColorResources.RED.withAlpha(400),
            child: Container(
              color: ColorResources.WHITE.withAlpha(80),
              height: outer_height,
              width: width,
            ),
       
          ),
        ),
        Container(
          width: width,
          height: outer_height,
          child: CustomScrollView(
            physics:
                AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
            controller: _scrollController,
            anchor: fourty_width / width,
            scrollDirection: Axis.horizontal,
            slivers: [
              Consumer<BannerProvider>(
                builder: (context, bannerProvider, child) {
                  List<quickSale>? _quickSales = bannerProvider.mainBannerList;

                  return _quickSales != null && _quickSales.length > 0
                      ? SliverList(
                          delegate: SliverChildBuilderDelegate(
                            childCount: _quickSales.length,
                            (context, index) {
                              return Container(
                                width: 100,
                                height: 100,
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Theme.of(context).highlightColor,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          spreadRadius: 1,
                                          blurRadius: 5)
                                    ]),
                                child: Stack(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              8, 8, 8, 8),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Theme.of(context)
                                                      .primaryColor
                                                      .withOpacity(.2),
                                                  width: .1),
                                              color: ColorResources.getIconBg(
                                                  context),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                            ),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              child: FadeInImage.assetNetwork(
                                                placeholder: Images.placeholder,
                                                fit: BoxFit.cover,
                                                image: _quickSales[index]
                                                    .bigImageUrl,
                                                imageErrorBuilder: (c, o, s) =>
                                                    Image.asset(
                                                  Images.placeholder,
                                                  fit: BoxFit.cover,
                                                  height: width * .50,
                                                ),
                                                imageCacheWidth:
                                                    (100 * devicePixelRatio)
                                                        .round(),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              8.0, 2, 8, 0),
                                          child: Text(
                                            _quickSales[index].title!,
                                            style: robotoBold.copyWith(
                                                fontSize: 12),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Positioned(
                                      top: outer_height * 0.50,
                                      child: Container(
                                        height: 25,
                                        margin: EdgeInsets.symmetric(
                                          horizontal: 15,
                                        ),
                                        child: Card(
                                          shape: StadiumBorder(
                                              // side: BorderSide(
                                              //     // color: Colors.black,
                                              //     // width: 2.0,
                                              //     ),
                                              ),
                                          color: ColorResources.getRed(context),
                                          child: Center(
                                            child: Padding(
                                              padding: EdgeInsets.all(2),
                                              child: Text(
                                                PriceConverter.convertPrice(
                                                  context,
                                                  _quickSales[index]
                                                      .price
                                                      .toDouble(),
                                                ),
                                                style: robotoBold.copyWith(
                                                  fontSize: 12,
                                                  color: ColorResources.WHITE,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),

                                    // Off
                                  ],
                                ),
                              );
                            },
                          ),
                        )
                      : shimmerList(width, outer_height, fourty_width);
                },
              ),
            ],
          ),
        ),
        IgnorePointer(
          child: Opacity(
            opacity: _scrollControllerOffset,
            child: SizedBox(
              width: fourty_width,
              height: outer_height,
              child: Align(
                alignment: Alignment.topRight,
                child: FittedBox(
                  child: SizedBox(
                    width: bgImage?.width.toDouble(),
                    height: bgImage?.height.toDouble(),
                    child: CustomPaint(
                      painter: AddImage(bgImage, _height),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        IgnorePointer(
          ignoring: _scrollControllerOffset == 1.0 ? false : true,
          child: Opacity(
            opacity: _scrollControllerOffset,
            child: SizedBox(
              height: outer_height,
              width: fourty_width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SizedBox(
                  //   height: 70,
                  // ),
                  SizedBox(
                    // width: 250.0,
                    height: 25.0,
                    child: DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset.zero,
                            blurRadius: 3.0,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                          Shadow(
                            offset: Offset.zero,
                            blurRadius: 8.0,
                            color: Color(0xFFA0B344),
                          ),
                        ],
                      ),
                      child: AnimatedTextKit(
                        repeatForever: true,
                        animatedTexts: [
                          FadeAnimatedText('QuickSales!'),
                          FadeAnimatedText('Get it !!'),
                          FadeAnimatedText('Now!'),
                        ],
                        onTap: () {
                          print("Tap Event");
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(
                      width: 50,
                      height: 25,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        print("hiiiiiiiiiiiii");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: 15.0,
                      ),
                      child: const Icon(
                        size: 20.0,
                        color: Colors.deepPurpleAccent,
                        Icons.arrow_forward,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class DrawPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var h = size.height;
    var w = size.width;
    Path path = Path();
    path.moveTo(0, size.height * 0.50);
    path.lineTo(0, h);
    path.lineTo(w * 0.20, h);
    path.lineTo(w * 0.80, 0);
    path.lineTo(w * 0.31, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}

class AddImage extends CustomPainter {
  final ui.Image? myBackground;
  final double height;
  const AddImage(this.myBackground, this.height);
  @override
  void paint(Canvas canvas, Size size) {
    if (myBackground != null) {
      canvas.scale(height);

      canvas.drawImage(myBackground!, Offset(size.width / 2, 0), Paint());
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

SliverList shimmerList(width, outer_height, fourty_width) {
  return SliverList(
    delegate: SliverChildBuilderDelegate(
      childCount: 5,
      (context, index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(
            0,
            10,
            8,
            9,
          ),
          child: Card(
            shadowColor: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            margin: EdgeInsets.all(0),
            elevation: 15,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                children: [
                  // Shimmer.Container(
                  //   width: 100,
                  //   height: outer_height,
                  // ),
                  Shimmer.fromColors(
                    period: const Duration(seconds: 1),
                    baseColor: Colors.grey[500]!,
                    highlightColor: Colors.grey[300]!,
                    child: Container(
                      color: Colors.white.withAlpha(80),
                      height: outer_height,
                      width: 100,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}
