import 'package:flutter/material.dart';
import 'package:jobhub/features/onboarding/screens/get_started_screen.dart';
import 'package:jobhub/features/onboarding/widgets/onboarding_slide.dart';
import 'package:jobhub/features/onboarding/widgets/welcome.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  void _nextPage() {
    if (_currentPage < 2) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _controller,
          onPageChanged: (index) => setState(() => _currentPage = index),
          children: [
            OnboardingSlide(
              imagePath: 'assets/images/onboarding1.png',
              title: 'Find your dream job',
              subtitle: 'Discover thousands of opportunities from top companies around the world',
              currentPage: _currentPage,
              totalPages: 3,
              onNext: _nextPage,
            ),
            OnboardingSlide(
              imagePath: 'assets/images/onboarding2.png',
              title: 'Post jobs effortlessly',
              subtitle: 'Reach talented candidates and build your dream team in minutes',
              currentPage: _currentPage,
              totalPages: 3,
              onNext: _nextPage,
            ),
            GetStartedScreen(currentPage: _currentPage, totalPages: 3),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}