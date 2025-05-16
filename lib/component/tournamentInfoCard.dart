// tournament_format_card.dart
import 'package:flutter/material.dart';

class TournamentFormatCard extends StatelessWidget {
  const TournamentFormatCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(height: 12),
            _LabelValueRow(label: "Game:", value: "TPP/SQUAD"),
            SizedBox(height: 8),
            _LabelValueRow(label: "Maps:", value: "Erangel / Miramar / Sanhok"),
            SizedBox(height: 8),
            _LabelValueRow(label: "PrizePool:", value: "10,000,000₮  /  2,800\$"),
          ],
        ),
      ),
    );
  }
}

class _LabelValueRow extends StatelessWidget {
  final String label;
  final String value;

  const _LabelValueRow({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
