import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled1/config/routes/default_routes/router.gr.dart';
import '../../../../core/blocs/network_checker/network_checker_bloc.dart';
import '../bloc/login_bloc.dart';
import '../widgets/login_foreground.dart';
import '../widgets/login_form.dart';
import '../widgets/login_layout.dart';
import '../widgets/login_theme_switcher.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<NetworkCheckerBloc, NetworkCheckerState>(
          listener: (context, state) {
            if(state is IsOnline){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Online using ${state.type}'),),);
            }
            else{
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Offline'),),);
            }
          },
        ),
        BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginInProgress) {
              _showWaitingDialog(context);
            } else if (state is LoginFailed) {
              _showLoginFailedMessage(context);
            }
            else if (state is LoginSuccess) {

            }
          },
        ),
      ],
      child: Scaffold(
        body: SafeArea(
          child: LoginLayout(
            loginForeground: LoginForeground(
              loginForm: LoginForm(
                onSubmit: (data){
                  context.read<LoginBloc>().login(data: data);
                },
                onRegisterClicked: (){
                  AutoRouter.of(context).push(const RegisterRoute());
                },
              ),
            ),
            background: Lottie.asset('assets/images/login_image1.json',),
            themeSwitcher: const LoginThemeSwitcher(),
            copyrightText: const Text('copyright c 2021, all right reserve.',),
          ),
        ),
      ),
    );
  }

  void _showLoginFailedMessage(BuildContext context){
    Navigator.of(context, rootNavigator: true).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Login Failed'),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(
          seconds: 5,
        ),
        action: SnackBarAction(
          label: 'Dismiss',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }

  Future<void> _showWaitingDialog(BuildContext context1) async {
    return showDialog<void>(
      context: context1,
      barrierDismissible: false, // user must tap button!
      useRootNavigator: true,
      builder: (BuildContext context) {
        return AlertDialog(
          //title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Center(
                  child: CircularProgressIndicator(),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    'Please Wait...',
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}