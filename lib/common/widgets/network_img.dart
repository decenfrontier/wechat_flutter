import 'package:flutter/material.dart';

import "package:cached_network_image/cached_network_image.dart";

class CacheImg extends StatelessWidget {
  final String image;
  final double width;
  final double height;
  final String placeholderImg;
  CacheImg(
    this.image, {
    this.width = 50,
    this.height = 50,
    this.placeholderImg = "assets/images/icon.png",
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: CachedNetworkImage(
          imageUrl: image,
          // placeholder: (context, url) => Image.asset(placeholderImg),
          placeholder: (context, url) => const CircularProgressIndicator(),
          fit: BoxFit.fitWidth,
          width: width,
          height: height,
        ));
  }
}
