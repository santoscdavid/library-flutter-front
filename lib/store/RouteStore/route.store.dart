import 'package:mobx/mobx.dart';

part 'route.store.g.dart';

class RouteStore = RouteBase with _$RouteStore;

abstract class RouteBase with Store {
  @observable
  int index = 0;

  @action
  void changeIndex(newIndex) {
    index = newIndex;
  }
}
