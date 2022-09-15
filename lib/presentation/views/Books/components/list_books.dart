import 'package:design_system_library_flutter/app/components/commom/Inputs/SearchInput/search_input.dart';
import 'package:design_system_library_flutter/app/components/desktop/Buttons/CustomButton/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:library_flutter/app/controllers/BookController/book_controller.dart';
import 'package:library_flutter/app/controllers/ThemeController/theme_controller.dart';
import 'package:library_flutter/app/utils/compare_helpers.dart';
import 'package:library_flutter/presentation/components/DeleteDialog/delete_dialog.dart';
import 'package:library_flutter/presentation/components/TitlePage/title_page.dart';

class ListBooks extends StatefulWidget {
  const ListBooks({Key? key}) : super(key: key);

  @override
  State<ListBooks> createState() => _ListBooksState();
}

class _ListBooksState extends State<ListBooks> {
  final store = Modular.get<BookController>();
  final storeTheme = Modular.get<ThemeController>();

  int? sortColunIndex;
  bool isAscending = false;

  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      store.books.sort(
        (a, b) => Compare().compareInt(ascending, a.id, b.id),
      );
    } else if (columnIndex == 1) {
      store.books.sort(
        (a, b) => Compare().compareString(ascending, a.name, b.name),
      );
    } else if (columnIndex == 2) {
      store.books.sort(
        (a, b) => Compare().compareString(ascending, a.author, b.author),
      );
    } else if (columnIndex == 3) {
      store.books.sort(
        (a, b) => Compare()
            .compareString(ascending, a.publisher!.name, b.publisher!.name),
      );
    } else if (columnIndex == 4) {
      store.books.sort(
        (a, b) =>
            Compare().compareInt(ascending, a.realeaseYear, b.realeaseYear),
      );
    } else if (columnIndex == 5) {
      store.books.sort(
        (a, b) => Compare().compareInt(ascending, a.quantity, b.quantity),
      );
    }

    setState(() {
      sortColunIndex = columnIndex;
      isAscending = ascending;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const TitlePage(
              title: "Livros",
            ),
            SearchInput(
              onChange: (text) => store.filter(text.toString()),
            ),
          ],
        ),
        const Padding(padding: EdgeInsets.all(5)),
        Observer(
          builder: (_) => FittedBox(
            child: store.books.isNotEmpty
                ? DataTable(
                    sortColumnIndex: sortColunIndex,
                    sortAscending: isAscending,
                    headingRowColor: MaterialStateColor.resolveWith(
                      (states) => Colors.black12,
                    ),
                    headingRowHeight: 35,
                    columns: <DataColumn>[
                      DataColumn(
                        label: const SizedBox(child: Text('Id')),
                        onSort: onSort,
                      ),
                      DataColumn(
                        label: const SizedBox(child: Text('Nome')),
                        onSort: onSort,
                      ),
                      DataColumn(
                        label: const SizedBox(child: Text('Autor')),
                        onSort: onSort,
                      ),
                      DataColumn(
                        label: const SizedBox(child: Text('Editora')),
                        onSort: onSort,
                      ),
                      DataColumn(
                        label: const SizedBox(child: Text('Ano de lançamento')),
                        onSort: onSort,
                      ),
                      DataColumn(
                        label: const SizedBox(child: Text('Quantidade')),
                        onSort: onSort,
                      ),
                      const DataColumn(
                        label: SizedBox(child: Text('Opções')),
                      ),
                    ],
                    rows: store.books
                        .map(
                          (book) => DataRow(
                            cells: <DataCell>[
                              DataCell(
                                SizedBox(
                                  child: Text(
                                    book.id.toString(),
                                  ),
                                ),
                              ),
                              DataCell(
                                SizedBox(
                                  child: Text(
                                    book.name.toString(),
                                  ),
                                ),
                              ),
                              DataCell(
                                SizedBox(
                                  child: Text(
                                    book.author.toString(),
                                  ),
                                ),
                              ),
                              DataCell(
                                SizedBox(
                                  child: Text(
                                    book.publisher!.name.toString(),
                                  ),
                                ),
                              ),
                              DataCell(
                                SizedBox(
                                  child: Text(
                                    book.realeaseYear.toString(),
                                  ),
                                ),
                              ),
                              DataCell(
                                SizedBox(
                                  child: Text(
                                    book.quantity.toString(),
                                  ),
                                ),
                              ),
                              DataCell(Row(
                                children: [
                                  IconButton(
                                    padding: const EdgeInsets.all(2),
                                    constraints: const BoxConstraints(),
                                    onPressed: (() => {
                                          Modular.to.navigate(
                                              "/books/form/${book.id}?name=${book.name}&author=${book.author}&realeaseYear=${book.realeaseYear}&publisherId=${book.publisher!.id}&quantity=${book.quantity}")
                                        }),
                                    icon: const Icon(
                                      Icons.edit,
                                      size: 20,
                                      color: Colors.deepOrange,
                                    ),
                                  ),
                                  IconButton(
                                    padding: const EdgeInsets.all(2),
                                    constraints: const BoxConstraints(),
                                    onPressed: () {
                                      deleteDialog(
                                        context: context,
                                        title: 'Apagar o livro ${book.name}?',
                                        text:
                                            'Todo dado relacionado a esse livro será apagado.',
                                        onConfirm: () {
                                          store.deleteBook(book);
                                        },
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      size: 20,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              )),
                            ],
                          ),
                        )
                        .toList(),
                  )
                : Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(
                        vertical: 50, horizontal: 50),
                    child: Center(
                        child: Column(
                      children: [
                        const Icon(
                          Icons.mood_bad_rounded,
                          size: 40,
                          color: Colors.deepPurple,
                        ),
                        const Padding(padding: EdgeInsets.all(5)),
                        const Text(
                          "Não há nenhum livro,\nou houve algum problema.",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        CustomButton(
                          margin: 20,
                          function: () => store.getAllBooks,
                          child: store.isLoading
                              ? Container(
                                  padding: const EdgeInsets.all(10),
                                  width: 40.0,
                                  height: 40.0,
                                  child: const CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                )
                              : const Text('Recarregar'),
                        )
                      ],
                    )),
                  ),
          ),
        ),
        const Padding(padding: EdgeInsets.symmetric(vertical: 50)),
      ],
    );
  }
}
