import 'package:flutter/material.dart';

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
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: FadeInImage.assetNetwork(
              placeholder: 'assets/images/icon.png',  // https://s1.ax1x.com/2022/05/19/Oq3yDg.jpg
              //预览图
              fit: BoxFit.fitWidth,
              image: image,
              width: width,
              height: height,
            )),
        onPressed: onPressed);
  }
}
