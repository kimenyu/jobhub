import 'package:flutter/material.dart';
import 'package:jobhub/core/theme/app_theme.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      width: double.infinity,
      height: screenHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hero image (replace with your actual asset)
          SizedBox(
            height: screenHeight * 0.45,
            width: double.infinity,
            child: Image.asset(
              'assets/images/onboarding1.png',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Find your dream job",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Discover thousands of opportunities from top companies around the world",
                  style: TextStyle(fontSize: 14.0, color: AppColors.textSecondary),
                ),
                const SizedBox(height: 16),
                // Pagination dots
                Row(
                  children: List.generate(3, (i) => Container(
                    margin: const EdgeInsets.only(right: 6),
                    width: i == 0 ? 16 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: i == 0 ? Colors.blue : Colors.grey.shade300,
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
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text("Next", style: TextStyle(fontSize: 16)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}