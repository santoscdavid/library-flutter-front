import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:library_flutter/components/AppBar/custom_appbar.dart';
import 'package:library_flutter/components/CustomButton/custom_button.dart';
import 'package:library_flutter/components/FormInput/form_input.dart';
import 'package:library_flutter/components/ReturnButton/return_button.dart';
import '../../../models/Publisher/publisher.dart';

class FormPublisher extends StatelessWidget {
  const FormPublisher({
    Key? key,
    this.id,
    this.name,
    this.city,
  }) : super(key: key);

  final String? id;
  final String? name;
  final String? city;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final formData = <String, String>{};

    final nameFocus = FocusNode();
    final cityFocus = FocusNode();

    void _submitForm() {
      final isValid = formKey.currentState?.validate() ?? false;

      if (!isValid) {
        return;
      } else {
        formKey.currentState?.save();

        final publisher =
            Publisher(name: formData["nome"], city: formData["cidade"]);

        print(publisher.name);
        print(publisher.city);
      }
    }

    return Observer(
        builder: (_) => Scaffold(
              appBar: const CustomAppBar(),
              body: id!.isNotEmpty
                  ? SafeArea(
                      // TODO: Fazer Edição de editora
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const ReturnButton(
                            title: "Editar Editora",
                            backRoute: '/publishers/',
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Form(
                              key: formKey,
                              child: ListView(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                children: [
                                  FormInput(
                                    title: 'Nome',
                                    icon: const Icon(Icons.abc),
                                    margin: 10.0,
                                    onSave: (name) =>
                                        formData['nome'] = name ?? '',
                                    validator: (name) {
                                      final nome = name ?? '';

                                      if (nome.trim().isEmpty) {
                                        return 'Nome é obrigatório';
                                      }

                                      return null;
                                    },
                                  ),
                                  FormInput(
                                    title: 'Cidade',
                                    icon: const Icon(Icons.location_city),
                                    margin: 10.0,
                                    onSave: (city) =>
                                        formData['cidade'] = city ?? '',
                                    validator: (city) {
                                      final cidade = city ?? '';

                                      if (cidade.trim().isEmpty) {
                                        return 'Cidade é obrigatório';
                                      }

                                      return null;
                                    },
                                  ),
                                  CustomButton(
                                    margin: 10.0,
                                    function: () => _submitForm,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : SafeArea(
                      // TODO: Fazer Criação de editora
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const ReturnButton(
                            title: "Criar Editora",
                            backRoute: '/publishers/',
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Form(
                              key: formKey,
                              child: ListView(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                children: [
                                  FormInput(
                                    title: 'Nome',
                                    icon: const Icon(Icons.abc),
                                    margin: 10.0,
                                    focus: nameFocus,
                                    changeFocus: cityFocus,
                                    onSave: (name) => {
                                      formData['nome'] = name ?? '',
                                    },
                                    validator: (name) {
                                      final nome = name ?? '';

                                      if (nome.trim().isEmpty) {
                                        return 'Nome é obrigatório';
                                      }

                                      return null;
                                    },
                                  ),
                                  FormInput(
                                    title: 'Cidade',
                                    icon: const Icon(Icons.location_city),
                                    margin: 10.0,
                                    focus: cityFocus,
                                    onSave: (city) => {
                                      formData['cidade'] = city ?? '',
                                    },
                                    validator: (city) {
                                      final cidade = city ?? '';

                                      if (cidade.trim().isEmpty) {
                                        return 'Cidade é obrigatório';
                                      }

                                      return null;
                                    },
                                  ),
                                  CustomButton(
                                    margin: 10.0,
                                    function: () => _submitForm,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
            ));
  }
}
