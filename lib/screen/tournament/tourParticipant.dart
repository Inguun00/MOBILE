import 'package:flutter/material.dart';

class TournamentParticipant extends StatelessWidget {
  const TournamentParticipant({super.key});

  final List<Map<String, String>> groupB = const [
    {'name': 'SILENT CREW', 'image': 'assets/images/profile.jpg'},
    {'name': 'EXODUS', 'image': 'assets/images/profile.jpg'},
    {'name': 'No Sympathy', 'image': 'assets/images/profile.jpg'},
    {'name': 'Running Turtles', 'image': 'assets/images/profile.jpg'},
    {'name': 'revolution', 'image': 'assets/images/profile.jpg'},
    {'name': 'Phantom', 'image': 'assets/images/profile.jpg'},
    {'name': 'REVOLUTION team', 'image': 'assets/profile.jpg'},
    {'name': 'SEE THE FUTURE', 'image': 'assets/images/profile.jpg'},
  ];

  final List<Map<String, String>> groupA = const [
    {'name': 'StormFire', 'image': 'assets/images/profile.jpg'},
    {'name': 'FAM', 'image': 'assets/images/profile.jpg'},
    {'name': 'SILENT CREW \n GIRLS', 'image': 'assets/images/profile.jpg'},
    {'name': 'hashashun', 'image': 'assets/images/profile.jpg'},
    {'name': 'StormFire', 'image': 'assets/images/profile.jpg'},
    {'name': 'StormFire', 'image': 'assets/images/profile.jpg'},
    {'name': 'StormFire', 'image': 'assets/images/profile.jpg'},
    {'name': 'StormFire', 'image': 'assets/images/profile.jpg'},
    {'name': 'StormFire', 'image': 'assets/images/profile.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Group B',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 7),
          buildTeamGrid(groupB),
          const SizedBox(height: 14),
          const Text(
            'Group A',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          buildTeamGrid(groupA),
        ],
      ),
    );
  }

  Widget buildTeamGrid(List<Map<String, String>> teams) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 0.8,
      children:
          teams.map((team) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(color: Colors.grey.shade300, blurRadius: 6),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(team['image']!, fit: BoxFit.contain),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(team['name']!, textAlign: TextAlign.center),
                  ),
                ],
              ),
            );
          }).toList(),
    );
  }
}
