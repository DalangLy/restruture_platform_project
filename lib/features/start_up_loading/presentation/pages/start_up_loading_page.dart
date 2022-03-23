import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/blocs/language_switcher/language_switcher_bloc.dart';
import '../../../../core/blocs/network_checker/network_checker_bloc.dart';
import '../../../../core/blocs/start_up_check_auth/start_up_check_auth_bloc.dart';
import '../../../../core/blocs/theme_switcher/theme_switcher_bloc.dart';
import '../widgets/customized_linear_progress_indicator.dart';

class StartUpLoadingPage extends StatefulWidget {
  final Function(
      bool isLoaded,
      ) loadingCallback;

  const StartUpLoadingPage({
    Key? key,
    required this.loadingCallback,
  }) : super(key: key);

  @override
  _StartUpLoadingPageState createState() => _StartUpLoadingPageState();
}

class _StartUpLoadingPageState extends State<StartUpLoadingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 2,
      ),
    );
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed && _animation.value >= 1) {
        widget.loadingCallback(true);
      }
    });

    //call processes
    BlocProvider.of<StartUpCheckAuthBloc>(context).add(
      const CheckAuth(),
    );
    BlocProvider.of<LanguageSwitcherBloc>(context).add(const LoadLocaleFromLocalStorage());
    BlocProvider.of<ThemeSwitcherBloc>(context).add(const LoadThemeFromLocalStorage());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  late double _progressValue = 0;

  void _updateProgressValue(double value) {
    setState(() {
      _progressValue += value;
    });

    _controller.animateTo(_progressValue);
  }

  late String _loadingText = '';
  void _updateLoadingText({required String text,}){
    setState(() {
      _loadingText = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<StartUpCheckAuthBloc, StartUpCheckAuthState>(
          listener: (context, state) {
            if(state is !StartUpCheckAuthInitial){
              _updateProgressValue(1/3);
              _updateLoadingText(text: 'Check Auth...');
            }
          },
        ),
        BlocListener<LanguageSwitcherBloc, LanguageSwitcherState>(
          listener: (context, state) {
            if(state is ChangeLocaleSuccess){
              _updateProgressValue(1/3);
              _updateLoadingText(text: 'Load Locale...');
            }
          },
        ),
        BlocListener<ThemeSwitcherBloc, ThemeSwitcherState>(
          listener: (context, state) {
            if(state is ChangeThemeSuccess){
              _updateProgressValue(1/3);
              _updateLoadingText(text: 'Check Theme...');
            }
          },
        ),
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
      ],
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(),
                SizedBox(
                  width: (MediaQuery.of(context).size.width * 30) / 100, // 30% of screen width
                  height: (MediaQuery.of(context).size.width * 30) / 100,
                  child: Lottie.asset('assets/images/desktop/desktop_splash.json'),
                ),
                FractionallySizedBox(
                  widthFactor: 0.5,
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('${(_animation.value * 100).toStringAsFixed(0)} %'),
                          Text(_loadingText),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomizedLinearProgressIndicator(
                            value: _animation.value,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
