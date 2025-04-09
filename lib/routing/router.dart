import 'package:go_router/go_router.dart';
import 'package:hospital_portal/auth/auth_wrapper.dart';
import 'package:hospital_portal/auth/login_screen.dart';
import 'package:hospital_portal/routing/routes.dart';
import 'package:hospital_portal/screens/home_page.dart';



GoRouter router() =>
    GoRouter(initialLocation: Routes.authWrapper.path, routes: [

      GoRoute(
          path: Routes.authLogin.path,
          builder: (context, state) {
            return LoginScreen();
          }),
      GoRoute(
          path: Routes.home.path,
          builder: (context, state) {
            return HomePage();
          }),
      GoRoute(
          path: Routes.authWrapper.path,
          builder: (context, state) {
            return AuthWrapper();
          }),

    ]);