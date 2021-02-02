import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:app_chamado_suporte/view/elements/input.dart';
import 'package:app_chamado_suporte/view/elements/button_text.dart';
import 'package:app_chamado_suporte/view/elements/button_action.dart';
import 'package:app_chamado_suporte/controllers/cadastro_controller.dart';

class CadastroScreen extends StatefulWidget {
  @override
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
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
                          label: "Nome",
                          msgErro: controller.validaNome(),
                          onChange: controller.changeNome,
                          typeText: TextInputType.text,
                          suffixIcon: Icon(Icons.account_box),
                        ),
                        Input(
                          label: "E-mail",
                          msgErro: controller.validaEmail(),
                          onChange: controller.changeEmail,
                          typeText: TextInputType.emailAddress,
                          suffixIcon: Icon(Icons.mail),
                        ),
                        Input(
                          label: "Senha",
                          msgErro: controller.validaSenha(),
                          onChange: controller.changeSenha,
                          typeText: TextInputType.visiblePassword,
                          suffixIcon: IconButton(
                            icon: Icon(Icons.visibility),
                            onPressed: controller.changeIsVisiblePassword,
                          ),
                          visiblePassord: controller.visiblePassword,
                        ),
                        Input(
                          label: "Confirma senha",
                          msgErro: controller.validaConfirmaSenha(),
                          onChange: controller.changeconfirmaSenha,
                          typeText: TextInputType.visiblePassword,
                          suffixIcon: IconButton(
                            icon: Icon(Icons.visibility),
                            onPressed:
                                controller.changeIsVisibleConfirmaPassword,
                          ),
                          visiblePassord: controller.visibleConfirmaPassord,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        ButtonAction(
                          textButton: 'CADASTRAR',
                          colorShadow: Colors.green.withOpacity(0.4),
                          colorButton: Colors.green,
                          onPressed: () {
                            print("CLICOU NO BOTÃO CADASTRO");
                            if (controller.habilitarCadastro()) {
                              controller.cadastrar(context);
                            }
                          },
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        ButtonText(
                          label: "Tenho conta",
                          onPressed: () => controller.login(context),
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
