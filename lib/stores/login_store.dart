import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {

  _LoginStore(){
    autorun((_){
      print(isFormValid);
    });
  }
  
  @observable
  String email = '';

  @action
  void setEmail(String value) {
    email = value;
  }

  @observable
  String password = '';

  @action
  void setPassword(String value) => password = value;

  @computed
  bool get isEmailValid =>
      RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
        .hasMatch(email);

  @computed
  bool get isPasswordValid => password.length > 6;


  @computed
  bool get isFormValid => isEmailValid && isPasswordValid;


  // ----------------------


  @observable
  bool obscure = true;

  @action
  void setObscure() => obscure = !obscure;

  // ----------------------

  @observable
  bool loading = false;

  @action
  Future<void> login() async{
    loading = true;
    
    await Future.delayed(Duration(seconds: 2));

    loading = false;

  }
}
