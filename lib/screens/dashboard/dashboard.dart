import 'package:bytebank2/models/saldo.dart';
import 'package:bytebank2/screens/dashboard/saldo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bytebank'),
      ),
      body: ListView(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: SaldoCard(),
          ),
          Consumer<Saldo>(builder: (context, saldo, child) {
            return RaisedButton(
              child: Text('Receber depósito'),
              onPressed: () {
                saldo.add(10.0);
              },
            );
          }),
        ],
      ),
    );
  }
}
