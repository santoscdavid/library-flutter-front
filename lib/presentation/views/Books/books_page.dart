import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:library_flutter/presentation/components/AddButton/add_button.dart';
import 'package:library_flutter/presentation/components/AppBar/custom_appbar.dart';
import 'package:library_flutter/presentation/components/BottomBar/custom_bottom_bar.dart';
import 'package:library_flutter/presentation/views/Books/components/list_books.dart';

class BooksPage extends StatelessWidget {
  const BooksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        appBar: const CustomAppBar(),
        body: const SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            child: ListBooks(),
          ),
        ),
        bottomNavigationBar: const CustomBottomBar(),
        floatingActionButton: AddButton(
          function: () => {
            Modular.to.navigate("/books/form/"),
          },
        ),
      );
    });
  }
}
