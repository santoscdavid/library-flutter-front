// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ThemeController on ThemeBase, Store {
  late final _$isDarkModeAtom =
      Atom(name: 'ThemeBase.isDarkMode', context: context);

  @override
  bool get isDarkMode {
    _$isDarkModeAtom.reportRead();
    return super.isDarkMode;
  }

  @override
  set isDarkMode(bool value) {
    _$isDarkModeAtom.reportWrite(value, super.isDarkMode, () {
      super.isDarkMode = value;
    });
  }

  late final _$themeIconAtom =
      Atom(name: 'ThemeBase.themeIcon', context: context);

  @override
  IconData get themeIcon {
    _$themeIconAtom.reportRead();
    return super.themeIcon;
  }

  @override
  set themeIcon(IconData value) {
    _$themeIconAtom.reportWrite(value, super.themeIcon, () {
      super.themeIcon = value;
    });
  }

  late final _$ThemeBaseActionController =
      ActionController(name: 'ThemeBase', context: context);

  @override
  void changeTheme() {
    final _$actionInfo =
        _$ThemeBaseActionController.startAction(name: 'ThemeBase.changeTheme');
    try {
      return super.changeTheme();
    } finally {
      _$ThemeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isDarkMode: ${isDarkMode},
themeIcon: ${themeIcon}
    ''';
  }
}
