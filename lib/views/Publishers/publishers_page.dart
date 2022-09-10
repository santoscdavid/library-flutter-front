import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:library_flutter/components/AppBar/custom_appbar.dart';
import 'package:library_flutter/store/PublisherStore/publisher_store.dart';
import 'package:library_flutter/views/Publishers/components/list_publishers.dart';
import '../../components/BottomBar/custom_bottom_bar.dart';

class PublishersPage extends StatelessWidget {
  const PublishersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
        appBar: const CustomAppBar(),
        body: SingleChildScrollView(
          child: SafeArea(
            child: ListPublishers(),
          ),
        ),
        bottomNavigationBar: const CustomBottomBar(),
        floatingActionButton: FloatingActionButton(
          elevation: 2.0,
          onPressed: (() => {
                Modular.to.navigate("/publishers/form/"),
              }),
          child: Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Colors.purpleAccent,
                  Colors.purple,
                  Colors.deepPurple,
                ],
              ),
            ),
            child: const Icon(
              Icons.add,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
