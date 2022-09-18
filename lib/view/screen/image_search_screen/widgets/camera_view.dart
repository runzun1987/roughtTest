import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sixvalley_ecommerce/utill/app_constants.dart';

import 'package:image_picker/image_picker.dart';

import 'package:photo_manager/photo_manager.dart';
import 'package:provider/provider.dart';

import 'package:ripple_animation/ripple_animation.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:soundpool/soundpool.dart';

import '../../../../main.dart';
import '../../../../provider/image_provider.dart';
import '../../crop_screen/crop_screen.dart';
import '../image_search_screen.dart';
import 'ImageItem/image_item_widget.dart';
import 'custom_bottom_sheet/custom_bottom_sheet.dart';
import 'scan_animation/scan_animation.dart';

enum ScreenMode { liveFeed, gallery }

class CameraView extends StatefulWidget {
  const CameraView({
    this.initialDirection = CameraLensDirection.back,
    super.key,
  });

  final CameraLensDirection initialDirection;

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;

  int _cameraIndex = 0;
  CameraController? _controller;
  double zoomLevel = 0.0, minZoomLevel = 0.0, maxZoomLevel = 0.0;
  bool _changingCameraLens = false;

  bool _isTop = false;
  static double _panelHeightOpen = 900;

  static double _fabHeight = 0;
  ImagePicker? _imagePicker;
  bool _isMiddle = false;
  PanelController? _panelController;

  Soundpool? _pool;
  int? _soundId;

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

  @override
  void initState() {
    super.initState();

    _imagePicker = ImagePicker();
    _panelController = PanelController();

    if (cameras.any(
      (element) =>
          element.lensDirection == widget.initialDirection &&
          element.sensorOrientation == 90,
    )) {
      _cameraIndex = cameras.indexOf(
        cameras.firstWhere((element) =>
            element.lensDirection == widget.initialDirection &&
            element.sensorOrientation == 90),
      );
    } else {
      _cameraIndex = cameras.indexOf(
        cameras.firstWhere(
          (element) => element.lensDirection == widget.initialDirection,
        ),
      );
    }
    _animationController =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);

