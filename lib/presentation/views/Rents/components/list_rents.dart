import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:library_flutter/app/controllers/RentsController/rent_controller.dart';
import 'package:library_flutter/app/controllers/ThemeController/theme_controller.dart';
import 'package:library_flutter/app/utils/compare_helpers.dart';
import 'package:library_flutter/presentation/components/CustomButton/custom_button.dart';
import 'package:library_flutter/presentation/components/DeleteDialog/delete_dialog.dart';
import 'package:library_flutter/presentation/components/SearchInput/search_input.dart';
import 'package:library_flutter/presentation/components/TitlePage/title_page.dart';

class ListRents extends StatefulWidget {
  const ListRents({Key? key}) : super(key: key);

  @override
  State<ListRents> createState() => _ListRentsState();
}

class _ListRentsState extends State<ListRents> {
  final store = Modular.get<RentController>();
  final storeTheme = Modular.get<ThemeController>();

  int? sortColunIndex;
  bool isAscending = false;

  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      store.rents.sort(
        (a, b) => Compare().compareInt(ascending, a.id, b.id),
      );
    } else if (columnIndex == 1) {
      store.rents.sort(
        (a, b) => Compare()
            .compareString(ascending, a.customer!.name, b.customer!.name),
      );
    } else if (columnIndex == 2) {
      store.rents.sort(
        (a, b) =>
            Compare().compareString(ascending, a.book!.name, b.book!.name),
      );
    } else if (columnIndex == 3) {
      store.rents.sort(
        (a, b) => Compare().compareString(ascending, a.rentStart, b.rentStart),
      );
    } else if (columnIndex == 4) {
      store.rents.sort(
        (a, b) => Compare().compareString(ascending, a.rentEnd, b.rentEnd),
      );
    } else if (columnIndex == 5) {
      store.rents.sort(
        (a, b) => Compare()
            .compareStringWithNull(ascending, a.devolution, b.devolution),
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
              title: "Alugueis",
            ),
            SearchInput(
              onChange: (text) => store.filter(text.toString()),
            ),
          ],
        ),
        const Padding(padding: EdgeInsets.all(5)),
        Observer(
          builder: (_) => FittedBox(
            child: store.rents.isNotEmpty
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
                        label: const SizedBox(child: Text('Livro')),
                        onSort: onSort,
                      ),
                      DataColumn(
                        label: const SizedBox(child: Text('Cliente')),
                        onSort: onSort,
                      ),
                      DataColumn(
                        label: const SizedBox(child: Text('Início do aluguel')),
                        onSort: onSort,
                      ),
                      DataColumn(
                        label:
                            const SizedBox(child: Text('Previsão de entrega')),
                        onSort: onSort,
                      ),
                      DataColumn(
                        label: const SizedBox(child: Text('Devolução')),
                        onSort: onSort,
                      ),
                      const DataColumn(
                        label: SizedBox(child: Text('Status')),
                      ),
                      const DataColumn(
                        label: SizedBox(child: Text('Opções')),
                      ),
                    ],
                    rows: store.rents
                        .map(
                          (rent) => DataRow(
                            cells: <DataCell>[
                              DataCell(
                                SizedBox(
                                  child: Text(
                                    rent.id.toString(),
                                  ),
                                ),
                              ),
                              DataCell(
                                SizedBox(
                                  child: Text(
                                    rent.book!.name.toString(),
                                  ),
                                ),
                              ),
                              DataCell(
                                SizedBox(
                                  child: Text(
                                    rent.customer!.name.toString(),
                                  ),
                                ),
                              ),
                              DataCell(
                                SizedBox(
                                  child: Text(DateFormat("dd/MM/yyyy").format(
                                    DateTime.parse(rent.rentStart),
                                  )),
                                ),
                              ),
                              DataCell(
                                SizedBox(
                                  child: Text(DateFormat("dd/MM/yyyy").format(
                                    DateTime.parse(rent.rentEnd),
                                  )),
                                ),
                              ),
                              DataCell(
                                SizedBox(
                                  child: rent.devolution != null
                                      ? Text(
                                          DateFormat("dd/MM/yyyy").format(
                                            DateTime.parse(rent.devolution),
                                          ),
                                        )
                                      : const Chip(
                                          avatar: CircleAvatar(
                                            child: Icon(
                                              Icons.hourglass_bottom,
                                              size: 18,
                                            ),
                                          ),
                                          label: Text(
                                            'Não entregue',
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ),
                                ),
                              ),
                              DataCell(
                                SizedBox(
                                  child: rent.devolution == null
                                      ? const Chip(
                                          avatar: CircleAvatar(
                                            child: Icon(
                                              Icons.hourglass_bottom,
                                              size: 18,
                                            ),
                                          ),
                                          label: Text(
                                            'Não entregue',
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        )
                                      : DateTime.parse(rent.rentEnd).compareTo(
                                                  DateTime.parse(
                                                      rent.devolution)) >
                                              0
                                          ? const Chip(
                                              avatar: CircleAvatar(
                                                backgroundColor: Colors.green,
                                                child: Icon(
                                                  color: Colors.white,
                                                  Icons.thumb_up,
                                                  size: 18,
                                                ),
                                              ),
                                              label: Text(
                                                'Sem Atraso',
                                                style: TextStyle(fontSize: 12),
                                              ),
                                            )
                                          : const Chip(
                                              avatar: CircleAvatar(
                                                backgroundColor:
                                                    Colors.redAccent,
                                                child: Icon(
                                                  color: Colors.white,
                                                  Icons.thumb_down,
                                                  size: 18,
                                                ),
                                              ),
                                              label: Text(
                                                'Com Atraso',
                                                style: TextStyle(fontSize: 12),
                                              ),
                                            ),
                                ),
                              ),
                              DataCell(
                                Row(
                                  children: [
                                    IconButton(
                                      disabledColor: Colors.transparent,
                                      padding: const EdgeInsets.all(2),
                                      constraints: const BoxConstraints(),
                                      onPressed: rent.devolution != null
                                          ? null
                                          : () => store.completeRent(rent),
                                      icon: Icon(
                                        Icons.check,
                                        size: 20,
                                        color: rent.devolution != null
                                            ? Colors.transparent
                                            : Colors.green,
                                      ),
                                    ),
                                    IconButton(
                                      padding: const EdgeInsets.all(2),
                                      constraints: const BoxConstraints(),
                                      onPressed: rent.devolution != null
                                          ? null
                                          : () => {
                                                Modular.to.navigate(
                                                    "/rents/form/${rent.id}?bookId=${rent.book!.id}&customerId=${rent.customer!.id}&rentStart=${rent.rentStart}&rentEnd=${rent.rentEnd}&devolution=${rent.devolution}")
                                              },
                                      icon: Icon(
                                        Icons.edit,
                                        size: 20,
                                        color: rent.devolution != null
                                            ? Colors.grey
                                            : Colors.deepOrange,
                                      ),
                                    ),
                                    IconButton(
                                      padding: const EdgeInsets.all(2),
                                      constraints: const BoxConstraints(),
                                      onPressed: rent.devolution != null
                                          ? null
                                          : () {
                                              deleteDialog(
                                                context: context,
                                                title:
                                                    'Apagar o aluguel de ${rent.customer!.name}?',
                                                text:
                                                    'Todo dado relacionado a esse aluguel será apagado.',
                                                onConfirm: () {
                                                  store.deleteRent(rent);
                                                },
                                              );
                                            },
                                      icon: Icon(
                                        Icons.delete,
                                        size: 20,
                                        color: rent.devolution != null
                                            ? Colors.grey
                                            : Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
                          function: () => store.getAllRents,
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
                        ),
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
