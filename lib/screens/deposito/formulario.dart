import 'package:flutter/material.dart';

const _tituloAppBar = 'Receber depósito';

class FormularioDeposito extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: Text(''),
    );
  }
}
