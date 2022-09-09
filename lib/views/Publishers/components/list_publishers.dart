import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:library_flutter/controllers/ThemeController/theme_controller.dart';
import 'package:library_flutter/models/Publisher/publisher.dart';
import 'package:library_flutter/store/PublisherStore/publisher_store.dart';
import 'package:library_flutter/utils/global_scaffold.dart';

class ListPublishers extends StatelessWidget {
  ListPublishers({Key? key, required this.listPubs}) : super(key: key);

  final List<Publisher> listPubs;

  final store = Modular.get<PublisherStore>();
  final storeTheme = Modular.get<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(10, 20, 0, 10),
          decoration: const BoxDecoration(
              border:
                  Border(left: BorderSide(color: Colors.deepPurple, width: 2))),
          child: Observer(builder: (_) {
            return RichText(
              text: TextSpan(
                children: [
                  const WidgetSpan(
                    child: Padding(
                      padding: EdgeInsets.only(left: 5),
                    ),
                  ),
                  WidgetSpan(
                    child: Icon(
                      Icons.apartment,
                      size: 28,
                      color: storeTheme.isDarkMode
                          ? Colors.grey
                          : Colors.deepPurple,
                    ),
                  ),
                  const WidgetSpan(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2, vertical: 0),
                    ),
                  ),
                  TextSpan(
                    text: "Editoras",
                    style: TextStyle(
                      fontSize: 24,
                      color:
                          storeTheme.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
        const Padding(padding: EdgeInsets.all(5)),
        Observer(
          builder: (_) => FittedBox(
            child: DataTable(
              showCheckboxColumn: false,
              headingRowColor: MaterialStateColor.resolveWith(
                (states) => Colors.black12,
              ),
              headingRowHeight: 35,
              columns: const <DataColumn>[
                DataColumn(
                  label: SizedBox(child: Text('Id')),
                ),
                DataColumn(
                  label: SizedBox(child: Text('Nome')),
                ),
                DataColumn(
                  label: SizedBox(child: Text('Cidade')),
                ),
                DataColumn(
                  label: SizedBox(child: Text('Opções')),
                ),
              ],
              rows: listPubs
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
                              onPressed: (() => {
                                    showSnackbar(
                                      const SnackBar(
                                        elevation: 2,
                                        backgroundColor: Colors.redAccent,
                                        content: Text(
                                          "Deletar!",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        duration: Duration(milliseconds: 1500),
                                      ),
                                    ),
                                  }),
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
            ),
          ),
        ),
        const Padding(padding: EdgeInsets.symmetric(vertical: 50)),
      ],
    );
  }
}
