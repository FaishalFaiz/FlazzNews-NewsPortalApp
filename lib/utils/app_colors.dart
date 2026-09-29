import 'package:flutter/material.dart';

class AppColors {
  // ── Primary Brand ─────────────────────────────────────────
  static const Color primary = Color(0xFFFF7A00); // Vibrant orange accent
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color primaryContainer = Color(0xFFFFF3E6); // Soft warm peach
  static const Color onPrimaryContainer = Color(0xFF803800);
  static const Color inversePrimary = Color(0xFFFFB68B);

  // ── Secondary ─────────────────────────────────────────────
  static const Color secondary = Color(0xFF121212); // Pitch black
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color secondaryContainer = Color(0xFFE5E2E1);
  static const Color onSecondaryContainer = Color(0xFF656464);

  // ── Surface & Background ──────────────────────────────────
  static const Color background = Color(0xFFFFFFFF);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceVariant = Color(0xFFF6F7F9); // Containers, inputs, chips
  static const Color surfaceContainerLowest = Color(0xFFFFFFFF);
  static const Color surfaceContainerLow = Color(0xFFF6F3F2);
  static const Color surfaceContainer = Color(0xFFF0EDED);
  static const Color surfaceContainerHigh = Color(0xFFEAE7E7);
  static const Color surfaceContainerHighest = Color(0xFFE5E2E1);

  // ── On-Surface Text & Icons ───────────────────────────────
  static const Color onSurface = Color(0xFF121212); // Primary titles, bold headlines
  static const Color onSurfaceVariant = Color(0xFF6B7280); // Muted timestamps, bylines
  static const Color onBackground = Color(0xFF121212);

  // ── Outline & Borders ─────────────────────────────────────
  static const Color outline = Color(0xFFE5E7EB); // Subtle card/chip borders
  static const Color outlineVariant = Color(0xFFE0C0AF);

  // ── Error ─────────────────────────────────────────────────
  static const Color error = Color(0xFFBA1A1A);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color errorContainer = Color(0xFFFFDAD6);
  static const Color onErrorContainer = Color(0xFF93000A);

  // ── Legacy & UI aliases ───────────────────────────────────
  static const Color textPrimary = Color(0xFF121212);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textHint = Color(0xFF9CA3AF);
  static const Color divider = Color(0xFFE5E7EB);
  static const Color cardShadow = Color(0x0D121212); // 5% ink black

  // ── Gradient stops ────────────────────────────────────────
  static const Color gradientStart = Color(0xFF994700);
  static const Color gradientEnd = Color(0xFFFF7A00);
}