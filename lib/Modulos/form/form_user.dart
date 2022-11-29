import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:macro_projeto/Modulos/database/base.dart';
import 'package:macro_projeto/Modulos/database/produto_base.dart';
import 'package:macro_projeto/Modulos/form/form_local.dart';
import 'package:macro_projeto/Modulos/list_view/detalhes.dart';
import 'package:macro_projeto/shared/models/user_model.dart';

import 'list_locais.dart';

class Locais extends StatefulWidget {
  const Locais({Key? key, required this.taskContext}) : super(key: key);

  final BuildContext taskContext;
  @override
  // ignore: library_private_types_in_public_api
  _LocaisState createState() => _LocaisState();
}

class _LocaisState extends State<Locais> {
  ContactDao repository = ContactDao();
  ProdutoDao repository2 = ProdutoDao();

  List<Usuario> produtos = [];

  @override
  Widget build(BuildContext context) {
    _recuperarProdutos();
    return Scaffold(
      appBar: _appBar(),
      // floatingActionButton: _floatingActionButton(),
      body: _body(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormLocal(
                taskContext: context,
              ),
            ),
          ).then((value) => setState(() {}));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text("Areas de Armazenagem"),
    );
  }

  _body() {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: produtos.length,
        itemBuilder: (BuildContext context, int index) {
          Usuario produto = produtos[index];
          int qtd = 20; //verificaquantidade(produto.area);
          int one = int.parse(produto.cap);
          double perc = qtd / (one / 100);
          return Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 0.5,
                  color: Color.fromARGB(255, 7, 23, 255).withOpacity(0.6),
                ),
              ),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: _cor(perc > 99 ? 2 : 1),
              ),
              title: Text("${produto.descri} \n"),
              subtitle: Text(
                  "${produto.area} - Ocupação : ${perc.toStringAsFixed(0)}%"),
              trailing: const Icon(Icons.dashboard),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProdLocais(
                              area: produto.area,
                            )));
              },
            ),
          );
        },
      ),
    );
  }

  Color _cor(int situacao) {
    Color cor;
    if (situacao == 1) {
      cor = const Color.fromARGB(255, 3, 201, 105).withOpacity(0.5);
    } else {
      cor = Colors.redAccent.withOpacity(0.5);
    }

    return cor;
  }

  _recuperarProdutos() async {
    var lista = await repository.findAll();
    setState(() {
      produtos = lista;
    });
  }

  verificaquantidade(String area) async {
    var lista = await repository2.find(area);
    return lista.length;
  }
}
