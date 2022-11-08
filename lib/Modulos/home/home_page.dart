import 'package:flutter/material.dart';
import 'package:macro_projeto/Modulos/form/form_screen.dart';
import 'package:macro_projeto/Modulos/home/home_controller.dart';
// import 'package:macro_projeto/temas/app_colors.dart';
// import 'package:macro_projeto/temas/app_images.dart';
// import 'package:macro_projeto/temas/app_text_styles.dart';

class HomePage extends StatefulWidget {
  final String name;
  // final String? carga;
  const HomePage({
    Key? key,
    required this.name,
    // this.carga,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  Icon add = const Icon(Icons.menu);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Ola,",
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.apply(color: Colors.grey[500]),
            ),
            Text(
              "Sr. ${widget.name}",
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.apply(color: Colors.blue, fontWeightDelta: 2),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Container(
              padding: const EdgeInsets.all(25.0),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    "Ultimas entradas",
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
                          text: "291.01",
                          style: Theme.of(context)
                              .textTheme
                              .headline3
                              ?.apply(color: Colors.white, fontWeightDelta: 2),
                        ),
                        const TextSpan(text: " m³")
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.lock, color: Colors.grey[300]),
                      const SizedBox(width: 5.0),
                      Text(
                        "Somando um total de: 1.0173 m³ no Mês",
                        style: TextStyle(color: Colors.grey[300]),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 11.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                          child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue),
                            padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 11.0),
                            ),
                            textStyle: MaterialStateProperty.all(
                                const TextStyle(
                                    fontSize: 14, color: Colors.white))),
                        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(
                taskContext: context,
              ),
            ),
          ).then((value) => setState(() {
                print('Recarregando a tela inicial');
              }));
        },
                        child: const Text(
                          'Materiais',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      )),
                      Flexible(
                          child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue),
                            padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 11.0),
                            ),
                            textStyle: MaterialStateProperty.all(
                                const TextStyle(
                                    fontSize: 14, color: Colors.white))),
                        onPressed: () {
                          setState(() {});
                        },
                        child: const Text(
                          'Locais',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      )),
                      Flexible(
                          child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue),
                            padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 11.0),
                            ),
                            textStyle: MaterialStateProperty.all(
                                const TextStyle(
                                    fontSize: 14, color: Colors.white))),
                        onPressed: () {
                          setState(() {});
                        },
                        child: const Text(
                          '+ info',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      )),
                    ],
                  )
                ],
              ),
            ),
            const Divider(
              height: 30,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    "Ultima vistoria",
                    style: Theme.of(context).textTheme.headline4?.apply(
                        color: const Color.fromARGB(158, 0, 0, 0),
                        fontWeightDelta: 2),
                  ),
                ),
                Icon(Icons.timelapse, color: Colors.black.withOpacity(.71)),
                Text(
                  "Ha 3 dias",
                  style: TextStyle(color: Colors.black.withOpacity(.71)),
                ),
              ],
            ),
            const Divider(
              height: 30,
            ),
            Row(
              children: <Widget>[
                Flexible(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Foram descartados",
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            ?.apply(color: Colors.blue, fontWeightDelta: 2),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Column(
                    children: <Widget>[
                      Text(
                        "17.000 m³",
                        style: Theme.of(context).textTheme.headline5?.apply(
                            color: const Color(0xff17dcb0), fontWeightDelta: 2),
                        textAlign: TextAlign.center,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                        ),
                        onPressed: () {
                          setState(() {});
                        },
                        child: const Text(
                          "Verificar",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
