import 'package:flutter/material.dart';
// import 'package:flutteretc/api/model.dart';
import 'dart:math';
import 'package:flutter/material.dart';

class HomeDetailsToolTipBannerWidget extends StatelessWidget {
  final List<String> textList;

  HomeDetailsToolTipBannerWidget({required this.textList});

  @override
  Widget build(BuildContext context) {
    final random = Random();
    final randomIndex = random.nextInt(textList.length);
    final randomText = textList[randomIndex].split('\n');

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        width: 360,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 60.0),
              child: Text(
                randomText[0],
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ),
            SizedBox(height: 2.0),
            Padding(
              padding: EdgeInsets.only(left: 60.0),
              child: Text(
                randomText[1],
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
