import 'package:flutter/material.dart';

class PaginaRelatorio extends StatefulWidget {
  const PaginaRelatorio({Key? key}) : super(key: key);

  @override
  State<PaginaRelatorio> createState() => _PaginaRelatorioState();
}

class _PaginaRelatorioState extends State<PaginaRelatorio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('Pousada Bacana'),
            Text(' - Relatórios '),
            Icon(Icons.description),
          ],
        ),
        actions: [
        IconButton(
          icon: Icon(Icons.refresh),
          onPressed: () {
            
          },
        ),
      ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Column(
                  children: [
                    Text(
                      'Reservas Canceladas',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: ListView.builder(
                        itemCount: reservasCanceladas.length,
                        itemBuilder: (context, index) {
                          final reserva = reservasCanceladas[index];
                          return ListTile(
                            title: Text('Quarto ${reserva.numeroQuarto} - ${getTipoQuarto(reserva.numeroQuarto)}'),
                            subtitle: Text(
                                'Cliente: ${reserva.cliente}\nData de entrada: ${reserva.dataEntrada}\nData de saída: ${reserva.dataSaida}'),
                            onTap: () {
                              // Ação para visualizar mais detalhes da reserva cancelada
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Column(
                  children: [
                    Text(
                      'Reservas Não Pagas',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: ListView.builder(
                        itemCount: reservasNaoPagas.length,
                        itemBuilder: (context, index) {
                          final reserva = reservasNaoPagas[index];
                          return ListTile(
                            title: Text('Quarto ${reserva.numeroQuarto} - ${getTipoQuarto(reserva.numeroQuarto)}'),
                            subtitle: Text(
                                'Cliente: ${reserva.cliente}\nData de entrada: ${reserva.dataEntrada}\nData de saída: ${reserva.dataSaida}\nValor pendente: R\$ ${reserva.valorPendente.toStringAsFixed(2)}'),
                            onTap: () {
                              // Ação para visualizar mais detalhes da reserva não paga
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Column(
                  children: [
                    Text(
                      'Reservas do Dia',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: ListView.builder(
                        itemCount: reservasDoDia.length,
                        itemBuilder: (context, index) {
                          final reserva = reservasDoDia[index];
                          return ListTile(
                            title: Text('Quarto ${reserva.numeroQuarto} - ${getTipoQuarto(reserva.numeroQuarto)}'),
                            subtitle: Text(
                                'Cliente: ${reserva.cliente}\nData de entrada: ${reserva.dataEntrada}\nData de saída: ${reserva.dataSaida}\nStatus de check-in: ${reserva.statusCheckIn}'),
                            onTap: () {
                              // Ação para visualizar mais detalhes da reserva do dia
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Função auxiliar para obter o tipo de quarto com base no número do quarto
String getTipoQuarto(int numeroQuarto) {
  switch (numeroQuarto) {
    case 101:
      return 'Quarto Deluxe';
    case 202:
      return 'Quarto Executivo';
    case 303:
      return 'Quarto Família';
    case 404:
      return 'Quarto Temático';
    case 505:
      return 'Quarto Suíte Presidencial';
    default:
      return 'Tipo de Quarto Desconhecido';
  }
}

// Classe de exemplo para as reservas canceladas
class ReservaCancelada {
  final int numeroQuarto;
  final String cliente;
  final String dataEntrada;
  final String dataSaida;
  final String motivoCancelamento;

  ReservaCancelada({
    required this.numeroQuarto,
    required this.cliente,
    required this.dataEntrada,
    required this.dataSaida,
    required this.motivoCancelamento,
  });
}

// Classe de exemplo para as reservas não pagas
class ReservaNaoPaga {
  final int numeroQuarto;
  final String cliente;
  final String dataEntrada;
  final String dataSaida;
  final double valorTotal;
  final double valorPendente;

  ReservaNaoPaga({
    required this.numeroQuarto,
    required this.cliente,
    required this.dataEntrada,
    required this.dataSaida,
    required this.valorTotal,
    required this.valorPendente,
  });
}

// Classe de exemplo para as reservas do dia
class ReservaDoDia {
  final int numeroQuarto;
  final String cliente;
  final String dataEntrada;
  final String dataSaida;
  final String statusCheckIn;

  ReservaDoDia({
    required this.numeroQuarto,
    required this.cliente,
    required this.dataEntrada,
    required this.dataSaida,
    required this.statusCheckIn,
  });
}

// Lista de reservas canceladas (exemplo)
List<ReservaCancelada> reservasCanceladas = [
  ReservaCancelada(
    numeroQuarto: 101,
    cliente: 'João',
    dataEntrada: '10/06/2023',
    dataSaida: '15/06/2023',
    motivoCancelamento: 'Mudança de planos',
  ),
  ReservaCancelada(
    numeroQuarto: 202,
    cliente: 'Maria',
    dataEntrada: '12/06/2023',
    dataSaida: '18/06/2023',
    motivoCancelamento: 'Problemas de saúde',
  ),
  ReservaCancelada(
    numeroQuarto: 303,
    cliente: 'Lucas',
    dataEntrada: '05/06/2023',
    dataSaida: '08/06/2023',
    motivoCancelamento: 'Mudança de planos de viagem',
  ),
  ReservaCancelada(
    numeroQuarto: 404,
    cliente: 'Camila',
    dataEntrada: '15/06/2023',
    dataSaida: '20/06/2023',
    motivoCancelamento: 'Conflito de agenda',
  ),
  ReservaCancelada(
    numeroQuarto: 505,
    cliente: 'Rodrigo',
    dataEntrada: '25/06/2023',
    dataSaida: '28/06/2023',
    motivoCancelamento: 'Problemas familiares',
  ),
];

// Lista de reservas não pagas (exemplo)
List<ReservaNaoPaga> reservasNaoPagas = [
  ReservaNaoPaga(
    numeroQuarto: 303,
    cliente: 'Pedro',
    dataEntrada: '20/06/2023',
    dataSaida: '25/06/2023',
    valorTotal: 500.0,
    valorPendente: 200.0,
  ),
  ReservaNaoPaga(
    numeroQuarto: 404,
    cliente: 'Ana',
    dataEntrada: '22/06/2023',
    dataSaida: '28/06/2023',
    valorTotal: 800.0,
    valorPendente: 800.0,
  ),
  ReservaNaoPaga(
    numeroQuarto: 101,
    cliente: 'Sandra',
    dataEntrada: '10/06/2023',
    dataSaida: '15/06/2023',
    valorTotal: 600.0,
    valorPendente: 300.0,
  ),
  ReservaNaoPaga(
    numeroQuarto: 202,
    cliente: 'Marcelo',
    dataEntrada: '20/06/2023',
    dataSaida: '25/06/2023',
    valorTotal: 800.0,
    valorPendente: 800.0,
  ),
  ReservaNaoPaga(
    numeroQuarto: 303,
    cliente: 'Isabela',
    dataEntrada: '30/06/2023',
    dataSaida: '03/07/2023',
    valorTotal: 400.0,
    valorPendente: 200.0,
  ),
];

// Lista de reservas do dia (exemplo)
List<ReservaDoDia> reservasDoDia = [
  ReservaDoDia(
    numeroQuarto: 101,
    cliente: 'Mário',
    dataEntrada: '13/06/2023',
    dataSaida: '18/06/2023',
    statusCheckIn: 'Pendente',
  ),
  ReservaDoDia(
    numeroQuarto: 202,
    cliente: 'Carolina',
    dataEntrada: '13/06/2023',
    dataSaida: '15/06/2023',
    statusCheckIn: 'Em andamento',
  ),
  ReservaDoDia(
    numeroQuarto: 404,
    cliente: 'Thiago',
    dataEntrada: '13/06/2023',
    dataSaida: '18/06/2023',
    statusCheckIn: 'Concluído',
  ),
  ReservaDoDia(
    numeroQuarto: 505,
    cliente: 'Paula',
    dataEntrada: '13/06/2023',
    dataSaida: '15/06/2023',
    statusCheckIn: 'Pendente',
  ),
  ReservaDoDia(
    numeroQuarto: 606,
    cliente: 'Renato',
    dataEntrada: '13/06/2023',
    dataSaida: '17/06/2023',
    statusCheckIn: 'Em andamento',
  ),
];