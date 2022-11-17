import 'package:flutter/material.dart';
import 'package:macro_projeto/Modulos/database/base.dart';
import 'package:macro_projeto/Modulos/database/produto_base.dart';
import 'package:macro_projeto/Modulos/form/form_controller.dart';
import 'package:macro_projeto/shared/models/user_model.dart';
import 'package:provider/provider.dart';

import '../../shared/auth/auth_controller.dart';

class FormUser extends StatefulWidget {
  const FormUser({Key? key, required this.taskContext}) : super(key: key);

  final BuildContext taskContext;

  @override
  State<FormUser> createState() => _FormUserState();
}

class _FormUserState extends State<FormUser> {
  // TextEditingController idcontroller    = TextEditingController();
  TextEditingController nomecontroller = TextEditingController();
  TextEditingController perfilcontroller = TextEditingController();
  List<Usuario> usuarios = [];

  final controller = FormController();
  final _formKey = GlobalKey<FormState>();
  ProdutoDao repository = ProdutoDao();
  // var produtos = ProdutoDao.countAll();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Novo usuario'),
        ),
        body: Center(
          child: SingleChildScrollView(
            // ignore: sized_box_for_whitespace
            child: Container(
              height: 650,
              width: 375,
              // decoration: BoxDecoration(
              //   color: Colors.black12,
              //   borderRadius: BorderRadius.circular(10),
              //   border: Border.all(width: 3),
              // ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // DESCRIÇÂO
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (String? value) {
                          if (controller.valueDesc(value)) {
                            return 'Insira o nome';
                          }
                          return null;
                        },
                        controller: nomecontroller,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'nome',
                          labelText: 'nome',
                          // labelStyle: TextAlign.center,
                          fillColor: Colors.white70,
                          filled: true,
                        ),
                      ),
                    ),
                    // APLICAÇÃO
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (String? value) {
                          if (controller.valueApli(value)) {
                            return 'Insira qual o perfil';
                          }
                          return null;
                        },
                        controller: perfilcontroller,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'perfil',
                          labelText: 'perfil',
                          fillColor: Colors.white70,
                          filled: true,
                        ),
                      ),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ContactDao(auth: context.read<AuthController>())
                              .save(Usuario(
                            nomecontroller.text,
                            perfilcontroller.text,
                          ));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Adicionando um novo produto'),
                            ),
                          );
                          Navigator.pop(context);
                        }
                      },
                      child: const Text('Adicionar!'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
