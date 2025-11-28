import 'package:flutter/material.dart';
class FooterPrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('서비스 이용약관'),
      ),
      body: Center(
        child: Text('서비스 이용약관 내용'),
      ),
    );
  }
}