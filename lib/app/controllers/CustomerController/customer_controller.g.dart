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

  late final _$getAllPublishersAsyncAction =
      AsyncAction('CustomerControllerBase.getAllPublishers', context: context);

  @override
  Future getAllPublishers() {
    return _$getAllPublishersAsyncAction.run(() => super.getAllPublishers());
  }

  late final _$filterAsyncAction =
      AsyncAction('CustomerControllerBase.filter', context: context);

  @override
  Future filter(String value) {
    return _$filterAsyncAction.run(() => super.filter(value));
  }

  late final _$createPublisherAsyncAction =
      AsyncAction('CustomerControllerBase.createPublisher', context: context);

  @override
  Future createPublisher(Customer customer) {
    return _$createPublisherAsyncAction
        .run(() => super.createPublisher(customer));
  }

  late final _$updatePublisherAsyncAction =
      AsyncAction('CustomerControllerBase.updatePublisher', context: context);

  @override
  Future updatePublisher(Customer customer) {
    return _$updatePublisherAsyncAction
        .run(() => super.updatePublisher(customer));
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
