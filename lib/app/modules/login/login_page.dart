import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:igreja_izau/app/core/storage/secure_storage.dart';
import 'package:igreja_izau/app/modules/login/controller/login_controller.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  final LoginController controller;

  const LoginPage({Key? key, required this.controller}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  //TODO Mudar quando implementar
  final _emailEC = TextEditingController(text: "secretaria");
  final _passwordEC = TextEditingController(text: "sec.adporto.madureira");

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginController, LoginState>(
      bloc: widget.controller,
      listener: ((context, state) async {
        if (state.status == LoginStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message ?? 'Erro interno'),
            ),
          );
        } else if (state.token != null) {
          SecureStorage.instance.write(key: "token", value: state.token);
          Navigator.pushNamed(context, "/home/");
        }
      }),
      child: Scaffold(
        body: Center(
          child: Container(
            width: 400,
            height: 520,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20.0),
                      child: CircleAvatar(
                        radius: 50,
                      )),
                  const Text(
                    'Bem - vindo',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(thickness: 2, color: Colors.black54),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextFormField(
                      controller: _emailEC,
                      validator: Validatorless.multiple(
                        [
                          Validatorless.required('Email / Usuário obrigatório'),
                        ],
                      ),
                      decoration: const InputDecoration(
                        labelText: 'E-mail / Usuário',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextFormField(
                      controller: _passwordEC,
                      obscureText: true,
                      decoration: const InputDecoration(
                          labelText: 'Senha',
                          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final formValid = _formKey.currentState?.validate() ?? false;
                      if (formValid) {
                        await widget.controller
                            .login(email: _emailEC.text, password: _passwordEC.text);
                      }
                    },
                    style: ElevatedButton.styleFrom(minimumSize: const Size(250, 50)),
                    child: const Text('Entrar'),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text('Ainda não tem cadastro?'),
                            TextButton(
                              onPressed: () {},
                              child: const Text('Registre-se'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
