part of 'theme_switcher_bloc.dart';

abstract class ThemeSwitcherState extends Equatable {
  const ThemeSwitcherState();
}

class ThemeSwitcherInitial extends ThemeSwitcherState {
  @override
  List<Object> get props => [];
}


class ChangeThemeInProgress extends ThemeSwitcherState {
  const ChangeThemeInProgress();

  @override
  List<Object> get props => [];
}

class ChangeThemeSuccess extends ThemeSwitcherState {
  final ThemeMode themeMode;
  const ChangeThemeSuccess({required this.themeMode,});

  @override
  List<Object> get props => [];
}