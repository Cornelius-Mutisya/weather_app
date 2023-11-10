import 'package:flutter/material.dart';

class WeatherItem extends StatelessWidget {
  const WeatherItem({super.key, required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: colorScheme.primary,
          size: 40,
        ),
        const SizedBox(width: 20),
        Text(
          label,
          style: theme.textTheme.bodyLarge,
        ),
      ],
    );
  }
}
