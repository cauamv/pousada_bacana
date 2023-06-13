import 'package:flutter/material.dart';
import 'package:pousada/paginas/paginaPagamento.dart';
import 'package:pousada/paginas/paginaPrincipal.dart';
import 'package:pousada/paginas/paginaRelatorios.dart';
import 'package:pousada/paginas/paginaReserva.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/pagina-principal",
      routes: {
        '/pagina-principal': (context) => PaginaPrincipal(),
        '/reserva': (context) => PaginaReserva(),
        '/pagamento': (context) => PaginaPagamento(),
        '/relatorios': (context) => PaginaRelatorio(),
      },
    );
  }
}