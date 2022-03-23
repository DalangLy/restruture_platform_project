part of 'language_switcher_bloc.dart';

abstract class LanguageSwitcherState extends Equatable {
  const LanguageSwitcherState();
}

class LanguageSwitcherInitial extends LanguageSwitcherState {
  @override
  List<Object> get props => [];
}

class ChangeLocaleInProgress extends LanguageSwitcherState {
  const ChangeLocaleInProgress();

  @override
  List<Object> get props => [];
}

class ChangeLocaleSuccess extends LanguageSwitcherState {
  final Locale? locale;
  const ChangeLocaleSuccess({required this.locale,});

  @override
  List<Object> get props => [];
}