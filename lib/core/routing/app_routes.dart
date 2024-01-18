import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomePage = '/homePage';
  static const kLogin = '/loginView';
  static const kRegister = '/registerView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
      ),
      GoRoute(
        path: kHomePage,
      ),
      GoRoute(
        path: kLogin,
      ),
      GoRoute(
        path: kRegister,
      ),
    ],
  );
}