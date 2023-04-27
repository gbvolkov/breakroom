// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_image_slideshow/flutter_image_slideshow.dart' as imgs;

class ImageSlider extends StatefulWidget {
  const ImageSlider({
    Key? key,
    this.width,
    this.height,
    this.images,
    required this.emptyListImage,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<String>? images;
  final String emptyListImage;

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  List<String> _imageUrls = <String>[];

  @override
  void initState() {
    _imageUrls = widget.images ?? [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Image> images = [];

    if (_imageUrls.isEmpty) {
      images.add(Image.network(widget.emptyListImage, fit: BoxFit.contain));
    } else {
      for (int i = 0; i < _imageUrls.length; i++) {
        images.add(Image.network(_imageUrls[i], fit: BoxFit.contain));
      }
    }

    return imgs.ImageSlideshow(
        width: widget.width ?? 100,
        height: widget.height ?? 100,
        initialPage: 0,
        indicatorColor: FlutterFlowTheme.of(context).alternate,
        children: images);
  }
}
