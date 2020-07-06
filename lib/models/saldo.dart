import 'package:flutter/cupertino.dart';

class Saldo extends ChangeNotifier {
  double valor;

  Saldo(this.valor);

  void add(double valor) {
    this.valor += valor;

    notifyListeners();
  }

  @override
  String toString() => 'R\$ $valor';
}
