// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BookController on BookControllerBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'BookControllerBase.isLoading', context: context);

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

  late final _$booksAtom =
      Atom(name: 'BookControllerBase.books', context: context);

  @override
  List<Book> get books {
    _$booksAtom.reportRead();
    return super.books;
  }

  @override
  set books(List<Book> value) {
    _$booksAtom.reportWrite(value, super.books, () {
      super.books = value;
    });
  }

  late final _$cachedBooksAtom =
      Atom(name: 'BookControllerBase.cachedBooks', context: context);

  @override
  List<Book> get cachedBooks {
    _$cachedBooksAtom.reportRead();
    return super.cachedBooks;
  }

  @override
  set cachedBooks(List<Book> value) {
    _$cachedBooksAtom.reportWrite(value, super.cachedBooks, () {
      super.cachedBooks = value;
    });
  }

  late final _$getAllBooksAsyncAction =
      AsyncAction('BookControllerBase.getAllBooks', context: context);

  @override
  Future getAllBooks() {
    return _$getAllBooksAsyncAction.run(() => super.getAllBooks());
  }

  late final _$createBookAsyncAction =
      AsyncAction('BookControllerBase.createBook', context: context);

  @override
  Future createBook(Book book) {
    return _$createBookAsyncAction.run(() => super.createBook(book));
  }

  late final _$updateBookAsyncAction =
      AsyncAction('BookControllerBase.updateBook', context: context);

  @override
  Future updateBook(Book book) {
    return _$updateBookAsyncAction.run(() => super.updateBook(book));
  }

  late final _$deleteBookAsyncAction =
      AsyncAction('BookControllerBase.deleteBook', context: context);

  @override
  Future deleteBook(Book book) {
    return _$deleteBookAsyncAction.run(() => super.deleteBook(book));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
books: ${books},
cachedBooks: ${cachedBooks}
    ''';
  }
}
