import 'dart:ui' as dartUI;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:soundpool/soundpool.dart';

class CustomImageProvider with ChangeNotifier {
  ObjectDetector? _objectDetector;
  List<AssetEntity>? _entities = [];
  List<AssetEntity>? get entities => _entities;

  Future<dartUI.Rect?> getRectFromInputImageAndDecodedImage(
    InputImage inputImage,
    dartUI.Image decodedImage,
  ) async {
    if (_objectDetector != null) {
      var objects = await _objectDetector!.processImage(inputImage);
      _objectDetector!.close();

      if (objects.isNotEmpty) {
        objects[0].labels.forEach((element) {});

        dartUI.Rect? rect = _getRect(objects[0], decodedImage);
        return rect;
      }
    }

    return null;
  }

  double _checkNumberIsGreaterThanOneOrlessThenZero(double number) {
    if (number > 1) {
      return 1.0;
    } else if (number < 0) {
      return 0.0;
    } else {
      return number;
    }
  }

  dartUI.Rect? _getRect(
    DetectedObject detectedObject,
    dartUI.Image decodedImage,
  ) {
    var height = decodedImage!.width;
    var width = decodedImage!.height;

    if (detectedObject != null) {
      final left = detectedObject!.boundingBox.left;

      final top = detectedObject!.boundingBox.top;

      final right = detectedObject!.boundingBox.right;

      final bottom = detectedObject!.boundingBox.bottom;

      if (decodedImage != null) {
        var l = _checkNumberIsGreaterThanOneOrlessThenZero(
            double.parse((left / height).toStringAsFixed(1)));

        var t = _checkNumberIsGreaterThanOneOrlessThenZero(
            double.parse((top / width).toStringAsFixed(1)));

        var r = _checkNumberIsGreaterThanOneOrlessThenZero(
            double.parse((right / height).toStringAsFixed(1)));

        var b = _checkNumberIsGreaterThanOneOrlessThenZero(
            double.parse((bottom / width).toStringAsFixed(1)));

        return Rect.fromLTRB(l, t, r, b);
      }
    }
    return null;
  }

  void createObjectDetector(ObjectDetector objectDetector) {
    _objectDetector = objectDetector;
    notifyListeners();
  }

  void setEntity(entities) {
    _entities = entities;

    notifyListeners();
  }
}
