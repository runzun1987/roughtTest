import 'dart:async';

import 'package:floating_bubbles/floating_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/order_model.dart';
import 'package:flutter_sixvalley_ecommerce/provider/location_provider.dart';
import 'dart:ui' as ui;

import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/my_dialog.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/cart/cart_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/order/order_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/wishlist/wishlist_screen.dart';
import 'package:provider/provider.dart';

import '../../../data/model/response/user_info_model.dart';
import '../../../provider/auth_provider.dart';
import '../../../provider/profile_provider.dart';
import '../../../utill/custom_themes.dart';
import '../../../utill/images.dart';
import '../../basewidget/animated_custom_dialog.dart';
import '../../basewidget/guest_dialog.dart';
import '../../basewidget/image_diaglog.dart';
import '../../basewidget/not_loggedin_widget.dart';
import '../address/saved_address_list_screen.dart';
import 'change_password.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  ui.Image? bgImage;
  bool _isLoggedIn = false;
  UserInfoModel? _userInfo;
  bool _isLoading = false;

  Future<ui.Image> loadImage(Uint8List img) async {
    final Completer<ui.Image> completer = Completer();
    ui.decodeImageFromList(img, (ui.Image img) {
      return completer.complete(img);
    });
    return completer.future;
  }

  Future<void> getImage() async {
    WidgetsFlutterBinding.ensureInitialized();
    var bytes = await rootBundle.load('assets/images/signout.png');
    var uint8List = bytes.buffer.asUint8List();
    ui.Image myBackground = await loadImage(uint8List);

    setState(() {
      bgImage = myBackground;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _isLoading = true;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
    getImage();
  }

  _asyncMethod() async {
    if (await Provider.of<AuthProvider>(context, listen: false)
        .isLoggedIn(context)) {
      setState(() {
        _isLoggedIn = true;
        _userInfo =
            Provider.of<ProfileProvider>(context, listen: false).userInfoModel;
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return !_isLoading
        ? _isLoggedIn && (_userInfo != null)
            ? Container(
                color: ColorResources.LIGHT_SKY_BLUE.withAlpha(
                  20,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Icon(
                            Icons.settings_outlined,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.chat_bubble_outline_rounded,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: width * 1 / 5,
                                height: width * 1 / 5,
                                decoration: BoxDecoration(
                                  color: ColorResources.WHITE,
                                  borderRadius: BorderRadius.circular(
                                    50,
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.asset(
                                    Images.profile_icon,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 5,
                                right: 5,
                                child: Container(
                                  height: 18,
                                  width: 18,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      50,
                                    ),
                                    color: ColorResources.WHITE,
                                  ),
                                  child: const SizedBox(
                                    width: 1,
                                    height: 2,
                                    child: Padding(
                                      padding: EdgeInsets.all(2.0),
                                      child: Icon(
                                        Icons.add_a_photo_outlined,
                                        size: 10,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _userInfo!.firstName! +
                                    " " +
                                    _userInfo!.lastName!,
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                _userInfo!.street != null
                                    ? _userInfo!.street! +
                                        " " +
                                        _userInfo!.town!
                                    : "Please set you address",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      WishListScreen(),
                                ),
                              );
                            },
                            child: Column(
                              children: const [
                                SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: FittedBox(
                                    child: Icon(
                                      Icons.favorite_border_outlined,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Wish List',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      CartScreen(),
                                ),
                              );
                            },
                            child: Column(
                              children: const [
                                SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: FittedBox(
                                    child: Icon(
                                      Icons.shopping_cart_outlined,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Cart',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Column(
                            children: const [
                              SizedBox(
                                width: 40,
                                height: 40,
                                child: FittedBox(
                                  child: Icon(
                                    Icons.history_outlined,
                                  ),
                                ),
                              ),
                              Text(
                                'History',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Card(
                        elevation: 10,
                        child: Container(
                          height: height * 0.20,
                          width: width,
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          OrderScreen(),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 50,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: const [
                                      Text(
                                        "View all",
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_right_outlined,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Divider(
                                  thickness: 1.5,
                                  color: ColorResources.LIGHT_SKY_BLUE),
                              Container(
                                height: 80,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        SizedBox(
                                          width: 40,
                                          height: 40,
                                          child: FittedBox(
                                            child: Icon(
                                              Icons.money_off,
                                              color: ColorResources.RED,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Unpaid',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        SizedBox(
                                          width: 40,
                                          height: 40,
                                          child: FittedBox(
                                            child: Icon(
                                              Icons.shopify_sharp,
                                              color: ColorResources.RED,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'To be shipped',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        SizedBox(
                                          width: 40,
                                          height: 40,
                                          child: FittedBox(
                                            child: Icon(
                                              Icons.local_shipping_sharp,
                                              color: ColorResources.RED,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Shipped',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        SizedBox(
                                          width: 40,
                                          height: 40,
                                          child: FittedBox(
                                            child: Icon(
                                              Icons.rate_review_sharp,
                                              color: ColorResources.RED,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'To be reviewed',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Card(
                        elevation: 10,
                        child: Container(
                          height: height * 0.14,
                          width: width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      showAnimatedDialog(
                                          context,
                                          MyDialog(
                                            customIconColor:
                                                ColorResources.GREEN,
                                            icon: Icons.phone,
                                            title: "Numbers",
                                            description: "asdfasdfasdfasdf",
                                          ),
                                          isFlip: true);
                                      // showDialog(
                                      //   context: context,
                                      //   builder: (context) => AlertDialog(
                                      //     backgroundColor: Colors.transparent,
                                      //     contentPadding: EdgeInsets.all(8),

                                      //     // title: Text("Numbers"),
                                      //     content: Container(
                                      //       height: height * 0.19,
                                      //       width: 10,
                                      //       child: ListView(children: [
                                      //         ...numbers.map((number) =>
                                      //             ElevatedButton(
                                      //               style: ElevatedButton
                                      //                   .styleFrom(
                                      //                 shadowColor:
                                      //                     Colors.transparent,
                                      //                 backgroundColor:
                                      //                     Colors.transparent,
                                      //                 padding:
                                      //                     const EdgeInsets.all(
                                      //                         0.0),
                                      //                 elevation: 5,
                                      //               ),
                                      //               onPressed: () async {
                                      //                 bool? res =
                                      //                     await FlutterPhoneDirectCaller
                                      //                         .callNumber(
                                      //                             number);
                                      //               },
                                      //               child: Ink(
                                      //                 width: width * .40,
                                      //                 decoration: BoxDecoration(
                                      //                   borderRadius:
                                      //                       BorderRadius
                                      //                           .circular(20),
                                      //                   gradient:
                                      //                       LinearGradient(
                                      //                           begin: Alignment
                                      //                               .topRight,
                                      //                           end: Alignment
                                      //                               .bottomLeft,
                                      //                           colors: [
                                      //                         Color(0xFFA0D995),
                                      //                         Color(0xFF6CC4A1)
                                      //                       ]),
                                      //                 ),
                                      //                 child: Container(
                                      //                   padding:
                                      //                       const EdgeInsets
                                      //                           .all(10),
                                      //                   constraints:
                                      //                       const BoxConstraints(
                                      //                           minWidth: 88.0),
                                      //                   child: Text(
                                      //                     number,
                                      //                     style: robotoRegular
                                      //                         .copyWith(
                                      //                       color: Color(
                                      //                           0xFF181818),
                                      //                       fontWeight:
                                      //                           FontWeight.bold,
                                      //                       fontSize: 18,
                                      //                     ),
                                      //                     textAlign:
                                      //                         TextAlign.center,
                                      //                   ),
                                      //                   // child: Text(number,
                                      //                   //     textAlign: TextAlign
                                      //                   //         .center, ),
                                      //                 ),
                                      //               ),
                                      //             )),
                                      //       ]),
                                      //     ),
                                      //     // actions: [],
                                      //   ),
                                      // );
                                    },
                                    child: Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        gradient: const LinearGradient(
                                          begin: Alignment.topRight,
                                          end: Alignment.bottomLeft,
                                          colors: [
                                            Colors.greenAccent,
                                            Colors.green,
                                          ],
                                        ),
                                      ),
                                      child: const FittedBox(
                                        child: Padding(
                                          padding: EdgeInsets.all(6.0),
                                          child: Icon(
                                            Icons.phone_rounded,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  const SizedBox(
                                    width: 60,
                                    child: Center(
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        "Call us",
                                        maxLines: 2,
                                        overflow: TextOverflow.visible,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  var locationProvider =
                                      Provider.of<LocationProvider>(context,
                                          listen: false);
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          SavedAddressListScreen(
                                        userInfo: _userInfo,
                                        locationProvider: locationProvider,
                                        isLoggedIn: true,
                                      ),
                                    ),
                                  );
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        gradient: const LinearGradient(
                                          begin: Alignment.topRight,
                                          end: Alignment.bottomLeft,
                                          colors: [
                                            Color.fromARGB(255, 137, 181, 255),
                                            Colors.blue,
                                          ],
                                        ),
                                      ),
                                      child: const FittedBox(
                                        child: Padding(
                                          padding: EdgeInsets.all(6.0),
                                          child: Icon(
                                            Icons.person,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    const SizedBox(
                                      width: 60,
                                      child: Center(
                                        child: Text(
                                          "Change Details",
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          overflow: TextOverflow.visible,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          ChangePasswordScreen(),
                                    ),
                                  );
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        gradient: const LinearGradient(
                                          begin: Alignment.topRight,
                                          end: Alignment.bottomLeft,
                                          colors: [
                                            Colors.purpleAccent,
                                            Colors.purple,
                                          ],
                                        ),
                                      ),
                                      child: const FittedBox(
                                        child: Padding(
                                          padding: EdgeInsets.all(6.0),
                                          child: Icon(
                                            Icons.password,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    const SizedBox(
                                      width: 60,
                                      child: Center(
                                        child: Text(
                                          "Security",
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.visible,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      gradient: const LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                          Colors.amberAccent,
                                          Colors.amber,
                                        ],
                                      ),
                                    ),
                                    child: const FittedBox(
                                      child: Padding(
                                        padding: EdgeInsets.all(6.0),
                                        child: Icon(
                                          Icons.contact_support_outlined,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  const SizedBox(
                                    width: 60,
                                    child: Center(
                                      child: Text(
                                        "Support",
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        overflow: TextOverflow.visible,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      bgImage != null
                          ? Stack(
                              children: [
                                Container(
                                  child: SizedBox(
                                    width: width,
                                    height: height * 0.25,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: FittedBox(
                                        child: SizedBox(
                                          width: bgImage?.width.toDouble(),
                                          height: bgImage?.height.toDouble(),
                                          child: CustomPaint(
                                            painter: AddImage(bgImage),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned.fill(
                                  child: FloatingBubbles(
                                    noOfBubbles: 10,
                                    colorsOfBubbles: [
                                      Color.fromARGB(255, 92, 165, 224)
                                          .withAlpha(30),
                                      Color.fromARGB(255, 52, 240, 247),
                                    ],
                                    sizeFactor: 0.10,
                                    duration: 400, // 120 seconds.
                                    opacity: 85,
                                    paintingStyle: PaintingStyle.stroke,
                                    strokeWidth: 1,
                                    shape: BubbleShape
                                        .circle, // circle is the default. No need to explicitly mention if its a circle.
                                  ),
                                ),
                              ],
                            )
                          : SizedBox(),
                    ],
                  ),
                ),
              )
            : NotLoggedInWidget()
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}

class AddImage extends CustomPainter {
  final ui.Image? myBackground;

  const AddImage(this.myBackground);
  @override
  void paint(Canvas canvas, Size size) {
    if (myBackground != null) {
      canvas.scale(1);
      canvas.rotate(-0.03);

      canvas.drawImage(myBackground!, Offset.zero, Paint());
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
