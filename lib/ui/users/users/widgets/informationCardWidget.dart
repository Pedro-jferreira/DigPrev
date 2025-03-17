import 'package:flutter/material.dart';

class InformationCardWidget extends StatefulWidget {
  final String iconType;
  final String text;
  final String textType;
  const InformationCardWidget({required this.iconType,
    required this.text, required this.textType,
    super.key});

  @override
  State<InformationCardWidget> createState() => _InformationCardWidgetState();
}

class _InformationCardWidgetState extends State<InformationCardWidget> {
  static const Map<String, IconData> iconMap = <String, IconData>{
    'email': Icons.email,
    'telefone': Icons.phone,
    'nome': Icons.person,
    'birthday': Icons.calendar_month_outlined,
    'cpf': Icons.file_copy,
  };
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(
            size: 30,
            iconMap[widget.iconType] ?? Icons.person,
          ),
          const SizedBox(width: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.textType,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                widget.text.toUpperCase(),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
