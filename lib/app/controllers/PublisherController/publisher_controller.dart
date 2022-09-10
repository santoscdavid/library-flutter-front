import 'package:flutter_modular/flutter_modular.dart';
import 'package:library_flutter/app/utils/custom_snackbars.dart';
import 'package:library_flutter/app/utils/global_scaffold.dart';
import 'package:library_flutter/data/repository/PublishersRepository/publishers_repository.dart';
import 'package:library_flutter/domain/models/Publisher/publisher.dart';
import 'package:mobx/mobx.dart';

part 'publisher_controller.g.dart';

class PublisherController = PublisherControllerBase with _$PublisherController;

abstract class PublisherControllerBase with Store {
  final PublishersRepository repository;

  PublisherControllerBase(this.repository) {
    getAllPublishers();
  }

  @observable
  List<Publisher> publishers = [];

  @observable
  List<Publisher> cachedPublishers = [];

  @action
  getAllPublishers() async {
    publishers = await repository.getAll();
    cachedPublishers = publishers;
  }

  @action
  filter(String value) async {
    if (value.isEmpty) {
      publishers = cachedPublishers;
    }

    List<Publisher> list = publishers
        .where(
          (e) =>
              e.id.toString().toLowerCase().contains(
                    value.toString(),
                  ) ||
              e.name.toString().toLowerCase().contains(
                    (value.toLowerCase()),
                  ) ||
              e.city.toString().toLowerCase().contains(
                    (value.toLowerCase()),
                  ),
        )
        .toList();

    publishers = list;
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
      CustomSnackBar().error('Erro ao tentar editar a editora');
    } finally {
      await getAllPublishers();
    }
  }

  deletePublisher(Publisher publisher) async {
    {
      try {
        await repository.delete(publisher).then(
              (res) => {
                CustomSnackBar().success('Editora editada com sucesso!'),
                Modular.to.pop()
              },
            );
      } catch (err) {
        CustomSnackBar().error('Erro ao tentar apagar a editora');
      } finally {
        await getAllPublishers();
      }
    }
  }
}
