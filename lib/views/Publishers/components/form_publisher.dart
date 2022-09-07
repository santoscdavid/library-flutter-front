import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:library_flutter/components/AppBar/custom_appbar.dart';
import 'package:library_flutter/components/ReturnButton/return_button.dart';

class FormPublisher extends StatelessWidget {
  const FormPublisher(this.id, {Key? key}) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => Scaffold(
              appBar: const CustomAppBar(),
              body: id.isNotEmpty
                  ? SafeArea(
                      child: Column(
                        children: const [
                          ReturnButton(
                            "Editar Editora",
                            backRoute: '/publishers/',
                          ),
                        ],
                      ),
                    )
                  : SafeArea(
                      child: Column(
                        children: const [
                          ReturnButton(
                            "Criar Editora",
                            backRoute: '/publishers/',
                          ),
                        ],
                      ),
                    ),
            ));
  }
}
