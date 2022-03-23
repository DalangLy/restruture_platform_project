part of 'theme_switcher_bloc.dart';

abstract class ThemeSwitcherEvent extends Equatable {
  const ThemeSwitcherEvent();
}

class LoadThemeFromLocalStorage extends ThemeSwitcherEvent {
  const LoadThemeFromLocalStorage();

  @override
  List<Object> get props => [];
}

class ChangeTheme extends ThemeSwitcherEvent {
  final ThemeMode themeMode;
  const ChangeTheme({required this.themeMode,});

  @override
  List<Object> get props => [];
}