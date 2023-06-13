import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';

import '../componentes/botao.dart';
import '../componentes/caixa_texto.dart';

class PaginaReserva extends StatefulWidget {
  const PaginaReserva({super.key});

  @override
  State<PaginaReserva> createState() => _PaginaReservaState();
}

class _PaginaReservaState extends State<PaginaReserva> {
  DateTime? _selectedEntryDate;
  DateTime? _selectedExitDate;
  int _numberOfAdults = 1;
  int _numberOfChildren = 0;
  bool? _acceptsPets = false;

  @override
  void initState() {
    super.initState();
    _selectedEntryDate = DateTime.now();
    _selectedExitDate = DateTime.now().add(Duration(days: 1));
  }

  void _showEntryCalendarPicker() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedEntryDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );

    if (pickedDate != null && pickedDate != _selectedEntryDate) {
      setState(() {
        _selectedEntryDate = pickedDate;
      });
    }
  }

  void _showExitCalendarPicker() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedExitDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );

    if (pickedDate != null && pickedDate != _selectedExitDate) {
      setState(() {
        _selectedExitDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('Pousada Bacana'),
            Text(' - Reservas '),
            Icon(Icons.calendar_today),
          ],
        ),
      ),
      body: Form(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        'Data de entrada',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey),
                        ),
                        padding: EdgeInsets.all(8),
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: _showEntryCalendarPicker,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.calendar_today),
                                SizedBox(height: 8),
                                Text(
                                  _selectedEntryDate != null
                                      ? DateFormat('dd/MM/yyyy')
                                          .format(_selectedEntryDate!)
                                      : 'Selecione uma data',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 16),
                  Column(
                    children: [
                      Text(
                        'Data de saída',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey),
                        ),
                        padding: EdgeInsets.all(8),
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: _showExitCalendarPicker,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.calendar_today),
                                SizedBox(height: 8),
                                Text(
                                  _selectedExitDate != null
                                      ? DateFormat('dd/MM/yyyy')
                                          .format(_selectedExitDate!)
                                      : 'Selecione uma data',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 16),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Adultos',
                                style: TextStyle(fontSize: 16),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.remove),
                                    onPressed: () {
                                      setState(() {
                                        if (_numberOfAdults > 1) {
                                          _numberOfAdults--;
                                        }
                                      });
                                    },
                                  ),
                                  Text(
                                    '$_numberOfAdults',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () {
                                      setState(() {
                                        _numberOfAdults++;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Crianças',
                                style: TextStyle(fontSize: 16),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.remove),
                                    onPressed: () {
                                      setState(() {
                                        if (_numberOfChildren > 0) {
                                          _numberOfChildren--;
                                        }
                                      });
                                    },
                                  ),
                                  Text(
                                    '$_numberOfChildren',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () {
                                      setState(() {
                                        _numberOfChildren++;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Aceita animais',
                                style: TextStyle(fontSize: 16),
                              ),
                              Checkbox(
                                value: _acceptsPets,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _acceptsPets = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'Quartos disponíveis',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildProductContainer(
                    'https://cdn.discordapp.com/attachments/813939102008606770/1118213164891385977/deluxe-room-ocean-view-01-optim5B15D.png',
                    'Quarto Deluxe',
                    'Um quarto espaçoso e luxuoso, perfeito para hóspedes que desejam desfrutar de uma estadia elegante e confortável.',
                    'R\$ 500 per noite',
                  ),
                  _buildProductContainer(
                    'https://cdn.discordapp.com/attachments/813939102008606770/1118219182631305257/Raquel-Brum-Quarto-do-Executivo.png',
                    'Quarto Executivo',
                    'Um quarto projetado para atender às necessidades de viajantes a negócios, com espaço de trabalho ergonômico e comodidades modernas.',
                    'R\$ 400 per noite',
                  ),
                  _buildProductContainer(
                    'https://cdn.discordapp.com/attachments/813939102008606770/1118219497833234442/quarto-familia-08.png',
                    'Quarto Família',
                    'Um quarto espaçoso e acolhedor, ideal para famílias que desejam compartilhar momentos juntos durante as férias, com comodidades para crianças.',
                    'R\$ 600 per noite',
                  ),
                  _buildProductContainer(
                    'https://cdn.discordapp.com/attachments/813939102008606770/1118219893603573831/pirate-room.png',
                    'Quarto Temático',
                    'Um quarto único e divertido, decorado de acordo com um tema específico, proporcionando uma experiência memorável e encantadora aos hóspedes.',
                    'R\$ 350 per noite',
                  ),
                  _buildProductContainer(
                    'https://cdn.discordapp.com/attachments/813939102008606770/1118220257832730654/presidencial_VIDAM.png',
                    'Quarto Suíte Presidencial',
                    'Uma suíte exclusiva e sofisticada, projetada para proporcionar o máximo de conforto e privacidade aos hóspedes de elite. Possui uma área de estar espaçosa, quarto separado e vistas deslumbrantes da cidade.',
                    'R\$ 1500 per noite',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _irPagamento () {
    Navigator.pushReplacementNamed(context, '/pagamento');
  }

  Widget _buildProductContainer(
      String imageUrl, String title, String description, String price) {
    return GestureDetector(
      onTap: _irPagamento,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          width: 300,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey),
          ),
          child: Column(
            children: [
              Image.network(
                imageUrl,
                width: 300,
                height: 200,
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                description,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    price,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
