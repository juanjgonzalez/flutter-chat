import 'package:chat/helpers/show_alert.dart';
import 'package:chat/services/auth_service.dart';
import 'package:chat/widgets/button.dart';
import 'package:chat/widgets/input.dart';
import 'package:chat/widgets/labels.dart';
import 'package:chat/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF2F2F2),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Logo(
                    title: 'Registro',
                  ),
                  _Form(),
                  Labels(
                      title: 'ya tienes cuenta?',
                      subtitle: 'ingresa ahora',
                      route: 'login'),
                  Text(
                    'Terminos y condiciones de uso',
                    style: TextStyle(fontWeight: FontWeight.w200),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailctrl = TextEditingController();
  final passwordctrl = TextEditingController();
  final namectrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authservice = Provider.of<AuthService>(context);

    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomInput(
            icon: Icons.perm_identity,
            placeholder: 'Nombre',
            keyboardType: TextInputType.text,
            textController: namectrl,
          ),
          CustomInput(
            icon: Icons.mail_outline,
            placeholder: 'mail',
            keyboardType: TextInputType.emailAddress,
            textController: emailctrl,
          ),
          CustomInput(
            icon: Icons.lock_outline,
            placeholder: 'Password',
            keyboardType: TextInputType.visiblePassword,
            textController: passwordctrl,
            isPassword: true,
          ),
          CustomButton(
              text: 'Crear cuenta',
              onPressed: authservice.autenticando
                  ? null
                  : () async {
                      final registerOk = await authservice.register(
                          namectrl.text.trim(),
                          emailctrl.text,
                          passwordctrl.text.trim());
                      if (registerOk == true) {
                        Navigator.pushReplacementNamed(context, 'usuario');
                      } else {
                        showAlert(context, 'Registo incorrecto', registerOk);
                      }
                    })
        ],
      ),
    );
  }
}
