
import 'package:flutter/material.dart';

/// 聊天气泡
class BubbleWidget extends StatelessWidget {
  const BubbleWidget({
    Key? key,
    required this.avatar,
    required this.text,
    required this.direction,
  }) : super(key: key);

  final String avatar;
  final String text;

  /// 文字方向：ltr: left to right，也就是别人说的话
  /// rtl：你自己发出的消息
  final TextDirection direction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        textDirection: direction,
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage(avatar),
            child: const SizedBox(
              width: 48,
              height: 48,
            ),
          ),
          const SizedBox(width: 12),
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: Colors.grey[500],
                borderRadius: BorderRadius.circular(32),
              ),
              child: SelectableText(text),
            ),
          ),
        ],
      ),
    );
  }
}
