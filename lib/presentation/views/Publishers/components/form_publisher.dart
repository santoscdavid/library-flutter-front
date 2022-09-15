import 'package:design_system_library_flutter/app/components/commom/Inputs/FormInput/form_input.dart';
import 'package:design_system_library_flutter/app/components/desktop/Buttons/CustomButton/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:library_flutter/app/controllers/PublisherController/publisher_controller.dart';
import 'package:library_flutter/domain/models/Publisher/publisher.dart';
import 'package:library_flutter/presentation/components/AppBar/custom_appbar.dart';
import 'package:library_flutter/presentation/components/ReturnButton/return_button.dart';

class FormPublisher extends StatefulWidget {
  final String? id;
  final String? name;
  final String? city;

  const FormPublisher({
    Key? key,
    this.id,
    this.name,
    this.city,
  }) : super(key: key);

  @override
  State<FormPublisher> createState() => _FormPublisherState();
}

class _FormPublisherState extends State<FormPublisher> {
  final store = Modular.get<PublisherController>();

  final formKey = GlobalKey<FormState>();
  final formData = <String, String>{};

  final nameFocus = FocusNode();
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
      if (widget.city != null) {
        formData["city"] = widget.city!;
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
          final publisher = Publisher(
            id: formData['id'],
            name: formData["nome"],
            city: formData["cidade"],
          );

          store.updatePublisher(publisher);
        } else {
          final publisher = Publisher(
            name: formData["nome"],
            city: formData["cidade"],
          );

          store.createPublisher(publisher);
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
                    widget.id!.isNotEmpty ? "Editar Editora" : "Criar editora",
                backRoute: '/publishers/',
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
                          formData['nome'] = name ?? '',
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
                        title: 'Cidade',
                        initialValue: formData['city'],
                        icon: const Icon(Icons.location_city),
                        margin: 10.0,
                        focus: cityFocus,
                        onSave: (city) => {
                          formData['cidade'] = city ?? '',
                        },
                        validator: (text) {
                          final city = text ?? '';

                          if (city.trim().isEmpty) {
                            return 'Cidade é obrigatório';
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
