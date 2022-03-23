extension MapExtension on Map {

  dynamic eitherKeys({required String key, required String otherKey}){
    return this[key] ?? this[otherKey];
  }
}