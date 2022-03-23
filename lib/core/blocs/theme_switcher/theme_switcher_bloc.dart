import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_switcher_event.dart';
part 'theme_switcher_state.dart';

class ThemeSwitcherBloc extends Bloc<ThemeSwitcherEvent, ThemeSwitcherState> {
  final Future<SharedPreferences> _prefs;
  ThemeSwitcherBloc({required Future<SharedPreferences> localStorage,}) : _prefs = localStorage, super(ThemeSwitcherInitial()) {
    on<ThemeSwitcherEvent>((event, emit) async{
      final SharedPreferences prefs = await _prefs;
      if(event is LoadThemeFromLocalStorage){
        emit(const ChangeThemeInProgress(),);
        final String themModeInStringFormat = prefs.getString('theme') ?? 'system';
        final ThemeMode themeMode = getThemeModeEnumFromString(themeModeInStringFormat: themModeInStringFormat);
        emit(ChangeThemeSuccess(themeMode: themeMode,),);
      }
      else if(event is ChangeTheme){
        emit(const ChangeThemeInProgress(),);
        final ThemeMode themeMode = await prefs.setString('theme', event.themeMode.name.toString()).then((value) => event.themeMode);
        emit(ChangeThemeSuccess(themeMode: themeMode,),);
      }
    });
  }

  ThemeMode getThemeModeEnumFromString({required String themeModeInStringFormat,}) {
    final ThemeMode? themeMode = EnumToString.fromString(
      ThemeMode.values,
      themeModeInStringFormat,
    );
    return themeMode!;
  }
}
