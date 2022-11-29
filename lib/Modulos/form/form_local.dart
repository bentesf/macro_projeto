import 'package:flutter/material.dart';
import 'package:macro_projeto/Modulos/database/base.dart';
import 'package:macro_projeto/Modulos/form/form_controller.dart';
import 'package:macro_projeto/shared/models/user_model.dart';

class FormLocal extends StatefulWidget {
  const FormLocal({Key? key, required this.taskContext}) : super(key: key);

  final BuildContext taskContext;

  @override
  State<FormLocal> createState() => _FormLocalState();
}

class _FormLocalState extends State<FormLocal> {
  // TextEditingController idcontroller    = TextEditingController();
  String? idcontroller;
  TextEditingController desccontroller = TextEditingController();
  TextEditingController areacontroller = TextEditingController();
  TextEditingController capcontroller = TextEditingController();

  List<Usuario> usuarios = [];

  final controller = FormController();
  final _formKey = GlobalKey<FormState>();
  ContactDao repository = ContactDao();
  // var usuarios = ContactDao.countAll();
  @override
  Widget build(BuildContext context) {
    _recuperarProdutos();
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Novo Local ID- ${usuarios.length + 1}'),
        ),
        body: Center(
          child: SingleChildScrollView(
            // ignore: sized_box_for_whitespace
            child: Container(
              height: 650,
              width: 375,
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
                            return 'Insira a descrição';
                          }
                          return null;
                        },
                        controller: desccontroller,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Desc. Local',
                          labelText: 'Desc. Local',
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
                            return 'Insira qual a area';
                          }
                          return null;
                        },
                        controller: areacontroller,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Area',
                          labelText: 'Area',
                          fillColor: Colors.white70,
                          filled: true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (String? value) {
                          if (controller.valueApli(value)) {
                            return 'Insira qual a capacidade';
                          }
                          return null;
                        },
                        controller: capcontroller,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Capacidade',
                          labelText: 'Capacidade',
                          fillColor: Colors.white70,
                          filled: true,
                        ),
                      ),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ContactDao().save(Usuario(
                            desccontroller.text,
                            areacontroller.text,
                            capcontroller.text,
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

  _recuperarProdutos() async {
    var lista = await repository.findAll();
    setState(() {
      usuarios = lista;
    });
  }
}
