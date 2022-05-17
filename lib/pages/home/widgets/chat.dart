import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ws_chat_flutter/common/widgets/app_bar.dart';
import 'package:ws_chat_flutter/common/widgets/bubble.dart';

import '../controller.dart';

class ChatPage extends GetView<HomeController> {
  ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: HeaderBar.BuildAppBar("群聊"),
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
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          itemCount: _data.length,
          itemBuilder: (context, index) {
            final model = _data.elementAt(index);
            return BubbleWidget(
              avatar: model.avatar,
              text: model.text,
              direction: model.isMyself
                  ? TextDirection.rtl
                  : TextDirection.ltr, // 那么这个时候默认值就没意义了
            );
          }),
    );
  }

  /// 最下方的输入框部分
  Widget inputView() {
    final outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(16),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          // 左侧文字输入框
          Expanded(
            child: TextField(
              maxLines: null,
              cursorColor: Colors.black,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                enabledBorder: outlineInputBorder,
                focusedBorder: outlineInputBorder,
              ),
            ),
          ),
          const SizedBox(width: 12),
          // 右侧发送文字的按钮
          ElevatedButton(
            onPressed: () {},
            child: const Text('发送'),
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
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

  final List<Model> _data = [
    Model(
      avatar: 'https://cdn.jsdelivr.net/gh/mocaraka/assets/temp/375.jpg',
      text: '1',
      isMyself: false, // bool默认值也是false，可以不用填，但对代码来说，有规律是好的
    ),
    Model(
      avatar: 'https://cdn.jsdelivr.net/gh/mocaraka/assets/temp/375.jpg',
      text: '2',
      isMyself: false, // bool默认值也是false，可以不用填，但对代码来说，有规律是好的
    ),
    Model(
      avatar: 'https://cdn.jsdelivr.net/gh/mocaraka/assets/temp/375.jpg',
      text: '3',
      isMyself: false, // bool默认值也是false，可以不用填，但对代码来说，有规律是好的
    ),
    Model(
      avatar: 'https://cdn.jsdelivr.net/gh/mocaraka/assets/temp/56.jpg',
      text: 'a',
      isMyself: true, // bool默认值也是false，可以不用填，但对代码来说，有规律是好的
    ),
    Model(
      avatar: 'https://cdn.jsdelivr.net/gh/mocaraka/assets/temp/375.jpg',
      text: '4',
      isMyself: false, // bool默认值也是false，可以不用填，但对代码来说，有规律是好的
    ),
  ];
}

class Model {
  final String avatar;
  final String text;
  final bool isMyself;

  Model({
    required this.avatar,
    required this.text,
    required this.isMyself,
  });
}
