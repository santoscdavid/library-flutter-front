import 'package:mobx/mobx.dart';

part 'routes_controller.g.dart';

class RoutesController = RoutesBase with _$RoutesController;

abstract class RoutesBase with Store {
  @observable
  int selectedIndex = 0;

  @action
  void changeIndex(newIndex) {
    selectedIndex = newIndex;
  }
}
