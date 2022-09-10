import 'package:mobx/mobx.dart';

part 'route_controller.g.dart';

class RouteController = RouteControllerBase with _$RouteController;

abstract class RouteControllerBase with Store {
  @observable
  int index = 0;

  @action
  void changeIndex(newIndex) {
    index = newIndex;
  }
}
