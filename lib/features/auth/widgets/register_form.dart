import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jobhub/core/router/app_router.dart';
import 'package:jobhub/features/auth/widgets/role_card.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  String? _selected;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      context.go(AppRoutes.home);
    }
  }

  InputDecoration _fieldDecoration({
    required String hint,
    Widget? suffix,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.blue, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.red, width: 2),
      ),
      suffixIcon: suffix,
    );
  }

  Widget _fieldLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //  Full Name 
          _fieldLabel("Full Name"),
          TextFormField(
            controller: nameController,
            keyboardType: TextInputType.name,
            cursorColor: Colors.blue,
            decoration: _fieldDecoration(hint: "John Doe"),
            validator: (value) {
              if (value == null || value.isEmpty) return "Name is required";
              return null;
            },
          ),

          const SizedBox(height: 20),

          //  Email
          _fieldLabel("Email"),
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            cursorColor: Colors.blue,
            decoration: _fieldDecoration(hint: "Enter your email"),
            validator: (value) {
              if (value == null || value.isEmpty) return "Email is required";
              if (!value.contains('@')) return "Enter a valid email";
              return null;
            },
          ),

          const SizedBox(height: 20),

          //  Password 
          _fieldLabel("Password"),
          TextFormField(
            controller: passwordController,
            obscureText: obscurePassword,
            cursorColor: Colors.blue,
            decoration: _fieldDecoration(
              hint: "Enter your password",
              suffix: IconButton(
                icon: Icon(
                  obscurePassword ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey.shade500,
                  size: 20,
                ),
                onPressed: () =>
                    setState(() => obscurePassword = !obscurePassword),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) return "Password is required";
              if (value.length < 6) return "Minimum 6 characters";
              return null;
            },
          ),

          const SizedBox(height: 20),

          //  Confirm Password 
          _fieldLabel("Confirm Password"),
          TextFormField(
            controller: confirmPasswordController,
            obscureText: obscureConfirmPassword,
            cursorColor: Colors.blue,
            decoration: _fieldDecoration(
              hint: "Confirm your password",
              suffix: IconButton(
                icon: Icon(
                  obscureConfirmPassword
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: Colors.grey.shade500,
                  size: 20,
                ),
                onPressed: () => setState(
                    () => obscureConfirmPassword = !obscureConfirmPassword),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please confirm your password";
              }
              if (value != passwordController.text) {
                return "Passwords do not match";
              }
              return null;
            },
          ),

          const SizedBox(height: 24),

          //  Role selection 
          const Text(
            "I want to",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                child: RoleCard(
                  title: "I'm looking for a job",
                  subtitle: "Find and apply to opportunities",
                  icon: Icons.work_outline,
                  selected: _selected == 'jobseeker',
                  onTap: () => setState(() => _selected = 'jobseeker'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: RoleCard(
                  title: "I'm hiring",
                  subtitle: "Post jobs and find talent",
                  icon: Icons.person_search_outlined,
                  selected: _selected == 'hiring',
                  onTap: () => setState(() => _selected = 'hiring'),
                ),
              ),
            ],
          ),

          const SizedBox(height: 28),

          //  Create Account button 
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _submit,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(double.infinity, 52),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Create Account",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          const SizedBox(height: 24),

          //  Divider 
          Row(
            children: [
              Expanded(child: Divider(thickness: 1, color: Colors.grey.shade200)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Text(
                  "or",
                  style: TextStyle(color: Colors.grey.shade400, fontSize: 13),
                ),
              ),
              Expanded(child: Divider(thickness: 1, color: Colors.grey.shade200)),
            ],
          ),

          const SizedBox(height: 16),

          //  Google button 
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 52),
                side: BorderSide(color: Colors.grey.shade300),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: Image.asset('assets/images/googlelogo.png', height: 20),
              label: const Text(
                "Continue with Google",
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          //  Sign in link 
          Center(
            child: GestureDetector(
              onTap: () => context.push(AppRoutes.login),
              child: Text.rich(
                TextSpan(
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                  children: const [
                    TextSpan(text: "Already have an account?  "),
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

          const SizedBox(height: 8),
        ],
      ),
    );
  }
}