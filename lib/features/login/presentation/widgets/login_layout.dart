import 'package:flutter/material.dart';

class LoginLayout extends StatelessWidget {
  final Widget themeSwitcher;
  final Widget background;
  final Widget loginForeground;
  final Widget copyrightText;
  const LoginLayout({Key? key, required this.themeSwitcher, required this.background, required this.loginForeground, required this.copyrightText,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        loginForeground,
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: IgnorePointer(
            child: background,
          ),
        ),
        Positioned(
          top: 20,
          right: 20,
          child: themeSwitcher,
        ),
        Positioned(
          bottom: 20,
          child: copyrightText,
        ),
      ],
    );
  }
}
