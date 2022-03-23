import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../../core/blocs/theme_switcher/theme_switcher_bloc.dart';

class LoginThemeSwitcher extends StatefulWidget {
  const LoginThemeSwitcher({Key? key}) : super(key: key);

  @override
  State<LoginThemeSwitcher> createState() => _LoginThemeSwitcherState();
}

class _LoginThemeSwitcherState extends State<LoginThemeSwitcher> {
  int _index = 0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      final ThemeSwitcherState f = BlocProvider.of<ThemeSwitcherBloc>(context).state;
      if(f is ChangeThemeSuccess){
        switch(f.themeMode){
          case ThemeMode.system:
            setState(() {
              _index = 0;
            });
            break;
          case ThemeMode.dark:
            setState(() {
              _index = 1;
            });
            break;
          case ThemeMode.light:
            setState(() {
              _index = 2;
            });
            break;
          default:
            setState(() {
              _index = 0;
            });
            break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ToggleSwitch(
      minWidth: 40.0,
      minHeight: 30.0,
      initialLabelIndex: _index,
      cornerRadius: 5.0,
      activeFgColor: Colors.white,
      inactiveBgColor: Colors.grey,
      inactiveFgColor: Colors.white,
      totalSwitches: 3,
      icons: const [
        Icons.computer,
        Icons.dark_mode,
        Icons.light_mode,
      ],
      iconSize: 28.0,
      borderWidth: 1.0,
      borderColor: const [Colors.blueGrey],
      activeBgColors: const [
        [Colors.blue],
        [Colors.pink],
        [Colors.purple]
      ],
      animate: true,
      // with just animate set to true, default curve = Curves.easeIn
      curve: Curves.ease,
      onToggle: (int? index) {
        switch (index) {
          case 0:
            BlocProvider.of<ThemeSwitcherBloc>(context).add(
              ChangeTheme(
                themeMode: ThemeMode.system,
              ),
            );
            break;
          case 1:
            BlocProvider.of<ThemeSwitcherBloc>(context).add(
              ChangeTheme(
                themeMode: ThemeMode.dark,
              ),
            );
            break;
          case 2:
            BlocProvider.of<ThemeSwitcherBloc>(context).add(
              ChangeTheme(
                themeMode: ThemeMode.light,
              ),
            );
            break;
          default:
            BlocProvider.of<ThemeSwitcherBloc>(context).add(
              ChangeTheme(
                themeMode: ThemeMode.system,
              ),
            );
            break;
        }
      },
    );
  }
}
