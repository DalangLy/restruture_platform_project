import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class MainNavigation extends StatefulWidget {
  final List<MainNavigationItem> navigationItems;
  const MainNavigation({Key? key, required this.navigationItems,}) : super(key: key);

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  static const Color _drawerHeaderColor = Color(0xFF303C54);
  static const Color _drawerBackgroundColor = Color(0xFF3C4B64);
  static const Color _selectedColor = Color(0xFF3B4659);
  static const Color _expansionTileBackgroundColor = Color(0xFF303C50);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: _drawerBackgroundColor,
      child: NavigationBuilder(
        builder: (BuildContext context, String path) {
          return ListView(
            children: [
              const DrawerHeader(
                // decoration: BoxDecoration(
                //   color: _drawerHeaderColor,
                // ),
                child: Text('Flutter', style: TextStyle(color: Colors.white),),
                margin: EdgeInsets.all(0),
              ), ...widget.navigationItems.map((navigationItem){
                if(navigationItem.children.isNotEmpty){
                  return _expansionNavigationItem(mainNavigationItem: navigationItem, path: path);
                }
                else{
                  return _navigationItem(mainNavigationItem: navigationItem, path: path);
                }
              },),
            ],
          );
        },
      ),
    );
  }

  Widget _expansionNavigationItem({required MainNavigationItem mainNavigationItem, required String path,}){
    return ExpansionTile(
      leading: Icon(mainNavigationItem.iconData, color: Colors.white,),
      title: Text(mainNavigationItem.title, style: const TextStyle(color: Colors.white),),
      iconColor: Colors.white,
      collapsedIconColor: Colors.white,
      backgroundColor: _expansionTileBackgroundColor,
      collapsedBackgroundColor: _drawerBackgroundColor,
      children: mainNavigationItem.children.map((child){
        final bool isSelected = path == (child.path ?? child.title.toLowerCase());
        return Material(
          child: ListTile(
            leading: Icon(child.iconData, color: Colors.white,),
            title: Text(child.title, style: const TextStyle(color: Colors.white),),
            onTap: () {
              if(isSelected){
                return;
              }
              AutoRouter.of(context).push(child.route,);
            },
            selected: isSelected,
            selectedTileColor: _selectedColor,
            contentPadding: const EdgeInsets.only(left: 30, right: 10.0),
            tileColor: _expansionTileBackgroundColor,
            trailing: isSelected ? const Icon(Icons.blur_on, color: Colors.white,) : null,
          ),
        );
      }).toList(),
    );
  }

  Widget _navigationItem({required MainNavigationItem mainNavigationItem, required String path,}){
    final bool isSelected =  path == (mainNavigationItem.path ?? mainNavigationItem.title.toLowerCase());
    return ListTile(
      leading: Icon(mainNavigationItem.iconData, color: Colors.white,),
      title: Text(mainNavigationItem.title, style: const TextStyle(color: Colors.white),),
      onTap: () {
        if(isSelected){
          return;
        }
        AutoRouter.of(context).push(mainNavigationItem.route,);
      },
      selected: isSelected,
      selectedTileColor: _selectedColor,
      tileColor: _drawerBackgroundColor,
      trailing: isSelected ? const Icon(Icons.blur_on, color: Colors.white,) : null,
    );
  }
}


class MainNavigationItem{
  final String title;
  final IconData iconData;
  final PageRouteInfo route;
  final String? path;
  final List<MainNavigationItem> children;
  const MainNavigationItem({required this.title, this.iconData = Icons.home, required this.route, this.path, this.children = const [],});
}




class NavigationBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, String path,) builder;
  const NavigationBuilder({Key? key, required this.builder,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: AutoRouter.of(context), builder: (context, child) {
      final StackRouter _autoRouter = AutoRouter.of(context);
      if(_autoRouter.currentSegments.length > 1){
        return builder(context, AutoRouter.of(context).currentSegments[1].path);
      }
      return builder(context, '');
    },);
  }
}
