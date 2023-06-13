import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

import '../componentes/botao.dart';

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({super.key});

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pousada Bacana'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              height: 60,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Ação ao pressionar o botão "Fazer reserva"
                  Navigator.pushReplacementNamed(context, '/reserva');
                },
                icon: Icon(Icons.calendar_today),
                label: Text('Fazer reserva'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  textStyle: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 200,
              height: 60,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Ação ao pressionar o botão "Relatórios"
                  Navigator.pushNamed(context, '/relatorios');
                },
                icon: Icon(Icons.description),
                label: Text('Relatórios'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  textStyle: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
