import 'package:flutter/material.dart';

// Member data defined outside the widget
final List<Map<String, String>> members = [
  {
    'role': 'Team IGL',
    'name': 'Lorgil',
    'avatar':
        'https://www.csgowallpapers.com/assets/images/original/csgowallpaper_294741387603_1713993468_345086392473.png',
  },
  {
    'role': 'Team member',
    'name': 'Dok',
    'avatar':
        'https://i.pinimg.com/736x/6e/65/14/6e651464a0260c1566c33a9630798087.jpg',
  },
  {
    'role': 'Team member',
    'name': 'Uguudei',
    'avatar':
        'https://media.istockphoto.com/id/1453684837/vector/assassin-gaming-logo.jpg?s=612x612&w=0&k=20&c=wdHS3pQHVcJNFVNMGMatBFO3fGFZ74Z7_gymGBzA25M=',
  },
  {'role': 'Team member', 'name': 'Zaya', 'avatar': ''},
];

class TeamDetailScreen extends StatelessWidget {
  const TeamDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F2FA),
      body: Column(
        children: [
          // Top Section with background and team info
          SizedBox(
            height: 300,
            child: Stack(
              children: [
                // Gradient + Image
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF7B2CBF), Color(0xFF5A189A)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Image.asset(
                    'assets/images/login_backgound_image.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),

                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Row(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            const CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(
                                'assets/images/cs2.jpg',
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              padding: const EdgeInsets.all(4),
                              child: const Icon(Icons.camera_alt, size: 14),
                            ),
                          ],
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Inguuns Team',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'no rank',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Member list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: members.length,
              itemBuilder: (context, index) {
                final member = members[index];
                return TeamMemberCard(
                  role: member['role']!,
                  name: member['name']!,
                  avatarUrl: member['avatar']!,
                  onDelete: () {
                    // Delete logic
                  },
                );
              },
            ),
          ),
          // Add member button
          Padding(
            padding: const EdgeInsets.all(16),
            child: OutlinedButton.icon(
              onPressed: () {
                // Add member logic
              },
              icon: const Icon(Icons.add),
              label: const Text("Add member"),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 24,
                ),
                side: const BorderSide(color: Colors.purple),
                foregroundColor: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TeamMemberCard extends StatelessWidget {
  final String role;
  final String name;
  final String avatarUrl;
  final VoidCallback onDelete;

  const TeamMemberCard({
    super.key,
    required this.role,
    required this.name,
    required this.avatarUrl,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ), // Fixed padding error
        child: Row(
          children: [
            CircleAvatar(radius: 28, backgroundImage: NetworkImage(avatarUrl)),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    role,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "name: $name",
                    style: const TextStyle(color: Colors.black87),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.purple),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
