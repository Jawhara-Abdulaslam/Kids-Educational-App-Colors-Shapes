// lib/widgets/settings_widgets/settings_switch.dart
import 'package:flutter/material.dart';

class SettingsSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color activeColor;

  const SettingsSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.activeColor = Colors.blue,
  });

  @override
  State<SettingsSwitch> createState() => _SettingsSwitchState();
}

class _SettingsSwitchState extends State<SettingsSwitch> {
  late bool _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: _currentValue,
      onChanged: (bool newValue) {
        setState(() {
          _currentValue = newValue;
        });
        widget.onChanged(newValue);
      },
      activeColor: widget.activeColor,
      activeTrackColor: widget.activeColor.withOpacity(0.5),
    );
  }
}