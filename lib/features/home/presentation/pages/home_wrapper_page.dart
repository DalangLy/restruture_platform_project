import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/routes/default_routes/router.gr.dart';
import '../../../../core/blocs/network_checker/network_checker_bloc.dart';
import '../widgets/animated_menu_icon.dart';
import '../widgets/main_end_drawer.dart';
import '../widgets/main_navigation.dart';
import '../widgets/main_scaffold.dart';

class HomeWrapperPage extends StatefulWidget {
  const HomeWrapperPage({Key? key}) : super(key: key);

  @override
  State<HomeWrapperPage> createState() => _HomeWrapperPageState();
}

class _HomeWrapperPageState extends State<HomeWrapperPage> {
  final List<MainNavigationItem> _navigationItems = const <MainNavigationItem>[
    MainNavigationItem(title: 'Dashboard', iconData: Icons.speed, route: DashboardRoute(), path: '',),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocListener<NetworkCheckerBloc, NetworkCheckerState>(
      listener: (context, state) {
        if(state is IsOnline){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Online using ${state.type}'),),);
        }
        else{
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Offline'),),);
        }
      },
      child: MainScaffold(
        appBar: AppBar(
          leading: _toggleDrawerButton(),
          backgroundColor: Colors.grey,
        ),
        drawer: MainNavigation(
          navigationItems: _navigationItems,
        ),
        endDrawer: const MainEndDrawer(),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: AutoRouter(),
          ),
        ),
      ),
    );
  }

  Widget _toggleDrawerButton(){
    return Builder(
        builder: (context) {
          return AnimatedMenuIcon(
            onPressed: () => MainScaffold.of(context).toggleDrawer(),
          );
        }
    );
  }
}