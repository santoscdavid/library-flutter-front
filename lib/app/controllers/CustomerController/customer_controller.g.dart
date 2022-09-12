// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CustomerController on CustomerControllerBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'CustomerControllerBase.isLoading', context: context);

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

  late final _$customersAtom =
      Atom(name: 'CustomerControllerBase.customers', context: context);

  @override
  List<Customer> get customers {
    _$customersAtom.reportRead();
    return super.customers;
  }

  @override
  set customers(List<Customer> value) {
    _$customersAtom.reportWrite(value, super.customers, () {
      super.customers = value;
    });
  }

  late final _$cachedCustomersAtom =
      Atom(name: 'CustomerControllerBase.cachedCustomers', context: context);

  @override
  List<Customer> get cachedCustomers {
    _$cachedCustomersAtom.reportRead();
    return super.cachedCustomers;
  }

  @override
  set cachedCustomers(List<Customer> value) {
    _$cachedCustomersAtom.reportWrite(value, super.cachedCustomers, () {
      super.cachedCustomers = value;
    });
  }

  late final _$getAllCustomersAsyncAction =
      AsyncAction('CustomerControllerBase.getAllCustomers', context: context);

  @override
  Future getAllCustomers() {
    return _$getAllCustomersAsyncAction.run(() => super.getAllCustomers());
  }

  late final _$filterAsyncAction =
      AsyncAction('CustomerControllerBase.filter', context: context);

  @override
  Future filter(String value) {
    return _$filterAsyncAction.run(() => super.filter(value));
  }

  late final _$createCustomerAsyncAction =
      AsyncAction('CustomerControllerBase.createCustomer', context: context);

  @override
  Future createCustomer(Customer customer) {
    return _$createCustomerAsyncAction
        .run(() => super.createCustomer(customer));
  }

  late final _$updateCustomerAsyncAction =
      AsyncAction('CustomerControllerBase.updateCustomer', context: context);

  @override
  Future updateCustomer(Customer customer) {
    return _$updateCustomerAsyncAction
        .run(() => super.updateCustomer(customer));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
customers: ${customers},
cachedCustomers: ${cachedCustomers}
    ''';
  }
}
