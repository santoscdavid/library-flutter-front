// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'publisher_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PublisherController on PublisherControllerBase, Store {
  late final _$publishersAtom =
      Atom(name: 'PublisherControllerBase.publishers', context: context);

  @override
  List<Publisher> get publishers {
    _$publishersAtom.reportRead();
    return super.publishers;
  }

  @override
  set publishers(List<Publisher> value) {
    _$publishersAtom.reportWrite(value, super.publishers, () {
      super.publishers = value;
    });
  }

  late final _$cachedPublishersAtom =
      Atom(name: 'PublisherControllerBase.cachedPublishers', context: context);

  @override
  List<Publisher> get cachedPublishers {
    _$cachedPublishersAtom.reportRead();
    return super.cachedPublishers;
  }

  @override
  set cachedPublishers(List<Publisher> value) {
    _$cachedPublishersAtom.reportWrite(value, super.cachedPublishers, () {
      super.cachedPublishers = value;
    });
  }

  late final _$getAllPublishersAsyncAction =
      AsyncAction('PublisherControllerBase.getAllPublishers', context: context);

  @override
  Future getAllPublishers() {
    return _$getAllPublishersAsyncAction.run(() => super.getAllPublishers());
  }

  late final _$filterAsyncAction =
      AsyncAction('PublisherControllerBase.filter', context: context);

  @override
  Future filter(String value) {
    return _$filterAsyncAction.run(() => super.filter(value));
  }

  late final _$createPublisherAsyncAction =
      AsyncAction('PublisherControllerBase.createPublisher', context: context);

  @override
  Future createPublisher(Publisher publisher) {
    return _$createPublisherAsyncAction
        .run(() => super.createPublisher(publisher));
  }

  late final _$updatePublisherAsyncAction =
      AsyncAction('PublisherControllerBase.updatePublisher', context: context);

  @override
  Future updatePublisher(Publisher publisher) {
    return _$updatePublisherAsyncAction
        .run(() => super.updatePublisher(publisher));
  }

  @override
  String toString() {
    return '''
publishers: ${publishers},
cachedPublishers: ${cachedPublishers}
    ''';
  }
}
