import 'package:flutter/material.dart';

class SliderWidget extends StatefulWidget {
  final int min;
  final int max;
  final ValueChanged<String> onValueChanged;

  const SliderWidget({
    required this.onValueChanged,
    this.max = 8,
    this.min = 1,
  });

  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double _value = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: Theme.of(context).colorScheme.primary,
            inactiveTrackColor: Theme.of(context).colorScheme.outline,
            trackHeight: 4.0,
            activeTickMarkColor: Theme.of(context).colorScheme.surfaceTint,
            inactiveTickMarkColor: Theme.of(context).colorScheme.primary,
            tickMarkShape: const RoundSliderTickMarkShape(tickMarkRadius: 4),
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
            thumbColor: Theme.of(context).colorScheme.secondary,
          ),
          child: Slider(
            value: _value,
            min: widget.min.toDouble(),
            max: widget.max.toDouble(),
            divisions: widget.max - widget.min,
            // Divisões sem o zero
            onChanged: (double value) {
              setState(() {
                _value = value;
              });
              widget.onValueChanged(value.round().toString());
            },
          ),
        ),
        LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final double sliderWidth = constraints.maxWidth * .8;
            final double tickSpacing = sliderWidth / (widget.max - widget.min);
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List<Widget>.generate(widget.max - widget.min + 1, (
                int index,
              ) {
                return Container(
                  width: tickSpacing,
                  child: Text(
                    '${widget.min + index}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }),
            );
          },
        ),
      ],
    );
  }
}
