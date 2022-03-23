import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenStorage{
  final FlutterSecureStorage _secureStorage;
  final Future<SharedPreferences> _prefs;

  TokenStorage({required FlutterSecureStorage secureStorage, required Future<SharedPreferences> sharedPreferences}) : _secureStorage = secureStorage, _prefs = sharedPreferences;

  Future<String> read({required String key}) async {
    if(Platform.isAndroid || Platform.isIOS){
      return await _secureStorage.read(key: key) ?? '';
    }
    final SharedPreferences prefs = await _prefs;
    return prefs.getString(key) ?? '';
  }

  Future<void> write({required String key, required String value}) async {
    if(!kIsWeb && (Platform.isAndroid || Platform.isIOS)){
      await _secureStorage.write(key: key, value: value);
    }
    else{
      final SharedPreferences prefs = await _prefs;
      prefs.setString(key, value);
    }
  }

  Future<void> delete({required String key}) async {
    if(Platform.isAndroid || Platform.isIOS){
      await _secureStorage.delete(key: key);
    }
    final SharedPreferences prefs = await _prefs;
    prefs.remove(key);
  }
}