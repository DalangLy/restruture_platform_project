import 'package:auto_route/auto_route.dart';
import '../../../features/home/presentation/pages/home_wrapper_page.dart';
import '../../../features/auth/presentation/pages/login_page.dart';
import '../../../features/auth/presentation/pages/register_page.dart';
import '../main_router.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/auth',
      page: LoginPage,
    ),
    AutoRoute(
      path: '/register',
      page: RegisterPage,
    ),
    CustomRoute(
      transitionsBuilder: TransitionsBuilders.zoomIn,
      path: '/',
      page: HomeWrapperPage,
      initial: true,
      children: mainRouter,
    ),
  ],
)
class $AppRouter {}