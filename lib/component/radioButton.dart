import 'package:flutter/material.dart';

class QualifierSelector extends StatelessWidget {
  final List<String> qualifiers;
  final String selected;
  final ValueChanged<String> onChanged;

  const QualifierSelector({
    super.key,
    required this.qualifiers,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: qualifiers.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final qualifier = qualifiers[index];
          final isSelected = qualifier == selected;
          return ChoiceChip(
            label: Text(qualifier),
            selected: isSelected,
            onSelected: (_) => onChanged(qualifier),
            selectedColor: Colors.purple,
            labelStyle: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
            ),
          );
        },
      ),
    );
  }
}
