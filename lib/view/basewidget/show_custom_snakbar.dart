import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';

void showCustomSnackBar(
  String? message,
  BuildContext context, {
  bool isError = true,
  Function? onPress,
  String? label,
  GlobalKey<ScaffoldMessengerState>? scaffoldKey,
}) {
  if (scaffoldKey != null) {
    scaffoldKey.currentState!.showSnackBar(SnackBar(
      backgroundColor: isError ? ColorResources.getRed(context) : Colors.green,
      content: Text(message!),
      action: onPress != null
          ? SnackBarAction(label: label!, onPressed: onPress as void Function())
          : null,
    ));
  } else {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: isError ? ColorResources.getRed(context) : Colors.green,
      content: Text(message!),
      action: onPress != null
          ? SnackBarAction(label: label!, onPressed: onPress as void Function())
          : null,
    ));
  }
  // if (onPress == null) {

  // } else {
  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //     backgroundColor: isError ? ColorResources.getRed(context) : Colors.green,
  //     content: Text(message),
  //     action: onPress != null
  //         ? SnackBarAction(label: label, onPressed: onPress)
  //         : null,
  //   ));
  // }
}
