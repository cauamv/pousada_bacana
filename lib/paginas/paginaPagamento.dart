import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pousada/componentes/botao.dart';

import '../componentes/caixa_texto.dart';

class PaginaPagamento extends StatelessWidget {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController enderecoController = TextEditingController();
  final TextEditingController cidadeController = TextEditingController();
  final TextEditingController estadoController = TextEditingController();
  final TextEditingController cepController = TextEditingController();
  final TextEditingController numeroCasaController = TextEditingController();
  final TextEditingController complementoController = TextEditingController();
  final TextEditingController cartaoController = TextEditingController();
  final TextEditingController calendarioController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();
  final TextEditingController cupomController = TextEditingController(); // Novo controlador para o campo de cupom

  DateTime? dataValidade;

  Future<void> mostrarCalendario(BuildContext context) async {
    final DateTime? dataSelecionada = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365 * 10)), // 10 anos de limite máximo
    );

    if (dataSelecionada != null) {
      dataValidade = dataSelecionada;
      final DateFormat formatter = DateFormat('MM/yyyy');
      final String dataFormatada = formatter.format(dataSelecionada);
      final TextEditingController controller =
          TextEditingController(text: dataFormatada);
      controller.selection = TextSelection.fromPosition(
          TextPosition(offset: controller.text.length));
      calendarioController.value = controller.value;
    }
  }

  @override
  Widget build(BuildContext context) {

    irPrincipal() {
      Navigator.pushReplacementNamed(context, '/pagina-principal');
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('Pousada Bacana'),
            Text(' - Pagamento '),
            Icon(Icons.shopping_cart),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Informações do Cliente',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    child: caixaTexto(
                      controlador: nomeController,
                      msgValidacao: 'Digite seu nome',
                      texto: 'Nome',
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  Expanded(
                    child: caixaTexto(
                      controlador: telefoneController,
                      msgValidacao: 'Digite seu telefone',
                      texto: 'Telefone',
                      prefixIcon: Icon(Icons.phone),
                    ),
                  ),
                ],
              ),
              caixaTexto(
                controlador: enderecoController,
                msgValidacao: 'Digite seu endereço',
                texto: 'Endereço',
                prefixIcon: Icon(Icons.location_on),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: caixaTexto(
                      controlador: cidadeController,
                      msgValidacao: 'Digite sua cidade',
                      texto: 'Cidade',
                      prefixIcon: Icon(Icons.location_city),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: caixaTexto(
                      controlador: estadoController,
                      msgValidacao: 'Digite seu estado',
                      texto: 'Estado',
                      prefixIcon: Icon(Icons.flag),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: caixaTexto(
                      controlador: cepController,
                      msgValidacao: 'Digite seu CEP',
                      texto: 'CEP',
                      prefixIcon: Icon(Icons.location_on),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: caixaTexto(
                      controlador: numeroCasaController,
                      msgValidacao: 'Digite o número da casa',
                      texto: 'N° Casa',
                      prefixIcon: Icon(Icons.home),
                    ),
                  ),
                ],
              ),
              caixaTexto(
                controlador: complementoController,
                msgValidacao: 'Digite o complemento',
                texto: 'Complemento',
                prefixIcon: Icon(Icons.add),
              ),
              Text(
                'Informações do Cartão',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              caixaTexto(
                controlador: cartaoController,
                msgValidacao: 'Digite o número do cartão',
                texto: 'Número do Cartão',
                prefixIcon: Icon(Icons.credit_card),
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () => mostrarCalendario(context),
                      child: IgnorePointer(
                        child: caixaTexto(
                          controlador: calendarioController,
                          msgValidacao: 'Digite a validade do cartão',
                          texto: 'Validade',
                          prefixIcon: Icon(Icons.calendar_today),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: caixaTexto(
                      controlador: TextEditingController(),
                      msgValidacao: 'Digite o CVV',
                      texto: 'CVV',
                      prefixIcon: Icon(Icons.lock),
                      isSenha: true,
                    ),
                  ),
                  SizedBox(width: 5), // Espaçamento entre o campo CVV e o campo do cupom
                  Expanded(
                    child: caixaTexto(
                      controlador: cupomController,
                      msgValidacao: 'Digite o cupom de desconto',
                      texto: 'Cupom de desconto',
                      prefixIcon: Icon(Icons.local_offer),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey),
                  ),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Resumo da Compra',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 13),
                      Text('Nome do Quarto: Quarto Luxo'),
                      Text('Data de Entrada: 01/07/2023'),
                      Text('Data de Saída: 05/07/2023'),
                      Text('Número do quarto: 302'),
                      Text('Desconto concedido do cupom: 10%'),
                      SizedBox(height: 10),
                      Text(
                        'DE: R\$ 500,00',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        'POR: R\$ 450,00',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        '* desconto aplicado',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  botao(texto: 'Pagar', funcao: irPrincipal),
                ],
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
