import 'package:flutter/material.dart';

class ZetaAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<String> tabTitles;
  final TabController tabController;

  const ZetaAppBar({
    super.key,
    required this.tabTitles,
    required this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'ZETA',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
      ),
      centerTitle: false,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 1.0,
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            // 검색 기능 나중에 구현
          },
        ),
        IconButton(
          icon: const Icon(Icons.notifications_none),
          onPressed: () {
            // 알림 기능 나중에 구현
          },
        ),
      ],
      bottom: TabBar(
        controller: tabController,
        tabs: tabTitles.map((title) => Tab(text: title)).toList(),
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey,
        indicatorColor: Colors.indigo,
        indicatorWeight: 2,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
