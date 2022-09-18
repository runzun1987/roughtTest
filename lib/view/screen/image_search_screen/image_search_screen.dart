import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as pathPck;
import 'package:photo_manager/photo_manager.dart';
import 'package:provider/provider.dart';
import 'package:soundpool/soundpool.dart';

import '../../../provider/image_provider.dart';
import 'widgets/camera_view.dart';

//1. BUILD --------------------------------------------------------------------------------
//2. PROCESS IMAGE -----------------------------------------------------------------------------
//3. INITIALIZE DETECTOR  ------------------------------------------------------------------
//4. GET MODAL ----------------------------------------------------------------

enum getImageFile { gallery, camera, customCamera, customGallery }

class ImageSearchScreen extends StatefulWidget {
  const ImageSearchScreen({super.key});

  @override
  State<ImageSearchScreen> createState() => _ImageSearchScreenState();
}

class _ImageSearchScreenState extends State<ImageSearchScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });

    Future.delayed(Duration.zero, () {
      _initializeDetector(DetectionMode.single, context);
    });

    ;
  }

  _asyncMethod() async {
    /// Customize your own filter options.
    final FilterOptionGroup _filterOptionGroup = FilterOptionGroup(
      imageOption: const FilterOption(
        sizeConstraint: SizeConstraint(ignoreSize: true),
      ),
    );

    // Obtain assets using the path entity.
    final List<AssetPathEntity> paths = await PhotoManager.getAssetPathList(
      onlyAll: false,
      filterOption: _filterOptionGroup,
      type: RequestType.image,
    );

    // Return if not paths found.
    if (paths.isNotEmpty) {
      final List<AssetEntity> entities = await paths.first.getAssetListPaged(
        page: 0,
        size: 100,
      );

      // AssetEntity entity = entities[0];
      // ignore: use_build_context_synchronously
      Provider.of<CustomImageProvider>(context, listen: false)
          .setEntity(entities);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  //1. BUILD --------------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    Size screen_size = MediaQuery.of(context).size;
    return const Scaffold(
      body: SafeArea(
        child: CameraView(),
      ),
    );
  }

  //3. INITIALIZE DETECTOR  ------------------------------------------------------------------

  void _initializeDetector(DetectionMode mode, BuildContext context) async {
    print('Set detector in mode: $mode');

    final path = 'assets/ml/object_labeler.tflite';
    final modelPath = await _getModel(path);

    final options = LocalObjectDetectorOptions(
      mode: mode,
      modelPath: modelPath,
      classifyObjects: true,
      multipleObjects: true,
    );

    // ignore: use_build_context_synchronously
    Provider.of<CustomImageProvider>(context, listen: false)
        .createObjectDetector(ObjectDetector(options: options));
  }

  //4. GET MODAL ----------------------------------------------------------------

  Future<String> _getModel(String assetPath) async {
    if (Platform.isAndroid) {
      return 'flutter_assets/$assetPath';
    }
    final path = '${(await getApplicationSupportDirectory()).path}/$assetPath';
    await Directory(pathPck.dirname(path)).create(recursive: true);
    final file = File(path);
    if (!await file.exists()) {
      final byteData = await rootBundle.load(assetPath);
      await file.writeAsBytes(byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    }
    return file.path;
  }
}
