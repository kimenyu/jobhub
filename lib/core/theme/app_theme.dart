import 'package:flutter/material.dart';

/// JobHub Design System Colors
///
/// Philosophy:
/// - Trust & professionalism → Deep Indigo/Blue
/// - Action & energy → Golden Yellow
/// - Growth & success → Green
/// - Hiring/employer energy → Purple/Blue accent
/// - Clean UI → Soft neutral grays
///
/// Optimized for:
/// onboarding, job cards, filters, status badges, dashboards

abstract class AppColors {
  // brand colors
  static const Color primary = Color(0xFF1F2A44); // Deep indigo (trust)
  static const Color primaryLight = Color(0xFF2F3B5F);
  static const Color primaryDark = Color(0xFF151B2E);

  static const Color accent = Color(0xFFFFC107); // Action yellow
  static const Color accentDark = Color(0xFFE0A800);
  static const Color accentLight = Color(0xFFFFF4CC);
// role colors
  static const Color jobSeeker = Color(0xFF2563EB); // Blue
  static const Color employer = Color(0xFF7C3AED); // Purple

  static const Color jobSeekerLight = Color(0xFFEAF2FF);
  static const Color employerLight = Color(0xFFF3ECFF);

  // semantic colors
  static const Color success = Color(0xFF16A34A);
  static const Color successLight = Color(0xFFE7F8EE);

  static const Color error = Color(0xFFEF4444);
  static const Color errorLight = Color(0xFFFFEDED);

  static const Color warning = Color(0xFFF97316);
  static const Color warningLight = Color(0xFFFFF1E8);

  static const Color info = Color(0xFF3B82F6);
  static const Color infoLight = Color(0xFFEAF3FF);

  // job status colors
  static const Color pending = Color(0xFFF59E0B);
  static const Color pendingLight = Color(0xFFFFF6E5);

  static const Color reviewed = Color(0xFF3B82F6);
  static const Color reviewedLight = Color(0xFFEAF3FF);

  static const Color rejected = Color(0xFF9CA3AF);
  static const Color rejectedLight = Color(0xFFF4F4F5);

  static const Color hired = Color(0xFF10B981);
  static const Color hiredLight = Color(0xFFE6FBF3);
// neutrals
  static const Color white = Color(0xFFFFFFFF);
  static const Color surface = Color(0xFFF8FAFC);
  static const Color surfaceSoft = Color(0xFFF1F5F9);
  static const Color surfaceVariant = Color(0xFFE2E8F0);

  static const Color border = Color(0xFFE5E7EB);
  static const Color borderDark = Color(0xFFD1D5DB);

//  text colors
  static const Color textPrimary = Color(0xFF111827);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textTertiary = Color(0xFF9CA3AF);
  static const Color textInverse = Color(0xFFFFFFFF);

  static const Color disabled = Color(0xFFD1D5DB);


  static const Color inputFill = Color(0xFFFFFFFF);
  static const Color inputBorder = Color(0xFFE5E7EB);
  static const Color inputFocus = Color(0xFF1F2A44);

  static const Color chipBackground = Color(0xFFF1F5F9);
  static const Color chipSelected = Color(0xFF1F2A44);
  static const Color chipTextSelected = Color(0xFFFFFFFF);

  static const Color divider = Color(0xFFE5E7EB);

  
  static const Color notificationUnreadDot = Color(0xFF2563EB);
  static const Color notificationBackground = Color(0xFFF0F7FF);

//  gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF1F2A44), Color(0xFF2F3B5F)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient accentGradient = LinearGradient(
    colors: [Color(0xFFFFC107), Color(0xFFFFA000)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient jobSeekerGradient = LinearGradient(
    colors: [Color(0xFF2563EB), Color(0xFF1D4ED8)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient employerGradient = LinearGradient(
    colors: [Color(0xFF7C3AED), Color(0xFF5B21B6)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient successGradient = LinearGradient(
    colors: [Color(0xFF16A34A), Color(0xFF15803D)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient splashGradient = LinearGradient(
    colors: [Color(0xFF1F2A44), Color(0xFF0F172A)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}