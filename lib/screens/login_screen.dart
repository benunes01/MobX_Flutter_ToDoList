import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todomobx/stores/login_store.dart';
import 'package:todomobx/widgets/custom_icon_button.dart';
import 'package:todomobx/widgets/custom_text_field.dart';

import 'list_screen.dart';

class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  LoginStore loginStore = LoginStore();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(32),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Icon(
                  
                  Icons.today,size: 150, color: Colors.white,
                ),
              ),
              Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 16,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        CustomTextField(
                          hint: 'E-mail',
                          prefix: Icon(Icons.account_circle),
                          textInputType: TextInputType.emailAddress,
                          onChanged: loginStore.setEmail,
                          enabled: true,
                        ),
                        const SizedBox(height: 16,),
                        Observer(
                          builder: (_){
                            return CustomTextField(
                              hint: 'Senha',
                              prefix: Icon(Icons.lock,),
                              obscure: loginStore.obscure,
                              onChanged: loginStore.setPassword,
                              enabled: true,
                              suffix: CustomIconButton(
                                radius: 32,
                                iconData: loginStore.obscure ? Icons.visibility_off : Icons.visibility,
                                onTap: (){
                                  loginStore.setObscure();
                                },
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 16,),
                        Observer(
                          builder: (_){
                            return SizedBox(
                              height: 44,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                child: Text('Login'),
                                color: Theme.of(context).primaryColor,
                                disabledColor: Theme.of(context).primaryColor.withAlpha(100),
                                textColor: Colors.white,
                                onPressed: loginStore.isFormValid ? (){
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(builder: (context)=>ListScreen())
                                  );
                                } : null,
                              ),
                            );
                          }
                        )
                      ],
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
