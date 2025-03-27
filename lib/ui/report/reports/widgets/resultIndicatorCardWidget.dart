import 'package:digprev_flutter/ui/core/widgets/title_Tool_Tip.dart';
import 'package:flutter/material.dart';

class ResultIndicatorCardWidget extends StatelessWidget {
  final double maxValue;
  final double indicatorValue;
  final String title;
  final String tooltipText;
  final String textUnderBar;

  const ResultIndicatorCardWidget({
    required this.textUnderBar,
    required this.maxValue,
    required this.indicatorValue,
    required this.tooltipText,
    required this.title,
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    return  Card(
      child: Padding(
        padding: const EdgeInsets.symmetric( vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 10),
              child: TitleToolTip(title: title, tooltipText: tooltipText),
            ),
            Padding(
              padding:const EdgeInsets.symmetric(horizontal: 20.0),
              child: LinearProgressIndicator(
                borderRadius:  BorderRadius.circular(10),
                value: getPercentage(),
                minHeight: 20,
                backgroundColor: Theme.of(context).colorScheme.shadow.withValues(alpha: 0.6),
                valueColor:  AlwaysStoppedAnimation<Color>(Theme.of(context).colorScheme.primary),
             ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Text(textUnderBar),
            ),
          ],
        ),
      ),
    );
  }
  double getPercentage(){
    return (indicatorValue / maxValue *100)/100;
  }

}