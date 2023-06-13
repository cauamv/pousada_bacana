import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class texto extends StatefulWidget {

  final conteudo;
  final fonteTamanho;
  final fonteCor;

  const texto({super.key, this.conteudo, this.fonteTamanho, this.fonteCor});

  @override
  State<texto> createState() => _textoState();
}

class _textoState extends State<texto> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Text(
        widget.conteudo,
        style: TextStyle(
          fontSize: widget.fonteTamanho,
          color: widget.fonteCor
        ),
      ),
    );
  }
}