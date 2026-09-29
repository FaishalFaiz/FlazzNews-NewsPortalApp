import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flazz_news/utils/app_colors.dart';
import 'package:flazz_news/models/news_article.dart';
import 'package:flazz_news/widgets/category_chip.dart';

void main() {
  test('AppColors matches M3 redesign specification', () {
    expect(AppColors.primary, const Color(0xFFFF7A00));
    expect(AppColors.onPrimary, const Color(0xFFFFFFFF));
    expect(AppColors.secondary, const Color(0xFF121212));
    expect(AppColors.surface, const Color(0xFFFFFFFF));
    expect(AppColors.gradientStart, const Color(0xFF994700));
    expect(AppColors.gradientEnd, const Color(0xFFFF7A00));
  });

  test('NewsArticle parses JSON with author properly', () {
    final json = {
      'title': 'Test Headline',
      'author': 'John Doe',
      'description': 'Test summary',
      'url': 'https://example.com/news',
      'urlToImage': 'https://example.com/image.jpg',
      'publishedAt': '2026-09-28T09:00:00Z',
      'content': 'Test full content',
      'source': {'id': 'test-source', 'name': 'Test Source'},
    };

    final article = NewsArticle.fromJson(json);
    expect(article.title, 'Test Headline');
    expect(article.author, 'John Doe');
    expect(article.source?.name, 'Test Source');
    expect(article.url, 'https://example.com/news');
  });

  testWidgets('CategoryChip renders correctly when selected and unselected',
      (WidgetTester tester) async {
    bool tapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CategoryChip(
            label: 'Teknologi',
            isSelected: true,
            onTap: () {
              tapped = true;
            },
          ),
        ),
      ),
    );

    expect(find.text('Teknologi'), findsOneWidget);

    await tester.tap(find.text('Teknologi'));
    expect(tapped, isTrue);
  });
}
