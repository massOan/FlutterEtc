import 'package:flutter/material.dart';
import 'package:flutteretc/home/HomeScreen.dart';
import 'package:flutteretc/api/model/greeting_menu.dart';

class HomeDetailsGreetingWidget extends StatelessWidget {
  final GreetingMenu greetingMenu;

  const HomeDetailsGreetingWidget({
    Key? key,
    required this.greetingMenu,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 카드가 하나도 없으면 아예 안 보이게
    if (greetingMenu.greetingMenuCats.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 상단 타이틀 + 전체보기
        Container(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Text(
                  greetingMenu.homeTitle,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Pretendard',
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
                child: Row(
                  children: [
                    const Text(
                      '전체 보기',
                      style: TextStyle(
                        fontFamily: 'Pretendard',
                        color: Color(0xff66707A),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Image.asset(
                      'assets/images/ic_arrow_right.png',
                      width: 16,
                      height: 16,
                      fit: BoxFit.fitHeight,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 5),
            ],
          ),
        ),

        // 카드 리스트
        SizedBox(
          width: double.infinity,
          height: 150,
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 20.0),
            scrollDirection: Axis.horizontal,
            itemCount: greetingMenu.greetingMenuCats.length,
            itemBuilder: (context, index) {
              final item = greetingMenu.greetingMenuCats[index];

              final String imageUrl = item.imageUrl;
              final ImageProvider imageProvider = imageUrl.startsWith('http')
                  ? NetworkImage(imageUrl)
                  : AssetImage(imageUrl) as ImageProvider;

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                child: Container(
                  width: 130,
                  margin: const EdgeInsets.only(right: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(12),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            width: 130,
                            height: 112,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        item.mainCateName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: 'Pretendard',
                          color: Color(0xff181a1b),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
