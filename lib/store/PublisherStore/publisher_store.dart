import 'package:library_flutter/models/Publisher/publisher.dart';
import 'package:library_flutter/repository/PublishersRepository/publishers_repository.dart';
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
}
