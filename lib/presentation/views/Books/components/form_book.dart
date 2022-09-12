import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:library_flutter/app/controllers/BookController/book_controller.dart';
import 'package:library_flutter/app/controllers/PublisherController/publisher_controller.dart';
import 'package:library_flutter/domain/models/Book/book.dart';
import 'package:library_flutter/domain/models/Publisher/publisher.dart';
import 'package:library_flutter/presentation/components/AppBar/custom_appbar.dart';
import 'package:library_flutter/presentation/components/CustomButton/custom_button.dart';
import 'package:library_flutter/presentation/components/FormInput/form_input.dart';
import 'package:library_flutter/presentation/components/ReturnButton/return_button.dart';

class FormBook extends StatefulWidget {
  final String? id;
  final String? name;
  final String? author;
  final String? publisherId;
  final String? realeseYear;
  final String? quantity;

  const FormBook({
    Key? key,
    this.id,
    this.name,
    this.author,
    this.publisherId,
    this.realeseYear,
    this.quantity,
  }) : super(key: key);

  @override
  State<FormBook> createState() => _FormBookState();
}

class _FormBookState extends State<FormBook> {
  final storeBook = Modular.get<BookController>();
  final storePublisher = Modular.get<PublisherController>();

  final formKey = GlobalKey<FormState>();
  final formData = <String, String>{};

  final nameFocus = FocusNode();
  final cityFocus = FocusNode();
  final quantityFocus = FocusNode();
  final realeaseYearFocus = FocusNode();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (formData.isEmpty) {
      if (widget.id != null) {
        formData["id"] = widget.id!;
      }
      if (widget.name != null) {
        formData["name"] = widget.name!;
      }
      if (widget.author != null) {
        formData["author"] = widget.author!;
      }
      if (widget.publisherId != null) {
        formData["publisherId"] = widget.publisherId!;
      }
      if (widget.realeseYear != null) {
        formData["realeseYear"] = widget.realeseYear!;
      }
      if (widget.quantity != null) {
        formData["quantity"] = widget.quantity!;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    void _onSubmit() {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        final isValid = formKey.currentState?.validate() ?? false;

        if (!isValid) {
          return;
        } else {
          formKey.currentState?.save();

          if (formData["id"] != null && formData["id"] != "") {
            final book = Book(
              id: formData['id'],
              name: formData["name"],
              author: formData["author"],
              quantity: formData["quantity"],
              realeaseYear: formData['realeseYear'],
              publisher: Publisher(
                id: formData['publisherId'],
                name: '',
                city: '',
              ),
            );

            storeBook.updateBook(book);
          } else {
            final book = Book(
              name: formData["name"],
              author: formData["author"],
              quantity: formData["quantity"],
              realeaseYear: formData['realeseYear'],
              publisher: Publisher(
                id: formData['publisherId'],
                name: '',
                city: '',
              ),
            );

            storeBook.createBook(book);
          }
        }
      });
    }

    return Observer(
      builder: (_) => Scaffold(
        appBar: const CustomAppBar(),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ReturnButton(
                title: widget.id!.isNotEmpty ? "Editar Livro" : "Criar Livro",
                backRoute: '/books/',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Form(
                  key: formKey,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: [
                      FormInput(
                        title: 'Nome',
                        initialValue: formData['name'],
                        icon: const Icon(Icons.abc),
                        margin: 10.0,
                        focus: nameFocus,
                        changeFocus: cityFocus,
                        onSave: (name) => {
                          setState(() => {
                                formData['name'] = name ?? '',
                              })
                        },
                        validator: (text) {
                          final name = text ?? '';

                          if (name.trim().isEmpty) {
                            return 'Nome é obrigatório';
                          }

                          return null;
                        },
                      ),
                      FormInput(
                        title: 'Autor',
                        initialValue: formData['author'],
                        icon: const Icon(Icons.person),
                        margin: 10.0,
                        focus: cityFocus,
                        onSave: (author) => {
                          setState(() => {
                                formData['author'] = author ?? '',
                              })
                        },
                        validator: (text) {
                          final author = text ?? '';

                          if (author.trim().isEmpty) {
                            return 'Autor é obrigatório';
                          }

                          return null;
                        },
                      ),
                      FormInput(
                        title: 'Quantidade',
                        initialValue: formData['quantity'],
                        icon: const Icon(Icons.archive),
                        margin: 10.0,
                        focus: quantityFocus,
                        onSave: (quantity) => {
                          setState(() => {
                                formData['quantity'] = quantity ?? '',
                              })
                        },
                        validator: (text) {
                          final city = text ?? '';

                          if (city.trim().isEmpty) {
                            return 'Quantidade é obrigatório';
                          }

                          return null;
                        },
                      ),
                      FormInput(
                        title: 'Ano de lançamento',
                        initialValue: formData['realeseYear'],
                        icon: const Icon(Icons.calendar_month),
                        margin: 10.0,
                        focus: realeaseYearFocus,
                        onSave: (realeseYear) => {
                          setState(() => {
                                formData['realeseYear'] = realeseYear ?? '',
                              })
                        },
                        validator: (text) {
                          final realeseYear = text ?? '';

                          if (realeseYear.trim().isEmpty) {
                            return 'Quantidade é obrigatório';
                          }

                          return null;
                        },
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: InputDecorator(
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.fromLTRB(12, 0, 12, 0),
                            labelText: 'Editora',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            suffixIconColor: Colors.deepPurple,
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.purple,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10.0)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.deepPurple,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              value: formData['publisherId'],
                              icon: const Icon(Icons.arrow_drop_down),
                              elevation: 16,
                              style: const TextStyle(color: Colors.deepPurple),
                              underline: Container(
                                height: 1,
                                color: Colors.deepPurpleAccent,
                              ),
                              items: storePublisher.publishers
                                  .map<DropdownMenuItem<String>>((item) {
                                return DropdownMenuItem<String>(
                                  value: item.id.toString(),
                                  child: Text(item.name),
                                );
                              }).toList(),
                              onChanged: (String? publisherId) => {
                                setState(() => {
                                      formData['publisherId'] =
                                          publisherId ?? '',
                                    })
                              },
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10.0),
                        height: 40,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            gradient: LinearGradient(colors: [
                              Colors.deepPurple,
                              Colors.purple,
                              Colors.deepPurple
                            ])),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              shadowColor: Colors.transparent),
                          onPressed: _onSubmit,
                          child: const Text(
                            'Salvar',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
