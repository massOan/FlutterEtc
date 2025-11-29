import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutteretc/home/common/popup/popup_example.dart';
// import 'package:flutteretc/api/model/lifestyle_menu.dart';
// import 'package:flutteretc/lifestyle/spam/spam_lifestyle_screen.dart';
// import 'package:flutteretc/lifestyle/type_1/type_1_lifestyle_screen.dart';
// import 'package:flutteretc/lifestyle/type_2/type_2_lifestyle_screen.dart';
import '../../api/model/lifestyle_menu.dart';
import 'hash_tag.dart';

class HomeDetailsLifeStyleWidget extends StatelessWidget {
  final LifestyleMenu lifeStyleMenu;
  const HomeDetailsLifeStyleWidget({Key? key, required this.lifeStyleMenu})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(lifeStyleMenu);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 15, 15, 15),
          child: Text(lifeStyleMenu.homeTitle,
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontFamily: 'Pretendard',
                fontSize: 18,
                fontWeight: FontWeight.w700,
              )),
        ),
        SizedBox(
          height: 330,
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: lifeStyleMenu.lifestyles.length,
            controller: PageController(viewportFraction: 0.89),
            itemBuilder: (context, index) {
              List<String> hashTagList = [];
              if (lifeStyleMenu
                      .lifestyles[index].lifestyleHashtag?.isNotEmpty ??
                  false) {
                hashTagList = lifeStyleMenu.lifestyles[index].lifestyleHashtag!
                    .split(",");
              }

              return Container(
                padding: const EdgeInsets.only(right: 15),
                color: Colors.white,
                child: Column(children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0x14000000),
                              blurRadius: 28,
                              offset: Offset(3, 6))
                        ]),
                    child: GestureDetector(
                      onTap: () {
                        var item = lifeStyleMenu.lifestyles[index];
                        print("Spam Life Style Page ${item.lifestyleType}");
                        print("Spam Life Style Key ${item.lifestyleKey}");

                        Widget? router;
                        if (item.lifestyleType == '1') {
                          // router = LifestyleTypeOnePage(
                          //     detailNumber: item.lifestyleKey.toString());
                        } else if (item.lifestyleType == '2') {
                          // router = LifestyleTypeTwoPage(
                          //     detailNumber: item.lifestyleKey.toString());
                        } else if (item.lifestyleType == '3') {
                          // router = SpamLifestylePage(
                          //     detailNumber: item.lifestyleKey.toString());
                        }

                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => router!),
                        // );
                      },
                      child: Container(
                        width: 385,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.transparent)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AspectRatio(
                              aspectRatio: 16 / 9,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12)),
                                  image: DecorationImage(
                                      image: NetworkImage(lifeStyleMenu
                                          .lifestyles[index].lifestyleImage),
                                      fit: BoxFit.cover),
                                  border: Border.all(color: Colors.transparent),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      lifeStyleMenu
                                          .lifestyles[index].lifestyleTitle,
                                      style: const TextStyle(
                                          fontFamily: 'Pretendard',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600)),
                                  Text(
                                    lifeStyleMenu
                                        .lifestyles[index].lifestyleComment,
                                    style: const TextStyle(
                                        fontFamily: 'Pretendard',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(height: 10),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(children: [
                                      for (String tag in hashTagList) ...[
                                        HashTag(tagText: tag.trim()),
                                        const SizedBox(width: 3)
                                      ]
                                    ] // 이제 각 해시태그를 출력합니다.
                                        ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
              );
            },
          ),
        ),
      ],
    );
  }
}
