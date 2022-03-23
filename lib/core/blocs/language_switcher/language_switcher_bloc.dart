import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/app_locale/app_locale.dart';

part 'language_switcher_event.dart';
part 'language_switcher_state.dart';

class LanguageSwitcherBloc extends Bloc<LanguageSwitcherEvent, LanguageSwitcherState> {
  final Future<SharedPreferences> _prefs;
  LanguageSwitcherBloc({required Future<SharedPreferences> localStorage,}) : _prefs = localStorage, super(LanguageSwitcherInitial()) {
    on<LanguageSwitcherEvent>((event, emit) async{
      final SharedPreferences prefs = await _prefs;
      if(event is LoadLocaleFromLocalStorage){
        emit(const ChangeLocaleInProgress(),);
        final String appLocaleInStringFormat = prefs.getString('language') ?? 'system';
        final Locale? locale = getLocaleFromString(appLocaleInStringFormat: appLocaleInStringFormat);
        emit(ChangeLocaleSuccess(locale: locale,),);
      }
      else if(event is ChangeLanguage){
        emit(const ChangeLocaleInProgress());
        final AppLocale appLocale = await prefs.setString('language', event.appLocale.name.toString()).then((value) => event.appLocale);
        emit(ChangeLocaleSuccess(locale: appLocaleData[appLocale]!),);
      }
    });
  }

  Locale? getLocaleFromString({required String appLocaleInStringFormat,}) {
    final AppLocale? appLocale = EnumToString.fromString(
      AppLocale.values,
      appLocaleInStringFormat,
    );
    return appLocaleData[appLocale];
  }
}
