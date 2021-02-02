import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:app_chamado_suporte/view/pages/login.dart';

class EsqueceuSenhaController {
  String novaSenha;
  String confirmarSenha;
  bool visiblePassord = true;
  bool visibleConfirmarPassord = true;
  Function _setState;

  EsqueceuSenhaController({@required Function setState}) {
    this._setState = setState;
  }

  void changeNovaSenha(String value) =>
      _setState(() => novaSenha = value.trim());
  void changeConfirmaSenha(String value) =>
      _setState(() => confirmarSenha = value.trim());

  void changeIsVisibleNovaSenha() {
    _setState(() => visiblePassord = !visiblePassord);
  }

  void chnageIsVisibleConfirmarSenha() {
    _setState(() => visibleConfirmarPassord = !visibleConfirmarPassord);
  }

  String validarNovaSenha() {
    if (novaSenha != null && novaSenha.length < 6) {
      return "Senha deve ter pelo menos 6 caracteries";
    }
    return null;
  }

  String validarConfirmarSenha() {
    if (confirmarSenha != null && confirmarSenha != novaSenha) {
      return "Senha não correspondem ";
    }
    return null;
  }

  bool habilitarEsqueceuSenha() {
    if ((novaSenha == null && novaSenha != null) &&
        (confirmarSenha = null) &&
        (confirmarSenha != null)) {
      return true;
    }
    return false;
  }

  void salvar(dynamic context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  }
}
