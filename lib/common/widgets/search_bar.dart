import 'package:flutter/material.dart';
import 'package:wechat_flutter/common/style/colors.dart';

class SearchBar extends StatelessWidget {
  final GestureTapCallback onTap;
  final String text;
  final bool isBorder;

  SearchBar({
    Key? key,
    required this.text,
    required this.onTap,
    this.isBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: isBorder
              ? Border(
                  bottom: BorderSide(color: Colors.grey, width: 0.2),
                )
              : null,
        ),
        padding: EdgeInsets.symmetric(vertical: 15.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Icon(Icons.search, color: Color(AppColors.DesTextColor)),
            ),
            Text(
              text,
              style: TextStyle(color: Color(AppColors.DesTextColor)),
            )
          ],
        ),
      ),
      onTap: onTap ?? () {},
    );
  }
}
