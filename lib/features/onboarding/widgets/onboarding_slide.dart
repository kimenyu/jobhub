import 'package:flutter/material.dart';

class OnboardingSlide extends StatelessWidget {
  final String imagePath, title, subtitle;
  final int currentPage, totalPages;
  final VoidCallback onNext;

  const OnboardingSlide({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.currentPage,
    required this.totalPages,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: screenHeight * 0.45,
          width: double.infinity,
          child: Image.asset(imagePath, fit: BoxFit.cover),
        ),
        const SizedBox(height: 32),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(subtitle,
                  style: const TextStyle(
                      fontSize: 14, color: Colors.grey)),
              const SizedBox(height: 16),
              // Dots
              Row(
                children: List.generate(totalPages, (i) => Container(
                  margin: const EdgeInsets.only(right: 6),
                  width: i == currentPage ? 16 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: i == currentPage ? Colors.blue : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(4),
                  ),
                )),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 52),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: onNext,
                  child: const Text("Next", style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}