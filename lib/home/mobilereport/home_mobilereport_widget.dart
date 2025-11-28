import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const Color subtitleColor = Color(0xFF66707A);

class HomeMobileReportWidget extends StatelessWidget {
  const HomeMobileReportWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                  color: Color(0x14000000),
                  blurRadius: 28,
                  offset: Offset(3, 6))
            ]),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "통신 생활에 도움이 되는\n리포트를 확인하세요",
              style: TextStyle(
                  fontFamily: 'Pretendard',
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 15),
            _ReportItem(
              imagePath: "assets/images/dummy_image.png",
              subtitle: "스팸관리",
              description: "스팸을 차단하여 휴대폰을 안전하게\n관리해 보세요",
            ),
            SizedBox(height: 15),
            _ReportItem(
              imagePath: "assets/images/dummy_image.png",
              subtitle: "통화연결음",
              description: "최애 가수의 노래를 통화연결음으로\n설정해 보세요",
            ),
            SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}

class _ReportItem extends StatelessWidget {
  final String imagePath;
  final String subtitle;
  final String description;

  const _ReportItem({
    super.key,
    required this.imagePath,
    required this.subtitle,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset(imagePath),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subtitle,
                style: const TextStyle(
                    fontSize: 12,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600,
                    color: subtitleColor),
              ),
              Text(
                description,
                style: const TextStyle(
                    fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
