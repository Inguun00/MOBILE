import 'package:flutter/material.dart';
import '../../component/pointSystemCard.dart';
import '../../component/scheduleCard.dart';
import '../../component/tournamentInfoCard.dart';

class TournamentInfo extends StatelessWidget {
  const TournamentInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/cs2.jpg',
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Tournament Format',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const TournamentFormatCard(),
                const SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(200, 50),
                      backgroundColor: Colors.purple,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text('Team Register'),
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  "Point System:",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const PointSystemCard(),
                const SizedBox(height: 24),
                const Text(
                  "Schedule:",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const ScheduleCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
