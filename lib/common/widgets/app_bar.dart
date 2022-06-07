import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wechat_flutter/common/style/colors.dart';
import 'package:wechat_flutter/common/style/icons.dart';

enum ActionItems { GROUP_CHAT, ADD_FRIEND, QR_SCAN, PAYMENT, HELP }

AppBar BuildAppBar(String title) {
  return AppBar(
    centerTitle: true,
    elevation: 0,
    toolbarHeight: 36,
    shadowColor: Colors.grey.shade300,
    backgroundColor: Colors.grey.shade300,
    title: Text(
      title,
      style: TextStyle(color: Colors.black, fontSize: 16),
    ),
    actions: [
      Container(
        padding: EdgeInsets.only(right: 16.0),
        child: IconButton(
          icon: Icon(
            ICons.SEARCH,
            color: Color(AppColors.APPBarTextColor),
          ),
          onPressed: () {
            print('点击了搜索按钮');
          },
        ),
      ),
      SizedBox(
        width: 10,
      ),
      Theme(
        data: ThemeData(cardColor: Color(AppColors.APPCardColor)),
        child: PopupMenuButton(
          icon: Icon(
            ICons.ADD,
            color: Color(AppColors.APPBarTextColor),
          ),
          itemBuilder: (BuildContext context) {
            return <PopupMenuItem<ActionItems>>[
              PopupMenuItem(
                child: _buildPopupMenuItem(
                    Icon(
                      ICons.GROUP_CHAT,
                      size: 22.0,
                      color: Color(AppColors.AppBarPopupMenuTextColor),
                    ),
                    '发起群聊'),
                value: ActionItems.GROUP_CHAT,
              ),
              PopupMenuItem(
                child: _buildPopupMenuItem(
                    Icon(ICons.ADD_FRIEND,
                        size: 22.0,
                        color: Color(AppColors.AppBarPopupMenuTextColor)),
                    '添加朋友'),
                value: ActionItems.ADD_FRIEND,
              ),
              PopupMenuItem(
                child: _buildPopupMenuItem(
                    Icon(ICons.QR_SCAN,
                        size: 22.0,
                        color: Color(AppColors.AppBarPopupMenuTextColor)),
                    '扫一扫'),
                value: ActionItems.QR_SCAN,
              ),
              PopupMenuItem(
                child: _buildPopupMenuItem(
                    Icon(ICons.PAYMENT,
                        size: 22.0,
                        color: Color(AppColors.AppBarPopupMenuTextColor)),
                    '收付款'),
                value: ActionItems.PAYMENT,
              ),
              PopupMenuItem(
                child: _buildPopupMenuItem(
                    Icon(ICons.HELP,
                        size: 22.0,
                        color: Color(AppColors.AppBarPopupMenuTextColor)),
                    '帮助与反馈'),
                value: ActionItems.HELP,
              )
            ];
          },
          onSelected: (ActionItems selected) {
            if (selected == ActionItems.GROUP_CHAT) {
              print('点击了发起群聊');
            } else if (selected == ActionItems.ADD_FRIEND) {
              print('点击了添加朋友');
            } else if (selected == ActionItems.QR_SCAN) {
              print('点击了扫一扫');
            } else if (selected == ActionItems.PAYMENT) {
              print('点击了收付款');
            } else if (selected == ActionItems.HELP) {
              print('点击了帮助与反馈');
            }
            print(selected);
          },
        ),
      ),
      SizedBox(
        width: 10,
      ),
    ],
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarColor: Colors.grey.shade300,
    ),
  );
}

_buildPopupMenuItem(Widget icon, String title) {
  return Row(
    children: <Widget>[
      Container(
        padding: EdgeInsets.only(right: 12),
        child: icon,
      ),
      Text(
        title,
        style: TextStyle(color: Color(AppColors.AppBarPopupMenuTextColor)),
      )
    ],
  );
}
