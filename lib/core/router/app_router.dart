import 'package:go_router/go_router.dart';
import 'package:jobhub/features/auth/screens/login_screen.dart';
import 'package:jobhub/features/auth/screens/register_screen.dart';
import 'package:jobhub/features/home/screens/home_screen.dart';
import 'package:jobhub/features/onboarding/screens/onboarding_screen.dart';

class AppRoutes {
  static const onboarding = '/onboarding';
  static const login = '/login';
  static const register = '/register';
  static const home = '/';
}

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.onboarding,
    routes: [
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.register,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}
