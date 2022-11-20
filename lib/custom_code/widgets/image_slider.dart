// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
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
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<String>? images;

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  List<String> _imageUrls = <String>[];

  @override
  void initState() {
    _imageUrls = widget.images ??
        [
          "https://www.maxpixel.net/static/photo/2x/Portrait-Old-Human-Man-Painting-Dark-Creepy-6888019.jpg",
          "https://upload.wikimedia.org/wikipedia/commons/9/91/41_year_old_man_with_partial_gray_hair.jpg"
        ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Image> images = [];

    for (int i = 0; i < _imageUrls.length; i++) {
      images.add(Image.network(_imageUrls[i], fit: BoxFit.cover));
    }

    return imgs.ImageSlideshow(
        width: widget.width ?? 100,
        height: widget.height ?? 100,
        initialPage: 0,
        indicatorColor: FlutterFlowTheme.of(context).alternate,
        children: images);
  }
}
