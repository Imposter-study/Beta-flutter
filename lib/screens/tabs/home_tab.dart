import 'package:flutter/material.dart';
import '../widgets/item_card.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final ScrollController _scrollController = ScrollController();
  final List<Map<String, String>> _items = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadMoreItems();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 200 &&
          !_isLoading) {
        _loadMoreItems();
      }
    });
  }

  void _loadMoreItems() {
    setState(() => _isLoading = true);

    Future.delayed(const Duration(seconds: 1), () {
      final nextItems = List.generate(10, (index) {
        final num = _items.length + index + 1;
        return {
          'title': '아이템 $num',
          'description': '설명 $num',
          'hashtag': '#태그$num',
        };
      });

      setState(() {
        _items.addAll(nextItems);
        _isLoading = false;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 3 / 4,
      ),
      itemCount: _items.length + (_isLoading ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == _items.length) {
          return const Center(child: CircularProgressIndicator());
        }
        final item = _items[index];
        return ItemCard(
          title: item['title']!,
          description: item['description']!,
          hashtag: item['hashtag']!,
        );
      },
    );
  }
}
