import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:library_flutter/app/controllers/CustomerController/customer_controller.dart';
import 'package:library_flutter/app/controllers/ThemeController/theme_controller.dart';
import 'package:library_flutter/app/utils/compare_helpers.dart';
import 'package:library_flutter/presentation/components/CustomButton/custom_button.dart';
import 'package:library_flutter/presentation/components/DeleteDialog/delete_dialog.dart';
import 'package:library_flutter/presentation/components/SearchInput/search_input.dart';
import 'package:library_flutter/presentation/components/TitlePage/title_page.dart';

class ListCustomers extends StatefulWidget {
  const ListCustomers({Key? key}) : super(key: key);

  @override
  State<ListCustomers> createState() => _ListCustomersState();
}

class _ListCustomersState extends State<ListCustomers> {
  final store = Modular.get<CustomerController>();
  final storeTheme = Modular.get<ThemeController>();

  int? sortColunIndex;
  bool isAscending = false;

  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      store.customers.sort(
        (a, b) => Compare().compareInt(ascending, a.id, b.id),
      );
    } else if (columnIndex == 1) {
      store.customers.sort(
        (a, b) => Compare().compareString(ascending, a.name, b.name),
      );
    } else if (columnIndex == 2) {
      store.customers.sort(
        (a, b) => Compare().compareString(ascending, a.email, b.email),
      );
    } else if (columnIndex == 3) {
      store.customers.sort(
        (a, b) => Compare().compareString(ascending, a.city, b.city),
      );
    } else if (columnIndex == 4) {
      store.customers.sort(
        (a, b) => Compare().compareString(ascending, a.address, b.address),
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
              title: "Clientes",
            ),
            SearchInput(
              onChange: (text) => store.filter(text.toString()),
            ),
          ],
        ),
        const Padding(padding: EdgeInsets.all(5)),
        Observer(
          builder: (_) => FittedBox(
            child: store.customers.isNotEmpty
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
                        label: const SizedBox(child: Text('Email')),
                        onSort: onSort,
                      ),
                      DataColumn(
                        label: const SizedBox(child: Text('Cidade')),
                        onSort: onSort,
                      ),
                      DataColumn(
                        label: const SizedBox(child: Text('Endereço')),
                        onSort: onSort,
                      ),
                      const DataColumn(
                        label: SizedBox(child: Text('Opções')),
                      ),
                    ],
                    rows: store.customers
                        .map(
                          (customer) => DataRow(
                            cells: <DataCell>[
                              DataCell(
                                SizedBox(
                                  child: Text(
                                    customer.id.toString(),
                                  ),
                                ),
                              ),
                              DataCell(
                                SizedBox(
                                  child: Text(
                                    customer.name.toString(),
                                  ),
                                ),
                              ),
                              DataCell(
                                SizedBox(
                                  child: Text(
                                    customer.email.toString(),
                                  ),
                                ),
                              ),
                              DataCell(
                                SizedBox(
                                  child: Text(
                                    customer.address.toString(),
                                  ),
                                ),
                              ),
                              DataCell(
                                SizedBox(
                                  child: Text(
                                    customer.city.toString(),
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
                                              "/customers/form/${customer.id}?name=${customer.name}&email=${customer.email}&address=${customer.address}&city=${customer.city}")
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
                                            'Apagar o cliente ${customer.name}?',
                                        text:
                                            'Todo dado relacionado a esse cliente será apagado.',
                                        onConfirm: () =>
                                            store.deleteCustomer(customer),
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
                          function: () => store.getAllCustomers,
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
