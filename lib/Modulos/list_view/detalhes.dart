import 'package:flutter/material.dart';
import 'package:macro_projeto/Modulos/database/produto_base.dart';

import '../../shared/models/produto_model.dart';
import '../form/form_local.dart';

// ignore: must_be_immutable
class Detalhes extends StatefulWidget {
  Produto produtos;
  Detalhes({super.key, required this.produtos});

  @override
  // ignore: library_private_types_in_public_api
  _DetalhesState createState() => _DetalhesState();
}

class _DetalhesState extends State<Detalhes> {
  // final CategoriesScroller categoriesScroller = const CategoriesScroller();
  ProdutoDao repository = ProdutoDao();

  ScrollController controller = ScrollController();

  bool closeTopContainer = false;
  double topContainer = 0;

  List<Widget> itemsData = [];
  //   responseList = widget.produtos;
  // void getPostsData() {
  //   // _recuperarProdutos();
  //   List<Widget> listItems = [];
  //   // ignore: avoid_function_literals_in_foreach_calls
  //   responseList.forEach((post) {
  //     listItems.add(

  //   });

  /*    Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.amber,
            height: 10,
            // width: 325,
            child: Column(
              children: [
                Container(
                    height: 170,
                    width: 325,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20.0)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(255, 14, 112, 231)
                                  .withAlpha(100),
                              blurRadius: 10.0),
                        ]),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      post.descricao,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      post.aplicacao,
                                      style: const TextStyle(
                                          fontSize: 13, color: Colors.grey),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      post.fornecedor,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                // Image.asset(
                                //   "assets/images/${post["image"]}",
                                //   height: double.infinity,
                                // )
                              ],
                            ),
                          ],
                        ),
                      ),
                    )),
                //identificação
                Container(
                    height: 170,
                    width: 325,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20.0)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(255, 161, 52, 52)
                                  .withAlpha(100),
                              blurRadius: 10.0),
                        ]),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  post.descricao,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  post.aplicacao,
                                  style: const TextStyle(
                                      fontSize: 13, color: Colors.grey),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  post.fornecedor,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            // Image.asset(
                            //   "assets/images/${post["image"]}",
                            //   height: double.infinity,
                            // )
                          ],
                        ),
                      ),
                    )),
                Container(
                    height: 170,
                    width: 325,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20.0)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(255, 7, 158, 45)
                                  .withAlpha(100),
                              blurRadius: 10.0),
                        ]),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      post.descricao,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      post.aplicacao,
                                      style: const TextStyle(
                                          fontSize: 13, color: Colors.grey),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      post.fornecedor,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                // Image.asset(
                                //   "assets/images/${post["image"]}",
                                //   height: double.infinity,
                                // )
                              ],
                            ),
                          ],
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ));
    */
  // });
  // setState(() {
  //   itemsData = listItems;
  // responseList = widget.produtos;
  // });
  // }

  @override
  void initState() {
    super.initState();
    // responseList = [];
    // getPostsData();
    controller.addListener(() {
      double value = controller.offset / 119;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Produto responseList = widget.produtos;
    final Size size = MediaQuery.of(context).size;
    // final double categoryHeight = size.height * 0.30;
    return SafeArea(
        child: Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (contextNew) => FormLocal(
      //           taskContext: context,
      //         ),
      //       ),
      //     ).then((value) => setState(() {}));
      //   },
      //   child: const Icon(Icons.add),
      // ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        // leading:
        // const Icon(
        //   Icons.menu,
        //   color: Colors.black,
        // ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search,
                color: Color.fromARGB(255, 255, 255, 255)),
            onPressed: () {},
          ),
          // IconButton(
          //   icon: const Icon(Icons.person, color: Colors.black),
          //   onPressed: () {},
          // )
        ],
      ),
      // ignore: sized_box_for_whitespace
      body: Container(
        height: size.height,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const <Widget>[
                Text(
                  "Informações",
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: FittedBox(
                  fit: BoxFit.fill,
                  alignment: Alignment.topCenter,
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 350,
                        margin: const EdgeInsets.only(right: 20),
                        height: 550,
                        decoration: const BoxDecoration(
                            color: Colors.blue,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text(
                                "Identificação\n",
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Produto:",
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 11.0,
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: responseList.descricao,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4
                                          ?.apply(
                                              color: Colors.white,
                                              fontWeightDelta: 2),
                                    ),
                                    const TextSpan(text: " ")
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 11.0,
                              ),
                              const Text(
                                "Aplicação:",
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 11.0,
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: responseList.aplicacao,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4
                                          ?.apply(
                                              color: Colors.white,
                                              fontWeightDelta: 2),
                                    ),
                                    const TextSpan(text: " ")
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 11.0,
                              ),
                              const Text(
                                "Fornecedor:",
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 11.0,
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: responseList.fornecedor,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4
                                          ?.apply(
                                              color: Colors.white,
                                              fontWeightDelta: 2),
                                    ),
                                    const TextSpan(text: " ")
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 11.0,
                              ),
                              const Text(
                                "CAS:",
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 11.0,
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: responseList.cas,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4
                                          ?.apply(
                                              color: Colors.white,
                                              fontWeightDelta: 2),
                                    ),
                                    const TextSpan(text: " ")
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 350,
                        margin: const EdgeInsets.only(right: 20),
                        height: 550,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 195, 70, 70),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text(
                                "Perigos!\n",
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Classificação:",
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 11.0,
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: responseList.classificacao,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4
                                          ?.apply(
                                              color: Colors.white,
                                              fontWeightDelta: 2),
                                    ),
                                    const TextSpan(text: " ")
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 11.0,
                              ),
                              const Text(
                                "Perigos:",
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 11.0,
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: responseList.perigos,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4
                                          ?.apply(
                                              color: Colors.white,
                                              fontWeightDelta: 2),
                                    ),
                                    const TextSpan(text: " ")
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 11.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 350,
                        margin: const EdgeInsets.only(right: 20),
                        height: 550,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 28, 175, 77),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text(
                                "Local\n",
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Tipo:",
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 11.0,
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: responseList.tipo,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4
                                          ?.apply(
                                              color: Colors.white,
                                              fontWeightDelta: 2),
                                    ),
                                    const TextSpan(text: " ")
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 11.0,
                              ),
                              const Text(
                                "Local:",
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 11.0,
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: responseList.local,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4
                                          ?.apply(
                                              color: Colors.white,
                                              fontWeightDelta: 2),
                                    ),
                                    const TextSpan(text: " ")
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 11.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                // If the button is pressed, return green, otherwise blue
                if (states.contains(MaterialState.pressed)) {
                  return Colors.green;
                }
                return Colors.blue;
              })),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Adicionando um nova reserva'),
                  ),
                );
                Navigator.pop(context);
              },
              // },
              child: const Text(
                'RESERVAR',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
