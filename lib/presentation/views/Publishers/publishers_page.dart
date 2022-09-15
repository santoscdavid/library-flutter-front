import 'package:design_system_library_flutter/app/components/desktop/Buttons/AddButton/add_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:library_flutter/presentation/components/AppBar/custom_appbar.dart';
import 'package:library_flutter/presentation/views/Publishers/components/list_publishers.dart';
import '../../components/BottomBar/custom_bottom_bar.dart';

class PublishersPage extends StatelessWidget {
  const PublishersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
        appBar: const CustomAppBar(),
        body: const SingleChildScrollView(
          child: SafeArea(
            child: ListPublishers(),
          ),
        ),
        bottomNavigationBar: const CustomBottomBar(),
        floatingActionButton: AddButton(
          function: () => {
            Modular.to.navigate("/publishers/form/"),
          },
        ),
      ),
    );
  }
}
