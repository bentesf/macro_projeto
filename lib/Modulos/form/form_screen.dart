import 'package:flutter/material.dart';
import 'package:macro_projeto/Modulos/database/produto_base.dart';
import 'package:macro_projeto/Modulos/form/form_controller.dart';
import 'package:macro_projeto/shared/models/produto_model.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key, required this.taskContext}) : super(key: key);

  final BuildContext taskContext;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  // TextEditingController idcontroller    = TextEditingController();
  String? idcontroller;
  TextEditingController desccontroller = TextEditingController();
  TextEditingController aplicontroller = TextEditingController();
  TextEditingController forncontroller = TextEditingController();
  TextEditingController classcontroller = TextEditingController();
  TextEditingController pericontroller = TextEditingController();
  TextEditingController tipocontroller = TextEditingController();
  TextEditingController nomqcontroller = TextEditingController();
  TextEditingController impucontroller = TextEditingController();
  TextEditingController cascontroller = TextEditingController();
  TextEditingController concecontroller = TextEditingController();
  TextEditingController localcontroller = TextEditingController();
  List<Produto> produtos = [];

  final controller = FormController();
  final _formKey = GlobalKey<FormState>();
  ProdutoDao repository = ProdutoDao();
  // var produtos = ProdutoDao.countAll();
  @override
  Widget build(BuildContext context) {
    _recuperarProdutos();
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Novo Produto ID- ${produtos.length + 1}'),
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
                          hintText: 'Desc. Produto',
                          labelText: 'Desc. Produto',
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
                            return 'Insira qual a aplicação';
                          }
                          return null;
                        },
                        controller: aplicontroller,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Aplicação',
                          labelText: 'Aplicação',
                          fillColor: Colors.white70,
                          filled: true,
                        ),
                      ),
                    ),
                    // FORNECEDOR
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (String? value) {
                          if (controller.valueForn(value)) {
                            return 'Insira fornecedor';
                          }
                          return null;
                        },
                        controller: forncontroller,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Fornecedor',
                          labelText: 'Fornecedor',
                          fillColor: Colors.white70,
                          filled: true,
                        ),
                      ),
                    ),
                    // CLASSIFICAÇÃO
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (String? value) {
                          if (controller.valueClass(value)) {
                            return 'Insira a classificação';
                          }
                          return null;
                        },
                        controller: classcontroller,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Classificação',
                          labelText: 'Classificação',
                          fillColor: Colors.white70,
                          filled: true,
                        ),
                      ),
                    ),
                    // PERIGOS
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (String? value) {
                          if (controller.valuePeri(value)) {
                            return 'Insira o nivel de perigo';
                          }
                          return null;
                        },
                        controller: pericontroller,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Perigo',
                          labelText: 'Perigo',
                          fillColor: Colors.white70,
                          filled: true,
                        ),
                      ),
                    ),
                    // TIPO
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (String? value) {
                          if (controller.valueTipo(value)) {
                            return 'Informe o Armazenamento';
                          }
                          return null;
                        },
                        controller: tipocontroller,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Armazenamento',
                          labelText: 'Armazenamento',
                          fillColor: Colors.white70,
                          filled: true,
                        ),
                      ),
                    ),
                    // NOME QUIMICO
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (String? value) {
                          if (controller.valueNomq(value)) {
                            return 'Insira a N.Quimico';
                          }
                          return null;
                        },
                        controller: nomqcontroller,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Nome Quimico',
                          labelText: 'Nome Quimico',
                          fillColor: Colors.white70,
                          filled: true,
                        ),
                      ),
                    ),
                    // IMPUREZAS
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (String? value) {
                          if (controller.valueImp(value)) {
                            return 'Insira as impurezas';
                          }
                          return null;
                        },
                        controller: impucontroller,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Impurezas',
                          labelText: 'Impurezas',
                          fillColor: Colors.white70,
                          filled: true,
                        ),
                      ),
                    ),
                    // CAS
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (String? value) {
                          if (controller.valueCas(value)) {
                            return 'Insira o N° CAS';
                          }
                          return null;
                        },
                        controller: cascontroller,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'CAS',
                          labelText: 'CAS',
                          fillColor: Colors.white70,
                          filled: true,
                        ),
                      ),
                    ),
                    // CONCENTRAÇÃO
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (String? value) {
                          if (controller.valueConc(value)) {
                            return 'Insira a Concentração';
                          }
                          return null;
                        },
                        controller: concecontroller,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Concentração',
                          labelText: 'Concentração',
                          fillColor: Colors.white70,
                          filled: true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (String? value) {
                          if (controller.valueConc(value)) {
                            return 'Insira a Area';
                          }
                          return null;
                        },
                        controller: localcontroller,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Local',
                          labelText: 'Local',
                          fillColor: Colors.white70,
                          filled: true,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ProdutoDao().save(Produto(
                            idcontroller = produtos.length.toString(),
                            desccontroller.text,
                            aplicontroller.text,
                            forncontroller.text,
                            classcontroller.text,
                            pericontroller.text,
                            tipocontroller.text,
                            nomqcontroller.text,
                            impucontroller.text,
                            cascontroller.text,
                            concecontroller.text,
                            localcontroller.text,
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
      produtos = lista;
    });
  }
}
