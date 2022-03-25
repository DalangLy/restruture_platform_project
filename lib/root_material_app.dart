import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/app_locale/l10n/gen_l10n/app_localizations.dart';
import 'config/app_theme/app_theme.dart';
import 'config/routes/default_routes/router.gr.dart';
import 'core/blocs/language_switcher/language_switcher_bloc.dart';
import 'core/blocs/logout/logout_bloc.dart';
import 'core/blocs/network_checker/network_checker_bloc.dart';
import 'core/blocs/start_up_check_auth/start_up_check_auth_bloc.dart';
import 'core/blocs/theme_switcher/theme_switcher_bloc.dart';
import 'features/auth/presentation/bloc/login_bloc.dart';
import 'features/start_up_loading/presentation/pages/start_up_loading_page.dart';
import 'injectors/injector.dart';

class RootMaterialApp extends StatefulWidget {
  const RootMaterialApp({Key? key}) : super(key: key);

  @override
  _RootMaterialAppState createState() => _RootMaterialAppState();
}

class _RootMaterialAppState extends State<RootMaterialApp> {
  final AppRouter _appRouter = AppRouter();

  late ThemeMode _themeMode = ThemeMode.system;

  void _changeTheme({
    required ThemeMode themeMode,
  }) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  late Locale? _locale;

  void _changeLanguage({
    required Locale? locale,
  }) {
    setState(() {
      _locale = locale;
    });
  }

  late bool _isAuth = false;

  @override
  void initState() {
    super.initState();

    _locale = null;
  }

  @override
  Widget build(BuildContext context) {
    return StartUpMultiBlocProvider(
      child: MultiBlocListener(
        listeners: [
          BlocListener<StartUpCheckAuthBloc, StartUpCheckAuthState>(
            listener: (context, state) {
              if(state is CheckAuthSuccess){
                setState(() {
                  _isAuth = true;
                });
              }
              else{
                setState(() {
                  _isAuth = false;
                });
              }
            },
          ),
          BlocListener<ThemeSwitcherBloc, ThemeSwitcherState>(
            listener: (context, state) {
              if (state is ChangeThemeSuccess) {
                _changeTheme(
                  themeMode: state.themeMode,
                );
              }
            },
          ),
          BlocListener<LanguageSwitcherBloc, LanguageSwitcherState>(
            listener: (context, state) {
              if (state is ChangeLocaleSuccess) {
                _changeLanguage(locale: state.locale);
              }
            },
          ),
          BlocListener<LogoutBloc, LogoutState>(
            listener: (context, state) {
              if (state is LogoutSuccess) {
                setState(() {
                  _isAuth = false;
                });
              }
            },
          ),
          BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                setState(() {
                  _isAuth = true;
                });
              }
            },
          ),

        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context)!.title,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: _locale,
          theme: AppTheme.of(context)!.lightTheme,
          darkTheme: AppTheme.of(context)!.darkTheme,
          themeMode: _themeMode,
          routerDelegate: AutoRouterDelegate.declarative(
            _appRouter,
            routes: (_) => [
              // if the user is logged in, they may proceed to the main App
              if (_isAuth)
                const HomeWrapperRoute()
              // if they are not logged in, bring them to the Login page
              else
                const LoginRoute(),
            ],
          ),
          routeInformationParser: _appRouter.defaultRouteParser(),
          builder: (BuildContext context, Widget? child) {
            return _startUp(context, child);
          },
        ),
      ),
    );
  }

  //show loading on start up
  late bool _isLoaded = false;
  Widget _startUp(BuildContext? context, Widget? child,){
    if (_isLoaded) {
      return child!;
    }
    return StartUpLoadingPage(
      loadingCallback: (isLoaded) {
        setState(() {
          _isLoaded = isLoaded;
        });
      },
    );
  }
}

class StartUpMultiBlocProvider extends MultiBlocProvider {
  StartUpMultiBlocProvider({
    Key? key,
    required Widget child,
  }) : super(
    key: key,
    child: child,
    providers: [
      BlocProvider<StartUpCheckAuthBloc>(
        create: (context) => getIt<StartUpCheckAuthBloc>(),
      ),
      BlocProvider<ThemeSwitcherBloc>(
        create: (context) => getIt<ThemeSwitcherBloc>(),
      ),
      BlocProvider<LoginBloc>(
        create: (context) => getIt<LoginBloc>(),
      ),
      BlocProvider<LogoutBloc>(
        create: (context) => LogoutBloc(),
      ),
      BlocProvider<LanguageSwitcherBloc>(
        create: (context) => getIt<LanguageSwitcherBloc>(),
      ),
      BlocProvider<NetworkCheckerBloc>(
        create: (context) =>
        NetworkCheckerBloc()..add(const CheckNetworkStatus(),),
      ),
    ],
  );
}
