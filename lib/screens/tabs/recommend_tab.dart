import 'package:flutter/material.dart';
import '../widgets/character_box.dart';

class RecommendTab extends StatelessWidget {
  const RecommendTab({super.key});

  @override
  Widget build(BuildContext context) {
    final sections = [
      {
        'title': '실시간 TOP 10',
        'characters': [
          {'name': '캐릭터1', 'situation': '좋은 하루!', 'hashtag': '#top'},
          {'name': '캐릭터2', 'situation': '신난다', 'hashtag': '#fun'},
        ],
      },
      {
        'title': '오늘만큼은 나도 알파메일',
        'characters': [
          {'name': '캐릭터3', 'situation': '도전한다!', 'hashtag': '#challenge'},
        ],
      },
      {
        'title': '이제 막 주목받기 시작한 캐릭터들',
        'characters': [
          {'name': '캐릭터4', 'situation': '힘내자', 'hashtag': '#hope'},
        ],
      },
    ];

    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 12),
      children: sections.map((section) {
        final chars = section['characters'] as List<dynamic>;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  section['title'] as String,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 140,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: chars.length,
                  itemBuilder: (context, index) {
                    final c = chars[index] as Map<String, dynamic>;
                    return Container(
                      margin: const EdgeInsets.only(left: 16),
                      width: 200,
                      child: CharacterBox(
                        name: c['name'] as String,
                        situation: c['situation'] as String,
                        hashtag: c['hashtag'] as String,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
