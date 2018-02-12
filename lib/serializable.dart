import 'dart:core';

import 'package:built_mirrors_core/built_mirrors.dart';
export 'package:built_mirrors_core/built_mirrors.dart';

/// Shorthand annotation of [Serializable] used to determine which classes will
/// be processed by the generator
const Serializable serializable = const Serializable();

/// annotation used to determine which files will be processed by the generator
class Serializable extends Reflectable {
  const Serializable();
}

/// Interface that should be implemented by all the generated serializable classes
abstract class SerializableMap implements Map {
  const SerializableMap();

  /// Add all the values the the [map] into the object.
  @override
  void addAll(Map map) {
    keys.forEach((key) => this[key] = map[key]);
  }

  /// Add all the values the the [map] into the current object. Is the same as [addAll]
  fromMap(Map map) => addAll(map);

  /// Create a [Map] from the values of the object.
  Map toMap() => new Map.from(this);

  /// Sets all the attributes values to null.
  @override
  void clear() {
    this.forEach((key, value) => this[key] = null);
  }

  /// Checks if the object has any attribute with the name of [key]
  @override
  bool containsKey(Object key) => keys.contains(key);

  /// Check if any of the attributes contains the [value].
  @override
  bool containsValue(Object value) => values.contains(value);

  /// runs function [f] for each [attribute]-[value] pair
  @override
  void forEach(void f(attribute, value)) {
    keys.forEach((attribute) {
      f(attribute, this[attribute]);
    });
  }

  /// does nothing
  @override
  putIfAbsent(key, ifAbsent()) {
  }

  /// Sets the [attribute] value to null
  @override
  remove(Object attribute) {
    this[attribute] = null;
  }

  /// check if the object [keys] is empty
  @override
  bool get isEmpty => keys.isEmpty;

  /// check if the object [keys] is empty
  @override
  bool get isNotEmpty => !isEmpty;

  /// return the length of [keys]
  @override
  int get length => keys.length;

  /// return the attributes values
  Iterable get values => keys.map((key) => this[key]);

  @override
  void addEntries(Iterable<MapEntry> newEntries) {
    // TODO: implement addEntries
  }

  @override
  Map<RK, RV> cast<RK, RV>() {
    return null;
  }

  // TODO: implement entries
  @override
  Iterable<MapEntry> get entries => null;

  // TODO: implement keys
  @override
  Iterable get keys => null;

  @override
  Map<K2, V2> map<K2, V2>(MapEntry<K2, V2> Function(dynamic key, dynamic value) f) {
    return null;
  }

  @override
  void removeWhere(predicate) {
    // TODO: implement removeWhere
  }

  @override
  Map<RK, RV> retype<RK, RV>() {
    return null;
  }

  @override
  update(key, update, {dynamic Function() ifAbsent}) {
    // TODO: implement update
  }

  @override
  void updateAll(update) {
    // TODO: implement updateAll
  }
}

class FieldNotFoundException implements Exception {
  final String type;
  final String key;
  FieldNotFoundException([this.key, this.type]);

  toString() => "FieldNotFoundException: The key \"$key\" doesn't exist on class \"$type\"";
}

throwFieldNotFoundException(String key, String type) => throw new FieldNotFoundException(key, type);