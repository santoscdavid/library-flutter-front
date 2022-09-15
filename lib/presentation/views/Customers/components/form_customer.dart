import 'package:design_system_library_flutter/app/components/commom/Inputs/FormInput/form_input.dart';
import 'package:design_system_library_flutter/app/components/desktop/Buttons/CustomButton/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:library_flutter/app/controllers/CustomerController/customer_controller.dart';
import 'package:library_flutter/domain/models/Customer/customer.dart';
import 'package:library_flutter/presentation/components/AppBar/custom_appbar.dart';
import 'package:library_flutter/presentation/components/ReturnButton/return_button.dart';

class FormCustomer extends StatefulWidget {
  final String? id;
  final String? name;
  final String? email;
  final String? city;
  final String? address;

  const FormCustomer({
    Key? key,
    this.id,
    this.name,
    this.email,
    this.city,
    this.address,
  }) : super(key: key);

  @override
  State<FormCustomer> createState() => _FormCustomerState();
}

class _FormCustomerState extends State<FormCustomer> {
  final store = Modular.get<CustomerController>();

  final formKey = GlobalKey<FormState>();
  final formData = <String, String>{};

  final nameFocus = FocusNode();
  final emailFocus = FocusNode();
  final addressFocus = FocusNode();
  final cityFocus = FocusNode();

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
      if (widget.name != null) {
        formData["email"] = widget.email!;
      }
      if (widget.city != null) {
        formData["city"] = widget.city!;
      }
      if (widget.name != null) {
        formData["address"] = widget.address!;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    void _submitForm() {
      final isValid = formKey.currentState?.validate() ?? false;

      if (!isValid) {
        return;
      } else {
        formKey.currentState?.save();

        if (formData["id"] != null && formData["id"] != "") {
          final customer = Customer(
            id: formData['id'],
            name: formData["name"],
            email: formData["email"],
            city: formData["city"],
            address: formData["address"],
          );

          store.updateCustomer(customer);
        } else {
          final customer = Customer(
            name: formData["name"],
            email: formData["email"],
            city: formData["city"],
            address: formData["address"],
          );

          store.createCustomer(customer);
        }
      }
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
                    widget.id!.isNotEmpty ? "Editar Cliente" : "Criar Cliente",
                backRoute: '/customers/',
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
                        initialValue: formData["name"],
                        icon: const Icon(Icons.abc),
                        margin: 10.0,
                        focus: nameFocus,
                        changeFocus: cityFocus,
                        onSave: (name) => {
                          formData['name'] = name ?? '',
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
                        title: 'Email',
                        initialValue: formData["email"],
                        icon: const Icon(Icons.email),
                        margin: 10.0,
                        focus: emailFocus,
                        onSave: (email) => {
                          formData['email'] = email ?? '',
                        },
                        validator: (text) {
                          final email = text ?? '';

                          if (email.trim().isEmpty) {
                            return 'Email é obrigatório';
                          }

                          String pattern =
                              r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                              r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                              r"{0,253}[a-zA-Z0-9])?)*$";
                          RegExp regex = RegExp(pattern);
                          if (!regex.hasMatch(email)) {
                            return 'Informe um email valido';
                          }

                          return null;
                        },
                      ),
                      FormInput(
                        title: 'Cidade',
                        initialValue: formData["city"],
                        icon: const Icon(Icons.apartment),
                        margin: 10.0,
                        focus: cityFocus,
                        onSave: (city) => {
                          formData['city'] = city ?? '',
                        },
                        validator: (text) {
                          final city = text ?? '';

                          if (city.trim().isEmpty) {
                            return 'Cidade é obrigatório';
                          }

                          return null;
                        },
                      ),
                      FormInput(
                        title: 'Endereço',
                        initialValue: formData["address"],
                        icon: const Icon(Icons.home),
                        margin: 10.0,
                        focus: addressFocus,
                        onSave: (city) => {
                          formData['address'] = city ?? '',
                        },
                        validator: (text) {
                          final city = text ?? '';

                          if (city.trim().isEmpty) {
                            return 'Endereço é obrigatório';
                          }

                          return null;
                        },
                      ),
                      CustomButton(
                        margin: 10.0,
                        function: () => _submitForm,
                        child: const Text('Salvar'),
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
