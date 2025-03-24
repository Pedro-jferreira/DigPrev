import 'package:digprev_flutter/ui/users/consent/view_models/consentViewModel.dart';
import 'package:flutter/material.dart';

class ConsentScreen extends StatefulWidget {
  final ConsentViewModel consentViewModel;
  const ConsentScreen({required this.consentViewModel, super.key});

  @override
  State<ConsentScreen> createState() => _ConsentScreenState();
}

class _ConsentScreenState extends State<ConsentScreen>
    with SingleTickerProviderStateMixin {
  bool isExpandedConsentidos = false;
  bool isExpandedNaoConsentidos = false;

  late AnimationController _controller;
  late Animation<double> sizeFactor;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    sizeFactor = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  void toggleExpand(bool isConsentidos) {
    setState(() {
      if (isConsentidos) {
        isExpandedConsentidos = !isExpandedConsentidos;
        isExpandedNaoConsentidos = false;
      } else {
        isExpandedNaoConsentidos = !isExpandedNaoConsentidos;
        isExpandedConsentidos = false;
      }

      if (isExpandedConsentidos || isExpandedNaoConsentidos) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const Text('Faça aqui a gestão dos seus consentimentos.'),
              const SizedBox(height: 20),
              Column(
                children: <Widget>[
                  _buildCard('Consentidos', isExpandedConsentidos,
                          () => toggleExpand(true)),
                  _buildExpandableList(isExpandedConsentidos,
                      <Map<String, String>>[
                    <String, String>{'title': 'Texto Consentimento 1', 'date': '10/03/2025'},
                    <String, String>{'title': 'Texto Consentimento 2', 'date': '08/03/2025'},
                    <String, String>{'title': 'Texto Consentimento 3', 'date': '05/03/2025'},
                  ]),

                  _buildCard('Pendentes', isExpandedNaoConsentidos,
                          () => toggleExpand(false)),
                  _buildExpandableList(isExpandedNaoConsentidos,
                      <Map<String, String>>[
                    <String, String>{'title': 'Texto Não Consentido 1', 'date': '02/03/2025'},
                    <String, String>{'title': 'Texto Não Consentido 2', 'date': '01/03/2025'},
                  ]),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCard(String title, bool isExpanded, VoidCallback onTap) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(
                    size: 30,
                    title == 'Consentidos'
                        ? Icons.expand_circle_down_outlined
                      : Icons.access_time,
                  ),
                  const SizedBox(width: 20),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Icon(
                size: 30,
                isExpanded ? Icons.expand_less : Icons.expand_more,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExpandableList(bool isExpanded, List<Map<String,
      String>> items) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isExpanded ? items.length * 60.0 : 0,
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: items.map((Map<String, String> item)
          => _buildListTile(item['title']!, item['date']!)).toList(),
      ),
    );
  }

  Widget _buildListTile(String title, String date) {
    return Material(
      child: ListTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
        subtitle: Text(
          'Data: $date',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        trailing: IconButton(
          icon: Icon(Icons.description,
              color: Theme.of(context).colorScheme.primary),
          onPressed: () {
            _consultarTermo(title);
          },
        ),
      ),
    );
  }

  void _consultarTermo(String titulo) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Termo de Consentimento'),
        content: Text('Aqui está o termo referente a "$titulo\".'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Fechar'),
          ),
        ],
      ),
    );
  }
}