    _animationController!.forward();
    _animationController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animateScanAnimation(true);
      } else if (status == AnimationStatus.dismissed) {
        animateScanAnimation(false);
      }
    });

    _startSoundPool();
    _startLiveFeed();
  }

  @override
  void dispose() async {
    _animationController!.dispose();
    if (_pool != null) {
      _pool!.dispose();
    }

    _stopLiveFeed();
    super.dispose();
  }

  void _playShutterSound() async {
    if (_pool != null) {
      int streamId = await _pool!.play(_soundId!);
      print(streamId);
    }
  }

  //10 . GET IMAGE -------------------------------------------------------------------
  Future _getImage(getImageFile type, {assetImage}) async {
    File XFileToFileConverter(XFile xfile) {
      return File(xfile.path);
    }

    File? _selectedFile;

    if (type == getImageFile.customGallery) {
      _selectedFile = assetImage;
    } else if (type == getImageFile.customCamera) {
      if (_controller!.value.isTakingPicture) {
        // A capture is already pending, do nothing.
        return null;
      }

      var capturedImage = await _controller!.takePicture();
      _playShutterSound();

      _selectedFile = XFileToFileConverter(capturedImage);
    } else {
      ImageSource source;
      if (type == getImageFile.camera) {
        source = ImageSource.camera;
      } else {
        source = ImageSource.gallery;
      }

      final pickedFile = await _imagePicker?.pickImage(source: source);

      if (pickedFile != null) {
        _selectedFile = XFileToFileConverter(pickedFile);
      }
    }

    if (_selectedFile != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => CropScreen(
            selectedImage: _selectedFile!,
            cameraIndex: _cameraIndex,
          ),
        ),
      );
    }
  }

  //1. ANIMATION ---------------------------------------------------------------------------------------------------

  void animateScanAnimation(bool reverse) {
    if (reverse) {
      _animationController!.reverse(from: 1.0);
    } else {
      _animationController!.forward(from: 0.0);
    }
  }

  //2. START LIVE FEED ------------------------------------------------------------------------------------

  Future _startSoundPool() async {
    if (_pool != null) {
      return;
    }
    Soundpool pool = Soundpool(streamType: StreamType.notification);
    _pool = pool;

    int soundId = await rootBundle
        .load("assets/sounds/camera_shutter.mp3")
        .then((ByteData soundData) {
      return pool.load(soundData);
    });
    _soundId = soundId;
    setState(() {});
  }

  Future _startLiveFeed() async {
    final camera = cameras[_cameraIndex];
    _controller = CameraController(
      camera,
      ResolutionPreset.high,
      enableAudio: true,
    );

    final PermissionState ps = await PhotoManager.requestPermissionExtend();

    // if (!ps.hasAccess) {
    //   return;
    // }

    _controller?.initialize().then((_) {
      if (!mounted) {
        return;
      }

      _controller?.getMinZoomLevel().then((value) {
        zoomLevel = value;
        minZoomLevel = value;
      });
      _controller?.getMaxZoomLevel().then((value) {
        maxZoomLevel = value;
      });

      setState(() {});
    });
  }

  //3. STOP LIVE FEED ------------------------------------------------------------------------------------------

  Future _stopLiveFeed() async {
    await _controller?.dispose();
    _controller = null;
  }

  //5. BUILD ------------------------------------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    if (_controller?.value.isInitialized == false) {
      return Container();
    }
    _panelHeightOpen = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.black,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              //1. CAMERA PREVIEW --------------------------------------------------------------------------------------------
              Transform.scale(
                scale: 1.0,
                child: Center(
                  child: Stack(
                    children: [
                      _changingCameraLens
                          ? const Center(
                              child: Text('Changing camera lens'),
                            )
                          : _controller != null
                              ? CameraPreview(_controller!)
                              : Container(),
                    ],
                  ),
                ),
              ),

              //3. SCAN ANIMATION -----------------------------------------------------------------------------------------
              ImageScannerAnimation(
                false,
                355,
                animation: _animationController,
              ),
              //4. POSTION CONTAINER ----------------------------------------------------------------------------------
              Positioned(
                bottom: 200,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  // color: Colors.green,
                  child: Column(
                    children: [
                      //4.a FLASH LIGHT --------------------------------------------------------------------------------------
                      // const Icon(
                      //   Icons.flashlight_on,
                      //   color: Colors.white,
                      //   size: 20,
                      // ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      // //4.B FLASH LIGHT TEXT -------------------------------------------------------------------------
                      // const Text(
                      //   'Turn on flashlight',
                      //   style: TextStyle(color: Colors.white),
                      // ),
                      const SizedBox(
                        height: 50,
                      ),
                      //4.C SEARCH FOR IMAGE TEXT ------------------------------------------------------------------------
                      const Text(
                        'Search for an item by taking a photo.',
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 50,
                      ),

                      //4.D ROW OF CLICK BOTTOM AND ALBUM -----------------------------------------------------------------------------
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              //4.D A ALBUM  ------------------------------------------------------------------------------
                              InkWell(
                                onTap: () async {
                                  _getImage(getImageFile.gallery);
                                },
                                child: Container(
                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.red[500]!,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(
                                          20,
                                        ),
                                      ),
                                      gradient: const LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                          Colors.orange,
                                          Colors.deepOrange,
                                        ],
                                      ),
                                    ),
                                    child: Consumer<CustomImageProvider>(
                                        builder: (context, imgProvider, child) {
                                      if (imgProvider.entities!.length > 0) {
                                        return ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            20.0,
                                          ),
                                          child: Container(
                                            child: ImageItemWidget(
                                              key: ValueKey<int>(1),
                                              entity: imgProvider.entities![0],
                                              option: const ThumbnailOption(
                                                size: ThumbnailSize.square(
                                                  200,
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      } else {
                                        return Container();
                                      }
                                    })),
                              ),
                              const SizedBox(
                                height: 5,
                              ),

                              //4.D. B ALBUM TEXT ------------------------------------------------------------------------------------
                              Container(
                                child: Text(
                                  "Albums",
                                  style: TextStyle(
                                    color: Colors.white,
                                    // fontSize: 40,
                                    // foreground: Paint()
                                    //   ..style = PaintingStyle.stroke
                                    //   ..strokeWidth = 6
                                    //   ..color = Colors.blue[700]!,
                                  ),
                                ),
                              )
                            ],
                          ),

                          //4 .E CAMERA BOTTON ----------------------------------------------------------------------------------------
                          RippleAnimation(
                            color: Colors.white,
                            ripplesCount: 3,
                            minRadius: 50,
                            repeat: true,
                            child: InkWell(
                              onTap: () async {
                                _getImage(getImageFile.customCamera);
                              },
                              child: Container(
                                width: 70,
                                height: 70,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      colors: [
                                        Colors.orange,
                                        Colors.deepOrange,
                                      ],
                                    )),
                                child: Icon(
                                  Platform.isIOS
                                      ? Icons.camera_alt
                                      : Icons.camera_alt,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 70,
                            width: 70,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              CustomButtomSheet.showSlidingPanel(
                _getImage,
                false,
                false,
                _isTop,
                _isMiddle,
                _panelHeightOpen,
                setFabHeight,
                context,
                panelController: _panelController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
