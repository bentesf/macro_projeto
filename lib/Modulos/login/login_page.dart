import 'package:flutter/material.dart';
import 'package:macro_projeto/Modulos/home/home_page.dart';
import 'package:macro_projeto/temas/app_colors.dart';
import 'package:macro_projeto/temas/app_images.dart';
import 'package:macro_projeto/temas/app_text_styles.dart';

import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final ctrlLogin = TextEditingController();
  final ctrlSenha = TextEditingController();
  final controller = LoginController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final ButtonStyle style = ElevatedButton.styleFrom(
      fixedSize: Size.infinite,
      backgroundColor: Colors.green,
    );
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              Container(
                width: size.width,
                height: size.height * 0.36,
                color: AppColors.primary,
              ),
              Positioned(
                  top: 150,
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    AppImages.queiroz,
                    width: 100,
                    height: 100,
                  )),
              Positioned(
                  bottom: size.height * 0.20,
                  left: 0,
                  right: 20,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 50),
                        child: Text(
                          "Titulo do app",
                          style: TextStyles.titleHome,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      TextFormField(
                        key: controller.formKey,
                        validator: controller.validateUser,
                        controller: ctrlLogin,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            icon: Icon(Icons.person),
                            hintText: 'Digite seu usuario',
                            labelText: 'Login'),
                      ),
                      const SizedBox(
                        height: 24.0,
                      ),
                      TextFormField(
                        controller: ctrlSenha,
                        validator: controller.validateSenha,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            icon: Icon(Icons.security_outlined),
                            hintText: 'Digite sua senha',
                            labelText: 'Senha'),
                        maxLength: 6,
                        obscureText: true,
                      ),
                      ElevatedButton(
                          style: style,
                          onPressed: () async {
                            var passagem = await controller.login(
                                ctrlLogin.text, ctrlSenha.text);
                            if (passagem != 'Erro') {
                              // ignore: use_build_context_synchronously
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          HomePage(name: passagem!)));
                            } else {
                              // ignore: use_build_context_synchronously
                              _showDialog(context);
                            }
                          },
                          child: const Text(
                            'Entrar',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          )),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

void _showDialog(BuildContext context) {
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    foregroundColor: Colors.white,
    minimumSize: const Size(88, 44),
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
    backgroundColor: const Color(0xFFD6D3D3),
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 40,
        ),
        backgroundColor: const Color.fromARGB(230, 255, 0, 0),
        title: const Text(
          "Atenção!!",
          textAlign: TextAlign.center,
        ),
        content: const Text(
          "Login ou Senha Invalido!",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        actions: <Widget>[
          TextButton(
            style: flatButtonStyle,
            child: const Text("OK", textAlign: TextAlign.center),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
