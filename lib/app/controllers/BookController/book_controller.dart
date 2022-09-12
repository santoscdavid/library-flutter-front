import 'package:flutter_modular/flutter_modular.dart';
import 'package:library_flutter/app/utils/custom_snackbars.dart';
import 'package:library_flutter/app/utils/global_scaffold.dart';
import 'package:library_flutter/data/repository/BooksRepository/books_repository.dart';
import 'package:library_flutter/domain/models/Book/book.dart';
import 'package:mobx/mobx.dart';

part 'book_controller.g.dart';

class BookController = BookControllerBase with _$BookController;

abstract class BookControllerBase with Store {
  final BooksRepository repository;

  BookControllerBase(this.repository) {
    getAllBooks();
  }

  @observable
  bool isLoading = false;

  @observable
  List<Book> books = [];

  @observable
  List<Book> cachedBooks = [];

  @action
  getAllBooks() async {
    isLoading = true;

    try {
      books = await repository.getAll();
      cachedBooks = books;

      isLoading = false;
    } catch (e) {
      CustomSnackBar().error('Houve um problema ao listar editoras');
    }
  }

  @action
  createBook(Book book) async {
    try {
      await repository.post(book).then(
            (res) => showSnackbar(
              CustomSnackBar().success('Livro cadastrado com sucesso!'),
            ),
          );
      Modular.to.navigate('/books/');
    } catch (err) {
      CustomSnackBar().success('Erro ao tentar cadastrar livro');
    } finally {
      await getAllBooks();
    }
  }

  @action
  updateBook(Book book) async {
    try {
      await repository.put(book).then(
            (res) => showSnackbar(
              CustomSnackBar().success('Livro editado com sucesso!'),
            ),
          );
      Modular.to.navigate('/books/');
    } catch (err) {
      CustomSnackBar().error('Erro ao tentar editar livro');
    } finally {
      await getAllBooks();
    }
  }

  deleteBook(Book book) async {
    {
      try {
        await repository.delete(book).then(
              (res) => {
                CustomSnackBar().success('Livro apagado com sucesso!'),
                Modular.to.pop()
              },
            );
      } catch (err) {
        CustomSnackBar().error('Erro ao tentar apagar o livro');
      } finally {
        await getAllBooks();
      }
    }
  }
}
