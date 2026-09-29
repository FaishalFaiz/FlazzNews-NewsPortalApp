import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flazz_news/controllers/news_controller.dart';
import 'package:flazz_news/routes/app_pages.dart';
import 'package:flazz_news/utils/app_colors.dart';
import 'package:flazz_news/widgets/news_card.dart';
import 'package:flazz_news/widgets/category_chip.dart';
import 'package:flazz_news/widgets/loading_shimmer.dart';

class HomeView extends GetView<NewsController> {
  const HomeView({super.key});

  static const Map<String, String> categoryLabels = {
    'general': 'Semua',
    'business': 'Bisnis',
    'technology': 'Teknologi',
    'science': 'Sains',
    'entertainment': 'Hiburan',
    'sports': 'Olahraga',
    'health': 'Kesehatan',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        titleSpacing: 20,
        title: Row(
          children: [
            SvgPicture.asset(
              'assets/Logo.svg',
              width: 32,
              height: 32,
            ),
            const SizedBox(width: 10),
            Text(
              'Flazz News',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: AppColors.onSurface,
                letterSpacing: -0.2,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search_rounded,
              color: AppColors.onSurface,
              size: 26,
            ),
            onPressed: () => _showSearchDialog(context),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          // ── Category Tabs ───────────────────────────────────
          Container(
            height: 48,
            margin: const EdgeInsets.only(top: 4, bottom: 8),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: controller.categories.length,
              itemBuilder: (context, index) {
                final category = controller.categories[index];
                final label = categoryLabels[category] ?? category.capitalize ?? category;

                return Obx(
                  () => CategoryChip(
                    label: label,
                    isSelected: controller.selectedCategory == category,
                    onTap: () => controller.selectCategory(category),
                  ),
                );
              },
            ),
          ),

          // ── News Feed ───────────────────────────────────────
          Expanded(
            child: Obx(() {
              if (controller.isLoading) {
                return const LoadingShimmer();
              }

              if (controller.error.isNotEmpty) {
                return _buildErrorWidget();
              }

              if (controller.articles.isEmpty) {
                return _buildEmptyWidget();
              }

              final articles = controller.articles;
              final heroArticle = articles.first;
              final hasBreaking = articles.length >= 3;
              final breakingArticles = hasBreaking ? articles.sublist(1, 3) : [];
              final regularArticles = hasBreaking
                  ? articles.sublist(3)
                  : (articles.length > 1 ? articles.sublist(1) : []);

              return RefreshIndicator(
                color: AppColors.primary,
                backgroundColor: AppColors.surface,
                onRefresh: controller.refreshNews,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 1. Hero Card
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: HeroNewsCard(
                          article: heroArticle,
                          onTap: () => Get.toNamed(
                            Routes.NEWS_DETAIL,
                            arguments: heroArticle,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // 2. Kilas Cepat (Breaking) Section
                      if (breakingArticles.isNotEmpty) ...[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.bolt_rounded,
                                    color: AppColors.primary,
                                    size: 22,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    'Kilas Cepat (Breaking)',
                                    style: GoogleFonts.plusJakartaSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800,
                                      color: AppColors.onSurface,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'Semua kilas',
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          height: 124,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            itemCount: breakingArticles.length,
                            separatorBuilder: (context, index) => const SizedBox(width: 12),
                            itemBuilder: (context, index) {
                              final item = breakingArticles[index];
                              return BreakingNewsCard(
                                article: item,
                                onTap: () => Get.toNamed(
                                  Routes.NEWS_DETAIL,
                                  arguments: item,
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],

                      // 3. Berita Terkini Section
                      if (regularArticles.isNotEmpty) ...[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Berita Terkini',
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.onSurface,
                                ),
                              ),
                              Text(
                                'Terfilter untuk Indonesia & Global',
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          itemCount: regularArticles.length,
                          separatorBuilder: (context, index) => const Divider(
                            height: 20,
                            thickness: 1,
                            color: AppColors.outline,
                          ),
                          itemBuilder: (context, index) {
                            final article = regularArticles[index];

                            // Insert a spotlight card at index 3 if available
                            if (index == 3 && article.urlToImage != null) {
                              return SpotlightNewsCard(
                                article: article,
                                onTap: () => Get.toNamed(
                                  Routes.NEWS_DETAIL,
                                  arguments: article,
                                ),
                              );
                            }

                            return CompactNewsCard(
                              article: article,
                              onTap: () => Get.toNamed(
                                Routes.NEWS_DETAIL,
                                arguments: article,
                              ),
                            );
                          },
                        ),
                      ],
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.error.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.wifi_off_rounded,
                size: 48,
                color: AppColors.error,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Gagal Memuat Berita',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: AppColors.onSurface,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Silakan periksa koneksi internet Anda lalu coba lagi',
              textAlign: TextAlign.center,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 14,
                color: AppColors.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: controller.refreshNews,
              icon: const Icon(Icons.refresh_rounded),
              label: const Text('Coba Lagi'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: AppColors.surfaceVariant,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.newspaper_rounded,
              size: 48,
              color: AppColors.textHint,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Tidak ada berita ditemukan',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.onSurface,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Silakan coba kategori atau kata kunci lain',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 14,
              color: AppColors.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  void _showSearchDialog(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          top: 24,
          left: 20,
          right: 20,
        ),
        decoration: const BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Cari Berita',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: AppColors.onSurface,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close_rounded),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              controller: searchController,
              autofocus: true,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 15,
                color: AppColors.onSurface,
              ),
              decoration: InputDecoration(
                hintText: 'Ketik kata kunci berita...',
                hintStyle: GoogleFonts.plusJakartaSans(
                  color: AppColors.textHint,
                ),
                prefixIcon: const Icon(
                  Icons.search_rounded,
                  color: AppColors.primary,
                ),
                filled: true,
                fillColor: AppColors.surfaceVariant,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
              onSubmitted: (value) {
                if (value.trim().isNotEmpty) {
                  controller.searchNews(value.trim());
                  Navigator.pop(context);
                }
              },
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  if (searchController.text.trim().isNotEmpty) {
                    controller.searchNews(searchController.text.trim());
                    Navigator.pop(context);
                  }
                },
                child: const Text('Cari'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}