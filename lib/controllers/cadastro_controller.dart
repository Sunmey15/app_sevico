import 'package:app_chamado_suporte/view/pages/home.dart';
import 'package:app_chamado_suporte/view/pages/login.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CadastrarContaController {
  String nome;
  String email;
  String senha;
  String confirmaSenha;
  bool visiblePassword = true;
  bool visibleConfirmaPassord = true;
  Function _setState;

  CadastrarContaController({@required Function setState}) {
    this._setState = setState;
  }

  void changeNome(String value) => _setState(() => nome = value.trim());
  void changeEmail(String value) => _setState(() => email = value.trim());
  void changeSenha(String value) => _setState(() => senha = value.trim());
  void changeconfirmaSenha(String value) =>
      _setState(() => confirmaSenha = value.trim());

  void changeIsVisiblePassword() {
    _setState(() => visiblePassword = !visiblePassword);
  }

  void changeIsVisibleConfirmaPassword() {
    _setState(() => visibleConfirmaPassord = !visibleConfirmaPassord);
  }

  String validaEmail() {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (email != null) if (!regex.hasMatch(email)) return "E-mail inválido";
    return null;
  }

  String validaSenha() {
    if (senha != null && senha.length < 6)
      return 'Senha deve ter pelo menos 6 caracteres';
    return null;
  }

  String validaConfirmaSenha() {
    if (confirmaSenha != null && confirmaSenha != senha)
      return 'Senhas não correspondem';
    return null;
  }

  String validaNome() {
    if (nome != null && nome.length < 3)
      return 'Nome deve ter pelo menos 3 caracteres';
    return null;
  }

  bool habilitarCadastro() {
    if ((validaEmail() == null && email != null) &&
        (validaSenha() == null && senha != null) &&
        (validaConfirmaSenha() == null && confirmaSenha != null) &&
        (validaNome() == null && nome != null)) return true;
    return false;
  }

  void cadastrar(dynamic context) async {
    //aqui será usado pra quando tivermos acesso ao back-end via API
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
  }

  void login(dynamic context) {
    //Nicolas coloque aqui o navigator para levar para a tela de login
    //será colocado no botão de texto "tenho uma conta"
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  }
}
