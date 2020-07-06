import 'package:bytebank2/models/saldo.dart';
import 'package:bytebank2/screens/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// O Provider é um Observeble
void main() => runApp(ChangeNotifierProvider(
      create: (context) => Saldo(0), // quais dados ele está observando
      child: BytebankApp(), // daqui podemos acessar os dados
    ));

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.purple[900],
        accentColor: Colors.blueGrey,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueGrey,
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: Dashboard(),
    );
  }
}
