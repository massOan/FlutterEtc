import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeMainMenuWidget extends ConsumerWidget {
  const HomeMainMenuWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Drawer(
      child: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFE3F2FD),
                Color(0xFFFFFFFF),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 상단 앱바 영역 (아이콘 + 제목 + 닫기)
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: colorScheme.primary.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.menu,
                        size: 18,
                        color: colorScheme.primary,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '메뉴',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // 유저 요약 카드
                const _UserSummaryCard(),

                const SizedBox(height: 16),

                // 스크롤 가능한 메인 메뉴 영역
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // 주요 메뉴 섹션
                        _MenuSectionCard(
                          title: '내 서비스',
                          children: [
                            _MenuItem(
                              icon: Icons.card_giftcard_outlined,
                              title: '이달의 혜택',
                              subtitle: '나에게 맞는 맞춤 할인과 쿠폰 보기',
                              onTap: () {
                                Navigator.pop(context);
                                // TODO: 이달의 혜택 화면 이동
                              },
                            ),
                            _MenuItem(
                              icon: Icons.receipt_long_outlined,
                              title: '이용 요금 확인',
                              subtitle: '이번 달 예상 요금과 사용량 조회',
                              onTap: () {
                                Navigator.pop(context);
                                // TODO: 요금 확인 화면 이동
                              },
                            ),
                            _MenuItem(
                              icon: Icons.security_outlined,
                              title: '보안 / 데이터 관리',
                              subtitle: '데이터 사용 보호 및 안전 설정',
                              onTap: () {
                                Navigator.pop(context);
                                // TODO: 보안 설정 화면 이동
                              },
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),

                        // 고객지원 / 기타 섹션
                        _MenuSectionCard(
                          title: '지원 및 기타',
                          children: [
                            _MenuItem(
                              icon: Icons.support_agent_outlined,
                              title: '고객 센터',
                              subtitle: '문의 · 불편사항 남기기',
                              onTap: () {
                                Navigator.pop(context);
                                // TODO: 고객센터 화면 이동
                              },
                            ),
                            _MenuItem(
                              icon: Icons.apps_outlined,
                              title: '패밀리 앱 보기',
                              subtitle: '함께 쓰면 좋은 패밀리 앱',
                              onTap: () {
                                Navigator.pop(context);
                                // TODO: 패밀리 앱 소개 화면 이동
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                // 하단 설정/로그아웃 영역
                const _BottomSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// 상단 유저 요약 카드
class _UserSummaryCard extends StatelessWidget {
  const _UserSummaryCard();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: colorScheme.primary.withOpacity(0.08),
        ),
      ),
      child: Row(
        children: [
          // 아바타
          CircleAvatar(
            radius: 22,
            backgroundColor: colorScheme.primary.withOpacity(0.12),
            child: Text(
              '익',
              style: theme.textTheme.titleMedium?.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 12),

          // 이름 / 요약 정보
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '익준님',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '5G 요금제 사용 중 · 데이터 여유 있음',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: Colors.grey[600],
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          // 작은 상태 뱃지
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: colorScheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(999),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.check_circle,
                  size: 14,
                  color: colorScheme.primary,
                ),
                const SizedBox(width: 4),
                Text(
                  '정상 이용중',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// 섹션 카드 컨테이너
class _MenuSectionCard extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _MenuSectionCard({
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 섹션 제목
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            child: Text(
              title,
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 4),
          ...children,
        ],
      ),
    );
  }
}

/// 개별 메뉴 아이템
class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback onTap;

  const _MenuItem({
    required this.icon,
    required this.title,
    this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.08),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, size: 20, color: Colors.black87),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      subtitle!,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.grey[600],
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              Icons.chevron_right,
              size: 20,
              color: Colors.grey[500],
            ),
          ],
        ),
      ),
    );
  }
}

/// 하단 설정 / 로그아웃 영역
class _BottomSection extends StatelessWidget {
  const _BottomSection();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        const Divider(),
        Row(
          children: [
            Expanded(
              child: TextButton.icon(
                style: TextButton.styleFrom(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  // TODO: 설정 화면 이동
                },
                icon: const Icon(Icons.settings_outlined, size: 18),
                label: Text(
                  '설정',
                  style: theme.textTheme.bodyMedium,
                ),
              ),
            ),
            Expanded(
              child: TextButton.icon(
                style: TextButton.styleFrom(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  // TODO: 로그아웃 처리
                },
                icon: const Icon(Icons.logout, size: 18),
                label: Text(
                  '로그아웃',
                  style: theme.textTheme.bodyMedium,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
