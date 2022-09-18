import 'dart:async';
import 'dart:io';
import 'dart:ui' as dartUi;

import 'package:amplify_core/amplify_core.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:camera/camera.dart';
import 'package:crop_image/crop_image.dart';
import 'package:edge_detection/edge_detection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:path_provider/path_provider.dart';

import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'main_crop_screen/main_crop_screen.dart';
import '../../../provider/image_provider.dart';
import '../../../provider/search_provider.dart';
import '../../../utill/app_constants.dart';
import '../image_search_screen/widgets/camera_view.dart';
import '../image_search_screen/widgets/custom_bottom_sheet/custom_bottom_sheet.dart';

class CropScreen extends StatefulWidget {
  CropScreen({
    required this.selectedImage,
    required this.cameraIndex,
    super.key,
  });

  int cameraIndex;
  File selectedImage;

  @override
  State<CropScreen> createState() => _CropScreenState();
}

class _CropScreenState extends State<CropScreen> {
  File? _fileImage;
  CropController? _controller;
  Timer? searchOnStoppedCropping;
  bool _isLoading = false;
  PanelController? _panelController;

  //1..........................
  static double _fabHeight = 0;
  bool _isTop = false;
  bool _isMiddle = false;
  static double _panelHeightOpen = 900;

  @override
  void initState() {
    super.initState();

    setState(() {
      _fileImage = widget.selectedImage;
      _panelController = PanelController();
    });

    _processPickedFile(widget.selectedImage, widget.selectedImage);
  }

  Future<void> getImage(imageFile) async {
    try {
      final UploadFileResult result = await Amplify.Storage.uploadFile(
          local: imageFile,
          key: DateTime.now().toString() + ".png",
          onProgress: (progress) {
            print('Fraction completed: ${progress.getFractionCompleted()}');
          });
      String final_image_uploaded_url = AppConstants.S3_URL + result.key;
      print('Successfully uploaded file: ${result.key}');

      await Provider.of<SearchProvider>(context, listen: false)
          .searchImage(final_image_uploaded_url, context);

      _panelController!.animatePanelToPosition(0.6,
          duration: Duration(
            milliseconds: 200,
          ),
          curve: Curves.easeIn);
    } on StorageException catch (e) {
      print('Error uploading file: $e');
    }

    if (!mounted) return;
  }

  void setFabHeight(newFabHeight, isTop, isMiddle) {
    setState(
      () {
        if (newFabHeight != null) {
          _fabHeight = newFabHeight;
        }

        if (isTop != null) {
          if (isTop) {
            _isTop = isTop;
          } else {
            _isTop = isTop;
          }
        }

        if (isMiddle != null) {
          if (isMiddle) {
            _isMiddle = isMiddle;
          } else {
            _isMiddle = isMiddle;
          }
        }
      },
    );
  }

  Future _processPickedFile(File? pickedFile, File file) async {
    Future<dartUi.Image> FileToDecodedImage(File file) async {
      dartUi.Image decodedImage =
          await decodeImageFromList(file.readAsBytesSync());
      return decodedImage;
    }

    final path = pickedFile?.path;

    if (path == null) {
      return;
    }

    final inputImage = InputImage.fromFilePath(path);

    dartUi.Image decodedImage = await FileToDecodedImage(file);
    dartUi.Rect? rect =
        // ignore: use_build_context_synchronously
        await Provider.of<CustomImageProvider>(context, listen: false)
            .getRectFromInputImageAndDecodedImage(inputImage, decodedImage);

    var _rect = const Rect.fromLTRB(
      0.1,
      0.1,
      0.9,
      0.9,
    );

    if (rect != null) {
      _rect = rect;
    }

    setState(() {
      _controller = CropController(
        defaultCrop: _rect,
      );
    });

    _cropAndSearch();
  }

  @override
  void dispose() async {
    // _stopLiveFeed();

    super.dispose();
  }

  Future<File> writeToFile(ByteData data) async {
    final buffer = data.buffer;
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    var filePath =
        tempPath + '/file_01.tmp'; // file_01.tmp is dump file, can be anything
    return new File(filePath).writeAsBytes(
        buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  }

  // 2. compress file and get file.
  Future<File> testCompressAndGetFile(File file, String targetPath) async {
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    var filePath = tempPath + targetPath;

    var result = await FlutterImageCompress.compressAndGetFile(
      file.path,
      filePath,
      quality: 45,
      // rotate: 180,
    );

    print(file.lengthSync());
    print(result!.lengthSync());

    return result;
  }

  void _cropAndSearch() async {
    setState(() {
      _isLoading = true;
    });
    Timer(Duration(seconds: 1), () async {
      dartUi.Image image =
          await _controller!.croppedBitmap(quality: FilterQuality.low);

      final pngBytes =
          await image.toByteData(format: dartUi.ImageByteFormat.png);

      File croppedFile = await writeToFile(pngBytes!);

      File compressFile =
          await testCompressAndGetFile(croppedFile, "/target.jpg");

      await getImage(compressFile);

      setState(() {
        _isLoading = false;
      });
    });
  }

  _onRectChangeHandler(Rect rect) {
    const duration = Duration(
      milliseconds: 800,
    );
    if (searchOnStoppedCropping != null) {
      setState(() => searchOnStoppedCropping!.cancel());
    }
    setState(
      () => searchOnStoppedCropping = Timer(
        duration,
        () => _cropAndSearch(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _panelHeightOpen = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) => CameraView(),
          ),
        );
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: Container(
            color: Colors.black,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Transform.scale(
                  scale: 1.0,
                  child: Center(
                    child: _controller != null
                        ? Stack(
                            children: [
                              CustomCropImage(
                                controller: _controller,
                                image: Image.file(_fileImage!),
                                onCrop: _onRectChangeHandler,
                              ),
                              CustomButtomSheet.showSlidingPanel(
                                getImage,
                                true,
                                _isLoading,
                                _isTop,
                                _isMiddle,
                                _panelHeightOpen,
                                setFabHeight,
                                context,
                                panelController: _panelController,
                              ),
                            ],
                          )
                        : Stack(children: [
                            Center(
                              child: Image.file(
                                _fileImage!,
                                color: Colors.white.withOpacity(0.5),
                                colorBlendMode: BlendMode.modulate,
                              ),
                            ),
                            // const Positioned.fill(
                            //   child: Align(
                            //     alignment: Alignment.bottomCenter,
                            //     child: CircularProgressIndicator(),
                            //   ),
                            // )
                          ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
