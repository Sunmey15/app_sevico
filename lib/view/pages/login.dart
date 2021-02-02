import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:app_chamado_suporte/view/pages/home.dart';
import 'package:app_chamado_suporte/view/pages/cadastro.dart';
import 'package:app_chamado_suporte/view/elements/input.dart';
import 'package:app_chamado_suporte/view/pages/esqueceu_senha.dart';
import 'package:app_chamado_suporte/view/elements/button_text.dart';
import 'package:app_chamado_suporte/view/elements/button_action.dart';
import 'package:app_chamado_suporte/controllers/cadastro_controller.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  CadastrarContaController controller;

  @override
  void initState() {
    super.initState();
    controller = CadastrarContaController(setState: setState);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ImageFiltered(
            imageFilter: ImageFilter.blur(
              sigmaX: 2.5,
              sigmaY: 2.5,
            ),
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/fundo.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 50,
                        horizontal: 75,
                      ),
                      child: Image.asset("assets/images/logo.png"),
                    ),
                  ),
                  Form(
                    child: Column(
                      children: [
                        Input(
                          label: "E-mail",
                          msgErro: null,
                          onChange: null,
                          typeText: null,
                          suffixIcon: Icon(Icons.email),
                        ),
                        Input(
                          label: "Senha",
                          msgErro: null,
                          onChange: null,
                          typeText: null,
                          visiblePassord: controller.visiblePassword,
                          suffixIcon: IconButton(
                            icon: Icon(Icons.visibility),
                            onPressed: controller.changeIsVisiblePassword,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        ButtonAction(
                          textButton: 'ENTRAR',
                          colorShadow: Colors.green.withOpacity(0.4),
                          colorButton: Colors.green,
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        ButtonText(
                          label: "Esqueci minha senha",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EsqueceuSenhaScreen(),
                              ),
                            );
                          },
                        ),
                        ButtonText(
                          label: 'Não tenho conta',
                          onPressed: () {
                            //apenas add uma nova tela, sendo assim possivel voltar a tela anterior
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CadastroScreen(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
