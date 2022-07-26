import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  void printParaTeste() {
    print("Print para teste");
  }

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
