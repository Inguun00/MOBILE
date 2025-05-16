import 'package:flutter/material.dart';

class PointSystemCard extends StatelessWidget {
  const PointSystemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: const [
                      PointRow(place: '1', points: '10pts', gradient: true),
                      PointRow(place: '2', points: '6pts', gradient: true),
                      PointRow(place: '3', points: '5pts', gradient: true),
                      PointRow(place: '4', points: '4pts'),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    children: const [
                      PointRow(place: '5', points: '3pts'),
                      PointRow(place: '6', points: '2pts'),
                      PointRow(place: '7–8', points: '1pts'),
                      PointRow(place: '9–16', points: '0pts'),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              '1 Elimination = 1 Point',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}

class PointRow extends StatelessWidget {
  final String place;
  final String points;
  final bool gradient;

  const PointRow({
    super.key,
    required this.place,
    required this.points,
    this.gradient = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: gradient ? Colors.white : const Color.fromARGB(221, 48, 48, 48),
        borderRadius: BorderRadius.circular(4),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 2, offset: Offset(0, 1)),
        ],
      ),
      child: Stack(
        children: [
          ClipPath(
            clipper: DiagonalClipper(),
            child: Container(
              decoration: BoxDecoration(
                gradient:
                    gradient
                        ? const LinearGradient(
                          colors: [Color(0xFF7B2FF7), Color(0xFFA435F0)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        )
                        : null,
                color: gradient ? null : const Color.fromARGB(255, 26, 26, 26),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4),
                  bottomLeft: Radius.circular(4),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  place,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  points,
                  style: TextStyle(
                    color: gradient ? Colors.redAccent : Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DiagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width * 0.6, 0);
    path.lineTo(0, size.width * 0.6);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
