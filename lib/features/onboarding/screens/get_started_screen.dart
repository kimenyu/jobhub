import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jobhub/core/router/app_router.dart';

class GetStartedScreen extends StatefulWidget {
  final int currentPage, totalPages;
  const GetStartedScreen({
    super.key,
    required this.currentPage,
    required this.totalPages,
  });

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  String? _selected; // 'jobseeker' or 'hiring'

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Dots at top
          Row(
            children: List.generate(
              widget.totalPages,
              (i) => Container(
                margin: const EdgeInsets.only(right: 6),
                width: i == widget.currentPage ? 16 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: i == widget.currentPage
                      ? Colors.blue
                      : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),
          const Text(
            'Get Started',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Choose how you want to use the platform',
            style: TextStyle(fontSize: 15, color: Colors.grey),
          ),
          const SizedBox(height: 32),
          _RoleCard(
            icon: Icons.work,
            title: "I'm looking for a job",
            subtitle: "Find and apply to opportunities",
            selected: _selected == 'jobseeker',
            onTap: () => setState(() => _selected = 'jobseeker'),
          ),
          const SizedBox(height: 16),
          _RoleCard(
            icon: Icons.person_outline,
            title: "I'm hiring",
            subtitle: "Post jobs and find talent",
            selected: _selected == 'hiring',
            onTap: () => setState(() => _selected = 'hiring'),
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: _selected != null
                    ? Colors.blue
                    : Colors.grey.shade200,
                foregroundColor: _selected != null ? Colors.white : Colors.grey,
                minimumSize: const Size(double.infinity, 52),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: _selected != null
                  ? () {
                      context.push(AppRoutes.login);
                    }
                  : null,
              child: const Text("Continue", style: TextStyle(fontSize: 16)),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: GestureDetector(
              onTap: () {
                context.push(AppRoutes.login);
              },
              child: const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: "Already have an account? "),
                    TextSpan(
                      text: "Sign In",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RoleCard extends StatelessWidget {
  final IconData icon;
  final String title, subtitle;
  final bool selected;
  final VoidCallback onTap;

  const _RoleCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected ? Colors.blue : Colors.grey.shade200,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.grey.shade600),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
            Radio<bool>(
              value: true,
              groupValue: selected,
              onChanged: (_) => onTap(),
              activeColor: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
