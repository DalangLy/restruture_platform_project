import 'package:auto_route/auto_route.dart';
import '../../features/dashboard/presentation/pages/dashboard_page.dart';

const dashboardRoutes = AutoRoute(
  path: '',
  page: DashboardPage,
  initial: true,
);