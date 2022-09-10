import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:library_flutter/components/DeleteDialog/delete_dialog.dart';
import 'package:library_flutter/components/SearchInput/search_input.dart';
import 'package:library_flutter/components/TitlePage/title_page.dart';
import 'package:library_flutter/controllers/ThemeController/theme_controller.dart';
import 'package:library_flutter/store/PublisherStore/publisher_store.dart';
import 'package:library_flutter/utils/compare_helpers.dart';

class ListPublishers extends StatefulWidget {
  const ListPublishers({
    Key? key,
  }) : super(key: key);

  @override
  State<ListPublishers> createState() => _ListPublishersState();
}

class _ListPublishersState extends State<ListPublishers> {
  final store = Modular.get<PublisherStore>();
  final storeTheme = Modular.get<ThemeController>();
  int? sortColunIndex;
  bool isAscending = false;

  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      store.publishers.sort(
        (a, b) => Compare().compareInt(ascending, a.id, b.id),
      );
    } else if (columnIndex == 1) {
      store.publishers.sort(
        (a, b) => Compare().compareString(ascending, a.name, b.name),
      );
    } else if (columnIndex == 2) {
      store.publishers.sort(
        (a, b) => Compare().compareString(ascending, a.city, b.city),
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
              title: "Editoras",
            ),
            SearchInput(
              onChange: (text) => store.filter(text.toString()),
            ),
          ],
        ),
        const Padding(padding: EdgeInsets.all(5)),
        Observer(
          builder: (_) => FittedBox(
            child: store.publishers.isNotEmpty
                ? DataTable(
                    sortColumnIndex: sortColunIndex,
                    sortAscending: isAscending,
                    showCheckboxColumn: false,
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
                        label: const SizedBox(child: Text('Cidade')),
                        onSort: onSort,
                      ),
                      const DataColumn(
                        label: SizedBox(child: Text('Opções')),
                      ),
                    ],
                    rows: store.publishers
                        .map(
                          (publisher) => DataRow(
                            cells: <DataCell>[
                              DataCell(
                                SizedBox(
                                  child: Text(
                                    publisher.id.toString(),
                                  ),
                                ),
                              ),
                              DataCell(
                                SizedBox(
                                  child: Text(
                                    publisher.name.toString(),
                                  ),
                                ),
                              ),
                              DataCell(
                                SizedBox(
                                  child: Text(
                                    publisher.city.toString(),
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
                                              "/publishers/form/${publisher.id}?name=${publisher.name}&city=${publisher.city}")
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
                                        title:
                                            'Apagar editora ${publisher.name}?',
                                        text:
                                            'Todo dado relacionado a essa editora será apagado.',
                                        onConfirm: () {
                                          store.deletePublisher(publisher);
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
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
        ),
        const Padding(padding: EdgeInsets.symmetric(vertical: 50)),
      ],
    );
  }
}
