// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RouteStore on RouteBase, Store {
  late final _$indexAtom = Atom(name: 'RouteBase.index', context: context);

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

  late final _$RouteBaseActionController =
      ActionController(name: 'RouteBase', context: context);

  @override
  void changeIndex(dynamic newIndex) {
    final _$actionInfo =
        _$RouteBaseActionController.startAction(name: 'RouteBase.changeIndex');
    try {
      return super.changeIndex(newIndex);
    } finally {
      _$RouteBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
index: ${index}
    ''';
  }
}
