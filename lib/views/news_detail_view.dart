import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';
import 'package:flazz_news/models/news_article.dart';
import 'package:flazz_news/utils/app_colors.dart';

class NewsDetailView extends StatelessWidget {
  const NewsDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final NewsArticle article = Get.arguments as NewsArticle;

    String timeStr = '';
    if (article.publishedAt != null) {
      try {
        timeStr = timeago.format(DateTime.parse(article.publishedAt!));
      } catch (_) {
        timeStr = '';
      }
    }

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              // ── Header Image ──────────────────────────────────
              SliverToBoxAdapter(
                child: Stack(
                  children: [
                    // Main Image
                    if (article.urlToImage != null)
                      CachedNetworkImage(
                        imageUrl: article.urlToImage!,
                        height: 380,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(
                          height: 380,
                          color: AppColors.surfaceVariant,
                          child: const Center(
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        ),
                        errorWidget: (context, url, error) => Container(
                          height: 380,
                          color: AppColors.surfaceVariant,
                          child: const Icon(
                            Icons.image_not_supported_outlined,
                            size: 48,
                            color: AppColors.textHint,
                          ),
                        ),
                      )
                    else
                      Container(
                        height: 380,
                        color: AppColors.surfaceVariant,
                        child: const Icon(
                          Icons.newspaper_rounded,
                          size: 64,
                          color: AppColors.textHint,
                        ),
                      ),

                    // Gradient fade at bottom of image
                    Positioned.fill(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withValues(alpha: 0.4),
                              Colors.transparent,
                              Colors.black.withValues(alpha: 0.2),
                              AppColors.surface.withValues(alpha: 0.9),
                              AppColors.surface,
                            ],
                            stops: const [0.0, 0.35, 0.7, 0.95, 1.0],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // ── Article Body Content ──────────────────────────
              SliverToBoxAdapter(
                child: Transform.translate(
                  offset: const Offset(0, -20),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Source badge & time
                        Row(
                          children: [
                            if (article.source?.name != null) ...[
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.surfaceContainer,
                                  borderRadius: BorderRadius.circular(999),
                                ),
                                child: Text(
                                  article.source!.name!,
                                  style: GoogleFonts.plusJakartaSans(
                                    color: AppColors.onSurface,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                            if (timeStr.isNotEmpty) ...[
                              Text(
                                '   •   ',
                                style: GoogleFonts.plusJakartaSans(
                                  color: AppColors.onSurfaceVariant,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                timeStr,
                                style: GoogleFonts.plusJakartaSans(
                                  color: AppColors.onSurfaceVariant,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ],
                        ),
                        const SizedBox(height: 18),

                        // Title
                        if (article.title != null) ...[
                          Text(
                            article.title!,
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              color: AppColors.onSurface,
                              height: 1.35,
                              letterSpacing: -0.3,
                            ),
                          ),
                          const SizedBox(height: 18),
                        ],

                        // Description
                        if (article.description != null) ...[
                          Text(
                            article.description!,
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 15,
                              color: AppColors.onSurfaceVariant,
                              height: 1.6,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 24),
                        ],

                        const Divider(
                          color: AppColors.outline,
                          thickness: 1,
                        ),
                        const SizedBox(height: 20),

                        // Content section
                        if (article.content != null &&
                            article.content!.trim().isNotEmpty) ...[
                          Text(
                            'Content',
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: AppColors.onSurface,
                            ),
                          ),
                          const SizedBox(height: 12),
                          _buildFormattedContent(article.content!),
                          const SizedBox(height: 32),
                        ],

                        // Extra space for button
                        const SizedBox(height: 80),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          // ── Floating Action Bar (Top overlay) ───────────────
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCircleButton(
                    icon: Icons.arrow_back_rounded,
                    onTap: () => Get.back(),
                  ),
                  Row(
                    children: [
                      _buildCircleButton(
                        icon: Icons.share_rounded,
                        onTap: () => _shareArticle(article),
                      ),
                      const SizedBox(width: 10),
                      _buildMoreMenu(context, article),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // ── Bottom Fixed CTA Button ─────────────────────────
          if (article.url != null)
            Positioned(
              left: 20,
              right: 20,
              bottom: 24,
              child: SafeArea(
                child: SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton(
                    onPressed: () => _openInBrowser(article.url!),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      shape: const StadiumBorder(),
                      elevation: 4,
                      shadowColor: AppColors.primary.withValues(alpha: 0.4),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Read Full Article',
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.open_in_new_rounded,
                          size: 18,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildCircleButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.45),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(icon, color: Colors.white, size: 20),
        onPressed: onTap,
      ),
    );
  }

  Widget _buildMoreMenu(BuildContext context, NewsArticle article) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.45),
        shape: BoxShape.circle,
      ),
      child: PopupMenuButton<String>(
        padding: EdgeInsets.zero,
        icon: const Icon(
          Icons.more_vert_rounded,
          color: Colors.white,
          size: 20,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        onSelected: (value) {
          switch (value) {
            case 'copy_link':
              _copyLink(article.url);
              break;
            case 'open_browser':
              if (article.url != null) _openInBrowser(article.url!);
              break;
          }
        },
        itemBuilder: (context) => [
          PopupMenuItem(
            value: 'copy_link',
            child: Row(
              children: [
                const Icon(Icons.copy_rounded, size: 20),
                const SizedBox(width: 10),
                Text(
                  'Salin Tautan',
                  style: GoogleFonts.plusJakartaSans(fontSize: 14),
                ),
              ],
            ),
          ),
          PopupMenuItem(
            value: 'open_browser',
            child: Row(
              children: [
                const Icon(Icons.open_in_browser_rounded, size: 20),
                const SizedBox(width: 10),
                Text(
                  'Buka di Browser',
                  style: GoogleFonts.plusJakartaSans(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormattedContent(String content) {
    // NewsAPI content often ends with "[+1234 chars]"
    final charsRegex = RegExp(r'(\[\+\d+\s+chars\])');
    final match = charsRegex.firstMatch(content);

    if (match != null) {
      final mainText = content.substring(0, match.start);
      final charsText = match.group(0)!;

      return RichText(
        text: TextSpan(
          style: GoogleFonts.plusJakartaSans(
            fontSize: 15,
            color: AppColors.onSurface,
            height: 1.6,
          ),
          children: [
            TextSpan(text: mainText),
            TextSpan(
              text: charsText,
              style: GoogleFonts.plusJakartaSans(
                color: AppColors.onPrimaryContainer,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      );
    }

    return Text(
      content,
      style: GoogleFonts.plusJakartaSans(
        fontSize: 15,
        color: AppColors.onSurface,
        height: 1.6,
      ),
    );
  }

  void _shareArticle(NewsArticle article) {
    if (article.url != null) {
      // ignore: deprecated_member_use
      Share.share(
        '${article.title ?? 'Flazz News'}\n\n${article.url!}',
        subject: article.title,
      );
    }
  }

  void _copyLink(String? url) {
    if (url != null) {
      Clipboard.setData(ClipboardData(text: url));
      Get.snackbar(
        'Berhasil',
        'Tautan berhasil disalin ke papan klip',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.onSurface,
        colorText: Colors.white,
        margin: const EdgeInsets.all(16),
        borderRadius: 12,
        duration: const Duration(seconds: 2),
      );
    }
  }

  void _openInBrowser(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      Get.snackbar(
        'Gagal',
        'Tidak dapat membuka tautan ini',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.error,
        colorText: Colors.white,
        margin: const EdgeInsets.all(16),
        borderRadius: 12,
      );
    }
  }
}