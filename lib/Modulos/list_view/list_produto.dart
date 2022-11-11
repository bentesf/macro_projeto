import 'package:flutter/material.dart';
import 'package:macro_projeto/Modulos/database/produto_base.dart';
import 'package:macro_projeto/Modulos/list_view/detalhes.dart';
import 'package:macro_projeto/shared/models/produto_model.dart';

class ProdutosCad extends StatefulWidget {
    const ProdutosCad({Key? key, required this.taskContext}) : super(key: key);

  final BuildContext taskContext;
  @override
  // ignore: library_private_types_in_public_api
  _ProdutosCadState createState() => _ProdutosCadState();
}

class _ProdutosCadState extends State<ProdutosCad> {
  ProdutoDao repository = ProdutoDao();

  List<Produto> produtos = [];

  @override
  Widget build(BuildContext context) {
    _recuperarProdutos();
    return Scaffold(
      appBar: _appBar(),
      // floatingActionButton: _floatingActionButton(),
      body: _body(),
    );
  }
  AppBar _appBar() {
    return AppBar(
      title: const Text("Produtos"),
    );
  }

  _body() {
    return Container(
      color: Colors.white ,
      child: ListView.builder(
        itemCount: produtos.length,
        itemBuilder: (BuildContext context, int index) {
          Produto produto = produtos[index];
          return Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 0.5,
                  color: Colors.amber.withOpacity(0.6),
                ),
              ),
            ),
            child: ListTile(
              title: Text(produto.descricao),
              subtitle: const Text("Status "),
              trailing: CircleAvatar(
                backgroundColor: _cor((index%2) ==0 ? 1:2),
              ),
              onTap: () {
                Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                         const Detalhes()));
              },
            ),
          );
        },
      ),
    );
  }

  Color _cor(int situacao) {
    Color cor;
      if(situacao==1){
        cor = const Color.fromARGB(255, 3, 201, 105).withOpacity(0.5);
      }else{
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
}