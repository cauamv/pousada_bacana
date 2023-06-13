import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class caixaTexto extends StatelessWidget {
  final TextEditingController controlador;
  final String msgValidacao;
  final String texto;
  final bool isSenha;
  final Icon prefixIcon;

  caixaTexto({
    required this.controlador,
    required this.msgValidacao,
    required this.texto,
    this.isSenha = false,
    required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        controller: controlador,
        validator: (value) {
          if (value!.isEmpty) {
            return msgValidacao;
          }
          return null;
        },
        obscureText: isSenha,
        decoration: InputDecoration(
          labelText: texto,
          prefixIcon: prefixIcon,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}
