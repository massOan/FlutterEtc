import 'package:flutter/material.dart';
class FooterUseTermsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('개인정보 처리방침'),
      ),
      body: Center(
        child: Text('개인정보 처리방침 내용'),
      ),
    );
  }
}