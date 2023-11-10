import 'package:flutter/material.dart';
import 'package:weather_app/core/constants/constants.dart';

class DarkChipWidget extends StatelessWidget {
  const DarkChipWidget(
      {super.key,
      required this.label,
      required this.activeTab,
      required this.i,
      this.onSelected});
  final String label;
  final int activeTab;
  final int i;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(
          label,
          style: TextStyle(
            color: (i == activeTab) ? Colors.white : AppConstants.gray50,
          ),
        ),
        onSelected: onSelected,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        backgroundColor: (i == activeTab)
            ? const Color(0xFF469D9A)
            : const Color(0xFF3F3F46),
      ),
    );
  }
}

class LightChipWidget extends StatelessWidget {
  const LightChipWidget(
      {super.key,
      required this.label,
      required this.activeTab,
      required this.i,
      this.onSelected});
  final String label;
  final int activeTab;
  final int i;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(
          label,
          style: TextStyle(
            color: (i == activeTab) ? Colors.white : Colors.black,
          ),
        ),
        onSelected: onSelected,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        backgroundColor:
            (i == activeTab) ? Colors.black : const Color(0xFFE5E5E5),
      ),
    );
  }
}
