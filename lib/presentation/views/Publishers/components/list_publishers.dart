import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:library_flutter/app/controllers/PublisherController/publisher_controller.dart';
import 'package:library_flutter/app/controllers/ThemeController/theme_controller.dart';
import 'package:library_flutter/app/utils/compare_helpers.dart';
import 'package:library_flutter/app/utils/sized_config.dart';
import 'package:library_flutter/presentation/components/CustomButton/custom_button.dart';
import 'package:library_flutter/presentation/components/DeleteDialog/delete_dialog.dart';
import 'package:library_flutter/presentation/components/SearchInput/search_input.dart';
import 'package:library_flutter/presentation/components/TitlePage/title_page.dart';

class ListPublishers extends StatefulWidget {
  const ListPublishers({
    Key? key,
  }) : super(key: key);

  @override
  State<ListPublishers> createState() => _ListPublishersState();
}

class _ListPublishersState extends State<ListPublishers> {
  final store = Modular.get<PublisherController>();
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
                    columnSpacing: SizeConfig().widthSize(context, 10),
                    sortColumnIndex: sortColunIndex,
                    sortAscending: isAscending,
                    headingRowColor: MaterialStateColor.resolveWith(
                      (states) => Colors.black12,
                    ),
                    headingRowHeight: 35,
                    columns: <DataColumn>[
                      DataColumn(
                        label: const Text('Id'),
                        onSort: onSort,
                      ),
                      DataColumn(
                        label: const Text('Nome'),
                        onSort: onSort,
                      ),
                      DataColumn(
                        label: const Text('Cidade'),
                        onSort: onSort,
                      ),
                      const DataColumn(
                        label: Text('Opções'),
                      ),
                    ],
                    rows: store.publishers
                        .map(
                          (publisher) => DataRow(
                            cells: <DataCell>[
                              DataCell(
                                Text(
                                  publisher.id.toString(),
                                ),
                              ),
                              DataCell(
                                Text(
                                  publisher.name.toString(),
                                ),
                              ),
                              DataCell(
                                Text(
                                  publisher.city.toString(),
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
                          "Não há nenhuma editora,\nou houve algum problema.",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        CustomButton(
                          margin: 20,
                          function: () => store.getAllPublishers,
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
