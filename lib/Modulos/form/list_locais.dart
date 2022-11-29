import 'package:anchor_scroll_controller/anchor_scroll_controller.dart';
import 'package:flutter/material.dart';

import '../../shared/models/produto_model.dart';
import '../database/produto_base.dart';
import '../list_view/detalhes.dart';

class ProdLocais extends StatefulWidget {
  const ProdLocais({Key? key, required this.area}) : super(key: key);

  final String area;
  @override
  State<ProdLocais> createState() => _ProdLocaisState();
}

class _ProdLocaisState extends State<ProdLocais> {
  ProdutoDao repository = ProdutoDao();

  List<Produto> produtos = [];
  late final AnchorScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = AnchorScrollController(
      onIndexChanged: (index, userScroll) {
        if (userScroll) {
          (index);
        }
      },
    );
  }

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
      color: Colors.white,
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
                backgroundColor: _cor((index % 2) == 0 ? 1 : 2),
              ),
              onTap: () {
                _scrollController.scrollToIndex(index: index);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Detalhes(
                              produtos: produtos[index],
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
    var lista = await repository.find(widget.area);
    setState(() {
      produtos = lista;
    });
  }
}
