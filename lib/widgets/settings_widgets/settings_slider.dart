// lib/widgets/settings_widgets/settings_slider.dart
import 'package:flutter/material.dart';

class SettingsSlider extends StatefulWidget {
  final double value;
  final ValueChanged<double> onChanged;
  final double min;
  final double max;
  final int divisions;
  final String label;

  const SettingsSlider({
    super.key,
    required this.value,
    required this.onChanged,
    this.min = 0,
    this.max = 100,
    this.divisions = 10,
    required this.label,
  });

  @override
  State<SettingsSlider> createState() => _SettingsSliderState();
}

class _SettingsSliderState extends State<SettingsSlider> {
  late double _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
          value: _currentValue,
          min: widget.min,
          max: widget.max,
          divisions: widget.divisions,
          label: '${_currentValue.toInt()}%',
          onChanged: (double newValue) {
            setState(() {
              _currentValue = newValue;
            });
            widget.onChanged(newValue);
          },
        ),
        const SizedBox(height: 8),
        Text(
          widget.label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}