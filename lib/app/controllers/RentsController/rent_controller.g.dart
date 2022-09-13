// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rent_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RentController on RentControllerBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'RentControllerBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$rentsAtom =
      Atom(name: 'RentControllerBase.rents', context: context);

  @override
  List<Rent> get rents {
    _$rentsAtom.reportRead();
    return super.rents;
  }

  @override
  set rents(List<Rent> value) {
    _$rentsAtom.reportWrite(value, super.rents, () {
      super.rents = value;
    });
  }

  late final _$cachedRentsAtom =
      Atom(name: 'RentControllerBase.cachedRents', context: context);

  @override
  List<Rent> get cachedRents {
    _$cachedRentsAtom.reportRead();
    return super.cachedRents;
  }

  @override
  set cachedRents(List<Rent> value) {
    _$cachedRentsAtom.reportWrite(value, super.cachedRents, () {
      super.cachedRents = value;
    });
  }

  late final _$getAllRentsAsyncAction =
      AsyncAction('RentControllerBase.getAllRents', context: context);

  @override
  Future getAllRents() {
    return _$getAllRentsAsyncAction.run(() => super.getAllRents());
  }

  late final _$createRentAsyncAction =
      AsyncAction('RentControllerBase.createRent', context: context);

  @override
  Future createRent(Rent rent) {
    return _$createRentAsyncAction.run(() => super.createRent(rent));
  }

  late final _$updateRentAsyncAction =
      AsyncAction('RentControllerBase.updateRent', context: context);

  @override
  Future updateRent(Rent rent) {
    return _$updateRentAsyncAction.run(() => super.updateRent(rent));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
rents: ${rents},
cachedRents: ${cachedRents}
    ''';
  }
}
