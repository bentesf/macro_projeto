import 'package:flutter/material.dart';
import 'package:macro_projeto/shared/auth/auth_controller.dart';
import 'package:macro_projeto/temas/app_colors.dart';
import 'package:macro_projeto/temas/app_images.dart';
import 'package:macro_projeto/temas/app_text_styles.dart';
import 'package:provider/provider.dart';

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
  bool isLogin = true;
  late String titulo;
   late String actionButton;
  late String toggleButton;
  bool loading = false;
  
    @override
  void initState() {
    super.initState();
    setFormAction(true);
  }

  setFormAction(bool acao) {
    setState(() {
      isLogin = acao;
      if (isLogin) {
        titulo = 'Bem vindo';
        actionButton = "Login";
        toggleButton = 'Ainda não tem conta? Cadastre-se agora.';
      } else {
        titulo = 'Crie sua conta';
        actionButton = 'Cadastrar';
        toggleButton = 'Voltar ao Login.';
      }
    });
  }
  
  login() async {
    setState(() => loading = true);
    try {
      await context.read<AuthController>().login(ctrlLogin.text, ctrlSenha.text);
    } on AuthException catch (e) {
      setState(() => loading = false);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
    }
  }
  registrar() async {
    setState(() => loading = true);
    try {
      await context.read<AuthController>().registrar(ctrlLogin.text, ctrlSenha.text);
    } on AuthException catch (e) {
      setState(() => loading = false);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
    }
  }
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final ButtonStyle style = ElevatedButton.styleFrom(
      fixedSize: Size.infinite,
      backgroundColor: Colors.blue,
    );
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              // Container(
              //   width: size.width,
              //   height: size.height * 0.36,
              //   color: Colors.blue,
              // ),
              Positioned(
                  top: 150,
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    AppImages.user,
                    width: 100,
                    height: 150,
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
                          titulo,
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
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            icon: Icon(Icons.security_outlined),
                            hintText: 'Digite sua senha',
                            labelText: 'Senha'),
                        maxLength: 6,
                        obscureText: true,
                      ),
                      ElevatedButton(
                          style: style,
                          onPressed: () async {
                      if (isLogin) {
                          login();
                        } else {
                          registrar();
                        }
                          },
                     child: (loading)
                          ? 
                              const Padding(
                                padding: EdgeInsets.all(16),
                                child: SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            
                          : 
                              // const Icon(Icons.check),
                              Text(
                            actionButton,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          )
                              // Padding(
                              //   padding: const EdgeInsets.all(16.0),
                              //   child: Text(
                              //     actionButton,
                              //     style: const TextStyle(fontSize: 20),
                              //   ),
                              // ),
                            ,
                    ),
                  
                
                TextButton(
                  onPressed: () => setFormAction(!isLogin),
                  child: Text(toggleButton),
                ),
                          // child: const Text(
                          //   'Entrar',
                          //   textAlign: TextAlign.center,
                          //   style: TextStyle(
                          //     color: Colors.white,
                          //     fontSize: 30,
                          //   ),
                          // )),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: unused_element
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
