import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:library_flutter/presentation/components/AddButton/add_button.dart';
import 'package:library_flutter/presentation/components/AppBar/custom_appbar.dart';
import 'package:library_flutter/presentation/views/Rents/components/list_Rents.dart';
import '../../components/BottomBar/custom_bottom_bar.dart';

class RentsPage extends StatelessWidget {
  const RentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        appBar: const CustomAppBar(),
        body: const SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            child: ListRents(),
          ),
        ),
        bottomNavigationBar: const CustomBottomBar(),
        floatingActionButton: AddButton(
          function: () => {
            Modular.to.navigate("/rents/form/"),
          },
        ),
      );
    });
  }
}
