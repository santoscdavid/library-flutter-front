import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:library_flutter/app/controllers/BookController/book_controller.dart';
import 'package:library_flutter/app/controllers/CustomerController/customer_controller.dart';
import 'package:library_flutter/app/controllers/RentsController/rent_controller.dart';
import 'package:library_flutter/app/controllers/ThemeController/theme_controller.dart';
import 'package:library_flutter/domain/models/Book/book.dart';
import 'package:library_flutter/domain/models/Customer/customer.dart';
import 'package:library_flutter/domain/models/Rent/rent.dart';
import 'package:library_flutter/presentation/components/AppBar/custom_appbar.dart';
import 'package:library_flutter/presentation/components/DateInput/date_input.dart';
import 'package:library_flutter/presentation/components/ReturnButton/return_button.dart';
import 'package:library_flutter/presentation/components/SelectInput/select_input.dart';

class FormRent extends StatefulWidget {
  final String? id;
  final String? bookId;
  final String? customerId;
  final String? rentStart;
  final String? rentEnd;

  const FormRent({
    Key? key,
    this.id,
    this.bookId,
    this.customerId,
    this.rentStart,
    this.rentEnd,
  }) : super(key: key);

  @override
  State<FormRent> createState() => _FormRentState();
}

class _FormRentState extends State<FormRent> {
  final storeRent = Modular.get<RentController>();
  final storeBook = Modular.get<BookController>();
  final storeCustomer = Modular.get<CustomerController>();
  final storeTheme = Modular.get<ThemeController>();

  final formKey = GlobalKey<FormState>();
  final formData = <String, String>{};

  final bookIdFocus = FocusNode();
  final customerIdFocus = FocusNode();
  final rentStartFocus = FocusNode();
  final rentEndFocus = FocusNode();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (formData.isEmpty) {
      if (widget.id != null) {
        formData["id"] = widget.id!;
      }
      if (widget.customerId != null) {
        formData["customerId"] = widget.customerId!;
      }
      if (widget.bookId != null) {
        formData["bookId"] = widget.bookId!;
      }
      if (widget.rentStart != null) {
        formData["rentStart"] = widget.rentStart!;
      }
      if (widget.rentEnd != null) {
        formData["rentEnd"] = widget.rentEnd!;
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
            final rent = Rent(
              id: formData['id'],
              rentStart: formData['rentStart'],
              rentEnd: formData['rentEnd'],
              customer: Customer(
                id: formData['customerId'],
                name: "",
                address: "",
                city: "",
                email: "",
              ),
              book: Book(
                id: formData['bookId'],
                name: "",
                author: "",
                publisher: null,
                quantity: "",
                realeaseYear: "",
              ),
              devolution: null,
            );

            storeRent.updateRent(rent);
          } else {
            final rent = Rent(
              rentStart: formData['rentStart'],
              rentEnd: formData['rentEnd'],
              customer: Customer(
                id: formData['customerId'],
                name: "",
                address: "",
                city: "",
                email: "",
              ),
              book: Book(
                id: formData['bookId'],
                name: "",
                author: "",
                publisher: null,
                quantity: "",
                realeaseYear: "",
              ),
              devolution: null,
            );

            storeRent.createRent(rent);
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
                title:
                    widget.id!.isNotEmpty ? "Editar Aluguel" : "Criar Aluguel",
                backRoute: '/rents/',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Form(
                  key: formKey,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: [
                      SelectInput(
                        title: 'Livros',
                        value: formData['bookId'],
                        list: storeBook.books,
                        onChange: (String? bookId) => {
                          setState(() => {
                                formData['bookId'] = bookId ?? '',
                              }),
                        },
                      ),
                      SelectInput(
                        title: 'Clientes',
                        value: formData['customerId'],
                        list: storeCustomer.customers,
                        onChange: (String? customerId) => {
                          setState(() => {
                                formData['customerId'] = customerId ?? '',
                              }),
                        },
                      ),
                      DateInput(
                        key: Key(formData['rentStart'].toString()),
                        title: 'Início do aluguel',
                        initialValue: formData['rentStart'],
                        onTap: () async {
                          final String? date = formData['rentStart'];

                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: date != null
                                ? DateTime.parse(date)
                                : DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate:
                                DateTime.now().add(const Duration(days: 365)),
                          );

                          if (pickedDate != null) {
                            String formattedDate = DateFormat('yyyy-MM-dd')
                                .format(pickedDate)
                                .toString();

                            setState(() {
                              formData['rentStart'] = formattedDate;
                            });
                          }
                        },
                      ),
                      DateInput(
                        key: Key(formData['rentEnd'].toString()),
                        title: 'Fim do aluguel',
                        initialValue: formData['rentEnd'],
                        onTap: () async {
                          final String? date = formData['rentEnd'];

                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: date != null
                                ? DateTime.parse(date)
                                : DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate:
                                DateTime.now().add(const Duration(days: 365)),
                          );

                          if (pickedDate != null) {
                            String formattedDate = DateFormat('yyyy-MM-dd')
                                .format(pickedDate)
                                .toString();

                            setState(() {
                              formData['rentEnd'] = formattedDate;
                            });
                          }
                        },
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
