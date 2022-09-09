// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'publisher_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PublisherStore on PublisherStoreBase, Store {
  late final _$publishersAtom =
      Atom(name: 'PublisherStoreBase.publishers', context: context);

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

  late final _$getAllPublishersAsyncAction =
      AsyncAction('PublisherStoreBase.getAllPublishers', context: context);

  @override
  Future getAllPublishers() {
    return _$getAllPublishersAsyncAction.run(() => super.getAllPublishers());
  }

  late final _$createPublisherAsyncAction =
      AsyncAction('PublisherStoreBase.createPublisher', context: context);

  @override
  Future createPublisher(Publisher publisher) {
    return _$createPublisherAsyncAction
        .run(() => super.createPublisher(publisher));
  }

  late final _$updatePublisherAsyncAction =
      AsyncAction('PublisherStoreBase.updatePublisher', context: context);

  @override
  Future updatePublisher(Publisher publisher) {
    return _$updatePublisherAsyncAction
        .run(() => super.updatePublisher(publisher));
  }

  @override
  String toString() {
    return '''
publishers: ${publishers}
    ''';
  }
}
