import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HashTag extends StatelessWidget {
  const HashTag({super.key, required this.tagText});

  final String tagText;
  final Color hastTagColor = const Color(0xFFA8B3BD);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: hastTagColor, borderRadius: BorderRadius.circular(13)),
      padding: const EdgeInsets.symmetric(
          horizontal: 7.0, vertical: 2.0), // 양쪽(horizontal)에만 패딩을 줍니다.
      alignment: Alignment.center, // 텍스트를 가운데로 정렬합니다.
      child: Text(tagText,
          style: const TextStyle(
              fontFamily: 'Pretendard',
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500)),
    );
  }
}
