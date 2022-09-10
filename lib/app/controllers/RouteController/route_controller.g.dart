// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RouteController on RouteControllerBase, Store {
  late final _$indexAtom =
      Atom(name: 'RouteControllerBase.index', context: context);

  @override
  int get index {
    _$indexAtom.reportRead();
    return super.index;
  }

  @override
  set index(int value) {
    _$indexAtom.reportWrite(value, super.index, () {
      super.index = value;
    });
  }

  late final _$RouteControllerBaseActionController =
      ActionController(name: 'RouteControllerBase', context: context);

  @override
  void changeIndex(dynamic newIndex) {
    final _$actionInfo = _$RouteControllerBaseActionController.startAction(
        name: 'RouteControllerBase.changeIndex');
    try {
      return super.changeIndex(newIndex);
    } finally {
      _$RouteControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
index: ${index}
    ''';
  }
}
