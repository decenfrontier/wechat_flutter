import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final String image;
  final VoidCallback onPressed;
  final double width;
  final double height;

  UserAvatar(
      {Key? key,
      required this.image,
      required this.onPressed,
      this.width = 30.0,
      this.height = 30.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: EdgeInsets.only(top: 4.0, right: 5.0, left: 5.0),
        constraints: BoxConstraints(minWidth: 0.0, minHeight: 0.0),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: FadeInImage.assetNetwork(
              placeholder: 'assets/images/ic_public_account.png',
              //预览图
              fit: BoxFit.fitWidth,
              image: image,
              width: width,
              height: height,
            )),
        onPressed: onPressed);
  }
}
