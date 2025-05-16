import 'package:flutter/material.dart';
import '../bottom_tabbar/bottom_tabbar_screen.dart';

class WalkthroughScreen extends StatefulWidget {
  const WalkthroughScreen({super.key});

  @override
  State<WalkthroughScreen> createState() => _WalkthroughScreenState();
}

class _WalkthroughScreenState extends State<WalkthroughScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool _isTapped = false;

  final List<Map<String, String>> walkthroughData = [
    {
      "image": "assets/images/logo_text.png",
      "title": "WE ARE ONE WORLD",
      "subtitle": "Create a team and participate in the tournament",
    },
    {
      "image": "assets/images/img_home.png",
      "title": "PLAY TO WIN",
      "subtitle": "Compete with others and rise to the top",
    },
    {
      "image": "assets/images/images.jpg",
      "title": "JOIN THE COMMUNITY",
      "subtitle": "Connect with players from all over the world",
    },
  ];

  void _nextPage() {
    if (_currentPage < walkthroughData.length - 1) {
      setState(() {
        _isTapped = !_isTapped;
      });
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const BottomNavigationBarExample()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
                _isTapped = false;
              });
            },
            itemCount: walkthroughData.length,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeInOut,
                    height: _isTapped ? size.height * 0.25 : size.height * 0.3,
                    child: Image.asset(
                      walkthroughData[index]["image"]!,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 40),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 600),
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        Text(
                          walkthroughData[index]["title"]!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          walkthroughData[index]["subtitle"]!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),

          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                walkthroughData.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _currentPage == index ? 16 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color:
                        _currentPage == index ? Colors.white : Colors.white54,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 40,
            right: 24,
            child: GestureDetector(
              onTap: _nextPage,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                width: _isTapped ? 56 : 64,
                height: _isTapped ? 56 : 64,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_forward,
                  color: Colors.deepPurple,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
