import 'package:flutter/material.dart';
import 'package:jobhub/features/auth/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 32, 24, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Row(
                  children: [
                    Icon(Icons.work, color: Colors.blue, size: 30.0),
                    SizedBox(width: 12),
                    Text(
                      "JobHub",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32),

                Text(
                  "Welcome back",
                  style: TextStyle(
                    fontSize: 24,
                    letterSpacing: 0.7,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),

                Text(
                  "Sign in to continue to your account",
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),

                SizedBox(height: 32),

                LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}