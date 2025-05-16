import 'package:flutter/material.dart';
import '../../component/radioButton.dart';

class TournamentResults extends StatefulWidget {
  const TournamentResults({super.key});

  @override
  State<TournamentResults> createState() => _TournamentResultsState();
}

class _TournamentResultsState extends State<TournamentResults> {
  final qualifiers = ['Open Qualifier', 'Closed Qualifier', 'Main Event'];
  String selectedQualifier = 'Open Qualifier';
  String selectedGroup = 'Group B';
  String selectedDay = 'March 28';

  // Function to show a bottom sheet for group selection
  void _showGroupSelector() async {
    final selected = await showModalBottomSheet<String>(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children:
                ['Group A', 'Group B', 'Group C'].map((group) {
                  return ListTile(
                    title: Text(group),
                    onTap: () {
                      Navigator.pop(
                        context,
                        group,
                      ); // Close bottom sheet and return the selected value
                    },
                  );
                }).toList(),
          ),
        );
      },
    );

    if (selected != null) {
      setState(() {
        selectedGroup = selected;
      });
    }
  }

  // Function to show a bottom sheet for day selection
  void _showDaySelector() async {
    final selected = await showModalBottomSheet<String>(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children:
                ['March 27', 'March 28', 'March 29'].map((day) {
                  return ListTile(
                    title: Text(day),
                    onTap: () {
                      Navigator.pop(
                        context,
                        day,
                      ); // Close bottom sheet and return the selected value
                    },
                  );
                }).toList(),
          ),
        );
      },
    );

    if (selected != null) {
      setState(() {
        selectedDay = selected;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ✅ Reusable component here
            QualifierSelector(
              qualifiers: qualifiers,
              selected: selectedQualifier,
              onChanged: (value) {
                setState(() {
                  selectedQualifier = value;
                });
              },
            ),

            const SizedBox(height: 24),

            GestureDetector(
              onTap: _showGroupSelector,
              child: InputDecorator(
                decoration: const InputDecoration(labelText: 'Select Group'),
                child: Text(selectedGroup),
              ),
            ),

            const SizedBox(height: 16),

            GestureDetector(
              onTap: _showDaySelector,
              child: InputDecorator(
                decoration: const InputDecoration(labelText: 'Select Day'),
                child: Text(selectedDay),
              ),
            ),

            const SizedBox(height: 24),

            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                  child: const Text('match-3'),
                ),
              ],
            ),

            const SizedBox(height: 24),

            Center(
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.purple),
                ),
                child: const Text(
                  'SEE GROUP OVERALL RANKINGS',
                  style: TextStyle(color: Colors.purple),
                ),
              ),
            ),

            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Match Ranking',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                  child: const Text('see MVP'),
                ),
              ],
            ),

            const SizedBox(height: 16),

            const Center(
              child: Text(
                'No match result',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
