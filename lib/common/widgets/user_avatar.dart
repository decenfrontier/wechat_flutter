import 'package:flutter/material.dart';

import 'network_img.dart';

class UserAvatar extends StatelessWidget {
  final String image;
  final VoidCallback onPressed;
  final EdgeInsets padding;
  final double width;
  final double height;

  UserAvatar(
      {Key? key,
      required this.image,
      required this.onPressed,
      required this.padding,
      this.width = 30.0,
      this.height = 30.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: padding,
        constraints: BoxConstraints(minWidth: 0.0, minHeight: 0.0),
        child: CacheImg(image, width: width, height: height),
        onPressed: onPressed);
  }
}
