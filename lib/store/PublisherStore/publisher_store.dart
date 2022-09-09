import 'package:flutter_modular/flutter_modular.dart';
import 'package:library_flutter/models/Publisher/publisher.dart';
import 'package:library_flutter/repository/PublishersRepository/publishers_repository.dart';
import 'package:library_flutter/utils/custom_snackbars.dart';
import 'package:library_flutter/utils/global_scaffold.dart';
import 'package:mobx/mobx.dart';

part 'publisher_store.g.dart';

class PublisherStore = PublisherStoreBase with _$PublisherStore;

abstract class PublisherStoreBase with Store {
  final PublishersRepository repository;

  PublisherStoreBase(this.repository) {
    getAllPublishers();
  }

  @observable
  List<Publisher> publishers = [];

  @action
  getAllPublishers() async {
    publishers = await repository.getAll();
  }

  @action
  createPublisher(Publisher publisher) async {
    try {
      await repository.post(publisher).then(
            (res) => showSnackbar(
              CustomSnackBar().success('Editora cadastrada com sucesso!'),
            ),
          );
      Modular.to.navigate('/publishers/');
    } catch (err) {
      CustomSnackBar().success('Erro ao tentar cadastrar editora');
    } finally {
      await getAllPublishers();
    }
  }

  @action
  updatePublisher(Publisher publisher) async {
    try {
      await repository.put(publisher).then(
            (res) => showSnackbar(
              CustomSnackBar().success('Editora editada com sucesso!'),
            ),
          );
      Modular.to.navigate('/publishers/');
    } catch (err) {
      CustomSnackBar().success('Erro ao tentar editar a editora');
    } finally {
      await getAllPublishers();
    }
  }
}
