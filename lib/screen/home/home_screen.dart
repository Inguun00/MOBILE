import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Header ---
            Container(
              padding: const EdgeInsets.only(top: 48, bottom: 24),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.deepPurple, Colors.purple],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/logo_text.png',
                      height: 60,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage(
                            'assets/images/profile.jpg',
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          "Welcome back!",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          "Inguun",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 20),
                                    child: const Icon(
                                      Icons.notifications_none,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Tournament Card Section (Not started статус)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Tournament List",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildTournamentCard(
                    "PUBG MOBILE",
                    "Not started",
                    'assets/images/img_home.png',
                  ),
                  _buildTournamentCard(
                    "VALORANT",
                    "Ongoing",
                    'assets/images/images.jpg',
                  ),
                  _buildTournamentCard(
                    "CS2",
                    "Ended",
                    'assets/images/cs2.jpg',
                  ),
                ],
              ),
            ),

            // --- News Section ---
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "News",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildNewsImage("assets/images/img_home.png"),
                  _buildNewsImage("assets/images/images.jpg"),
                  _buildNewsImage("assets/images/cs2.jpg"),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // --- Recommended Section (HorizontalCard) ---
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Match List",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                HorizontalCard(
                  imagePath: 'assets/images/img_home.png',
                  title: 'New Tournament',
                  subtitle: 'Join the battle now!',
                ),
                HorizontalCard(
                  imagePath: 'assets/images/images.jpg',
                  title: 'Latest Updates',
                  subtitle: 'Stay informed!',
                ),
                HorizontalCard(
                  imagePath: 'assets/images/cs2.jpg',
                  title: 'Exclusive Events',
                  subtitle: 'Don’t miss out!',
                ),
              ],
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // --- Tournament Card Builder ---
  static Widget _buildTournamentCard(
    String title,
    String status,
    String imagePath,
  ) {
    Color statusColor;
    if (status == "Ended") {
      statusColor = Colors.grey;
    } else if (status == "Ongoing") {
      statusColor = Colors.green;
    } else {
      statusColor = Colors.orange;
    }

    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 16),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              height: 160,
              width: 160,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 0,
            left: 50,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: statusColor,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                status,
                style: const TextStyle(color: Colors.white, fontSize: 10),
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            left: 8,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- News Image Builder ---
  static Widget _buildNewsImage(String imagePath) {
    return Container(
      width: 240,
      margin: const EdgeInsets.only(right: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

// --- HorizontalCard Widget ---
class HorizontalCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;

  const HorizontalCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            size: 17,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
