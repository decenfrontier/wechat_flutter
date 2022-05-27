import 'package:flutter/material.dart';

class FadeInNetworkImg extends StatelessWidget {
  final String image;
  final double width;
  final double height;
  final String placeholderImg;
  FadeInNetworkImg(
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
        child: FadeInImage.assetNetwork(
          placeholder: placeholderImg,
          image: image,
          fit: BoxFit.fitWidth,
          width: width,
          height: height,
        ));
  }
}
