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
    final store = Modular.get<PublisherStore>();

    return Observer(
      builder: (_) => Scaffold(
        appBar: const CustomAppBar(false),
        body: store.publishers.isNotEmpty
            ? SingleChildScrollView(
                child: SafeArea(
                  child: ListPublishers(listPubs: store.publishers),
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
        bottomNavigationBar: const CustomBottomBar(),
      ),
    );
  }
}
