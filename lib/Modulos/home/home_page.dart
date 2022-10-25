import 'package:flutter/material.dart';
import 'package:macro_projeto/Modulos/home/home_controller.dart';
import 'package:macro_projeto/temas/app_colors.dart';
import 'package:macro_projeto/temas/app_images.dart';
import 'package:macro_projeto/temas/app_text_styles.dart';

class HomePage extends StatefulWidget {
  final String name;
  final String? carga;
  const HomePage({
    Key? key,
    required this.name,
    this.carga,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(152),
          child: Container(
            height: 152,
            color: AppColors.primary,
            child: Center(
              child: ListTile(
                title: Text.rich(
                  TextSpan(
                      text: "\n\nOlá, ",
                      style: TextStyles.titleRegular,
                      children: [
                        TextSpan(
                            text: widget.name,
                            style: TextStyles.titleBoldBackground)
                      ]),
                ),
                subtitle: Text(
                  "\nConferencia de Embarque",
                  style: TextStyles.titleBoldBackground,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: const Text('Usuario '),
                accountEmail: Text(widget.name),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    AppImages.queiroz,
                    width: 50,
                    height: 50,
                  ), //FlutterLogo(size: 42.0),
                ),
                otherAccountsPictures: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(
                        Icons.exit_to_app_sharp,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, "/login");
                      },
                    ),
                  ),
                ],
              ),
              ListTile(
                title: const Text('Item 1'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Item 2'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: Container(),
        bottomNavigationBar: SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  icon: const Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    controller.setPage(0);
                    setState(() {});
                  }),
              const Spacer(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () async {
              // await Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => CodePage(widget.name)));
            }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
      onWillPop: () async {
        return false;
      },
    );
  }
}
