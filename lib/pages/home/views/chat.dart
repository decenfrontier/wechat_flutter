import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ws_chat_flutter/common/style/icons.dart';
import 'package:ws_chat_flutter/common/widgets/app_bar.dart';
import 'package:ws_chat_flutter/common/widgets/chat_content.dart';
import 'package:ws_chat_flutter/common/mock/data.dart';

import '../controller.dart';

class ChatPage extends GetView<HomeController> {
  ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: HeaderBar.BuildAppBar("群 聊"),
      body: bodyView(),
    );
  }

  Widget bodyView() {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        // 点击其他地方的时候，让输入框失去焦点
        // Focus.of(context).requestFocus(FocusNode());
      },
      child: SafeArea(
        child: Column(
          children: [
            // 上半部分：聊天内容显示
            chatView(),
            // 下半部分：输入框
            inputView(),
          ],
        ),
      ),
    );
  }

  /// 聊天内容显示
  Widget chatView() {
    return Expanded(
      // 到了最后，再改成ListView.builder，现在代码少点，UI逻辑会更清楚
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 2),
          itemCount: Data.mockchatMessageList.length,
          itemBuilder: (context, index) {
            final chatMsg = Data.mockchatMessageList[index];
            var senderId = chatMsg.senderId;
            var groupId = chatMsg.groupId;
            var groupInfo = Data.mockGroupInfoMap[groupId]!;
            return ChatContentView(
              isSelf: senderId == 2,
              text: chatMsg.content,
              avatar: groupInfo["avatarUrl"]!,
              username: groupInfo["aliasName"]!,
              type: chatMsg.type,
            );
          }),
    );
  }

  /// 最下方的输入框部分
  Widget inputView() {
    return Container(
      padding: EdgeInsets.only(
          top: ScreenUtil().setHeight(2.0),
          bottom: ScreenUtil().setHeight(2.0),
          left: ScreenUtil().setWidth(5.0),
          right: ScreenUtil().setWidth(5.0)),
      color: Color(0xFFF7F7F7),
      child: Row(
        children: [
          Container(
            width: ScreenUtil().setWidth(40.0),
            margin: EdgeInsets.only(right: ScreenUtil().setWidth(10.0)),
            child: IconButton(
                icon: Icon(ICons.VOICE),
                onPressed: () {
                  print('切换到语音');
                }),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(15.0),
                bottom: ScreenUtil().setHeight(15.0)),
            height: ScreenUtil().setHeight(40.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                color: Colors.white),
            child: TextField(
              // controller: controller,
              decoration: InputDecoration.collapsed(hintText: null),
              maxLines: 1,
              autocorrect: true,
              autofocus: false,
              textAlign: TextAlign.start,
              style: TextStyle(color: Colors.black),
              cursorColor: Colors.green,
              // onChanged: (text) {
              //   setState(() {
              //       hasText = text.length > 0 ?  true : false;
              //   });
              //   print('change=================== $text');
              // },
              // onSubmitted:_handleSubmitted,
              enabled: true, //是否禁用
            ),
          )),
          Container(
            width: ScreenUtil().setWidth(40.0),
            child: IconButton(
                icon: Icon(ICons.FACES), //发送按钮图标
                onPressed: () {
                  print('打开表情面板');
                }),
          ),
          Container(
            width: ScreenUtil().setWidth(40.0),
            // margin: EdgeInsets.only(right: ScreenUtil().setWidth(20.0)),
            child: IconButton(
                //发送按钮或者+按钮
                icon: Icon(Icons.send), //发送按钮图标
                onPressed: () {
                  // if(!hasText){
                  //   print('打开功能面板');
                  // }else{
                  //   _handleSubmitted(controller.text);
                  // }
                }),
          )
        ],
      ),
    );
  }

  // Future<void> _onSend() async {
  //   final text = _controller.text;
  //   // 现在我们需要变成builder，把数据抽出来
  //   // TODO: 这里要发送到后端，是个Future，异步
  //   final model = Model(
  //     // 头像去本地存储：比如share_pref，get_storage等去拿直链
  //     // 这里我就写死
  //     avatar: 'https://cdn.jsdelivr.net/gh/mocaraka/assets/temp/56.jpg',
  //     text: text,
  //     isMyself: true,
  //   );

  //   setState(() {
  //     _data.add(model);
  //   });

  //   _controller.clear();
  // }

}
