import 'package:flutter/material.dart';
import 'package:flutteretc/home/footer/FooterPrivacyPolicyScreen.dart';
import 'package:flutteretc/home/footer/FooterUsetermsScreen.dart';
import 'package:flutteretc/home/footer/FooterBusinessInformationScreen.dart';

class FooterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffE7EBEE), // Footer 배경색
      height: 78.0, // Footer 높이
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FooterUseTermsScreen()));
              },
              child: Text(
                '이용약관',
                style: TextStyle(color: const Color(0xff66707A)),
              ),
            ),
            SizedBox(width: 10), // 텍스트 사이 간격 조절을 위한 SizedBox
            Text(
              '|',
              style: TextStyle(color: const Color(0xff66707A)),
            ),
            SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FooterPrivacyPolicyScreen()));
              },
              child: Text(
                '개인정보처리방침',
                style: TextStyle(color: const Color(0xff66707A)),
              ),
            ),
            SizedBox(width: 10),
            Text(
              '|',
              style: TextStyle(color: const Color(0xff66707A)),
            ),
            SizedBox(width: 10), // 텍스트 사이 간격 조절을 위한 SizedBox
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            FooterBusinessInformationScreen()));
              },
              child: Text(
                '사업자정보',
                style: TextStyle(color: const Color(0xff66707A)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
