import 'package:app_chamado_suporte/controllers/esqueceu_controller.dart';
import 'package:app_chamado_suporte/view/elements/button_action.dart';
import 'package:app_chamado_suporte/view/elements/input.dart';
import 'package:app_chamado_suporte/view/pages/login.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class EsqueceuSenhaScreen extends StatefulWidget {
  @override
  _EsqueceuSenhaScreenState createState() => _EsqueceuSenhaScreenState();
}

class _EsqueceuSenhaScreenState extends State<EsqueceuSenhaScreen> {
  EsqueceuSenhaController controller;

  @override
  void initState() {
    super.initState();
    controller = EsqueceuSenhaController(setState: setState);
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
                          label: "Nova senha",
                          msgErro: controller.validarNovaSenha(),
                          onChange: controller.changeNovaSenha,
                          typeText: TextInputType.visiblePassword,
                          suffixIcon: IconButton(
                            icon: Icon(Icons.visibility),
                            onPressed: controller.changeIsVisibleNovaSenha,
                          ),
                          visiblePassord: controller.visiblePassord,
                        ),
                        Input(
                          label: "Confirmar senha",
                          msgErro: controller.validarConfirmarSenha(),
                          onChange: controller.changeConfirmaSenha,
                          typeText: TextInputType.visiblePassword,
                          suffixIcon: IconButton(
                            icon: Icon(Icons.visibility),
                            onPressed: controller.chnageIsVisibleConfirmarSenha,
                          ),
                          visiblePassord: controller.visibleConfirmarPassord,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        ButtonAction(
                          onPressed: () {
                            print("CLICOU NO BOTÃO SALVAR");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                          textButton: 'SALVAR',
                          colorShadow: Colors.green.withOpacity(0.4),
                          colorButton: Colors.green,
                        ),
                        SizedBox(
                          height: 40,
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
