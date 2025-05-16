import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/tournament/tourInfo.dart';
import 'package:flutter_application_1/screen/tournament/tourParticipant.dart';
import 'package:flutter_application_1/screen/tournament/tourResult.dart';

void main() => runApp(const TabBarApp());

class TabBarApp extends StatelessWidget {
  const TabBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const TabBarExample(),
    );
  }
}

class TabBarExample extends StatelessWidget {
  const TabBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Container(
            child: Row(
              children: [
                Icon(Icons.arrow_back),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text('PUBG MOBILE NATIONAL MASTERS-2025'),
                ),
              ],
            ),
          ),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(text: 'Information'),
              Tab(text: 'Participant'),
              Tab(text: 'Results'),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            TournamentInfo(),
            TournamentParticipant(),
            TournamentResults(),
          ],
        ),
      ),
    );
  }
}
