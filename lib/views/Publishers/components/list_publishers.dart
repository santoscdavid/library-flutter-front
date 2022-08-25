import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:library_flutter/models/Publisher/publisher.dart';
import 'package:library_flutter/store/PublisherStore/publisher_store.dart';

class ListPublishers extends StatelessWidget {
  ListPublishers({Key? key, required this.listPubs}) : super(key: key);

  final List<Publisher> listPubs;

  final store = Modular.get<PublisherStore>();

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
          child: RichText(
            text: const TextSpan(
              children: [
                WidgetSpan(
                  child: Padding(
                    padding: EdgeInsets.only(left: 5),
                  ),
                ),
                WidgetSpan(
                  child: Icon(
                    Icons.apartment,
                    size: 28,
                    color: Colors.deepPurple,
                  ),
                ),
                WidgetSpan(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2, vertical: 0),
                  ),
                ),
                TextSpan(
                  text: "Editoras",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.deepPurple,
                  ),
                ),
              ],
            ),
          ),
        ),
        const Padding(padding: EdgeInsets.all(5)),
        FittedBox(
          child: DataTable(
            showCheckboxColumn: false,
            headingRowColor: MaterialStateColor.resolveWith(
                (states) => Colors.deepPurpleAccent),
            headingTextStyle: const TextStyle(color: Colors.white),
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
                            onPressed: (() => {}),
                            icon: const Icon(
                              Icons.edit,
                              size: 20,
                              color: Colors.deepOrange,
                            ),
                          ),
                          IconButton(
                            padding: const EdgeInsets.all(2),
                            constraints: const BoxConstraints(),
                            onPressed: (() => {}),
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
      ],
    );
  }
}
