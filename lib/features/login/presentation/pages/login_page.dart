import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/blocs/network_checker/network_checker_bloc.dart';
import '../widgets/login_foreground.dart';
import '../widgets/login_form.dart';
import '../widgets/login_theme_switcher.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key,}) : super(key: key);

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
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: [
              const LoginForeground(
                loginForm: LoginForm(),
              ),
              _loginBackground(),
              _themeSwitcher(),
              //FF(),
              _copyRightText(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginBackground() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: IgnorePointer(
          child: Lottie.asset('assets/images/login_image1.json',)),
    );
  }

  Widget _themeSwitcher() {
    return const Positioned(
      top: 20,
      right: 20,
      child: LoginThemeSwitcher(),
    );
  }

  Widget _copyRightText() {
    return const Positioned(
      bottom: 20,
      child: Text('copyright c 2021, all right reserve.',),
    );
  }
}