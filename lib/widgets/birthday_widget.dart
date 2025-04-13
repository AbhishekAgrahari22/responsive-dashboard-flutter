import 'package:flutter/material.dart';

class BirthdayCard extends StatelessWidget {
  const BirthdayCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color(0xFF3D2C56), // Dark purple background
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('✨', style: TextStyle(fontSize: 18)),
                SizedBox(width: 6),
                Text(
                  'Today Birthday',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(width: 6),
                Text('✨', style: TextStyle(fontSize: 18)),
              ],
            ),
            const SizedBox(height: 16),

            // Avatars with cake emoji
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(
                        'assets/profile_icon.png',
                      ), // Use your image asset
                      radius: 24,
                      backgroundColor: Colors.white,
                    ),
                    Positioned(
                      top: -4,
                      child: Text('🎂', style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
                SizedBox(width: 12),
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(
                        'assets/profile_icon.png',
                      ), // Use your image asset
                      radius: 24,
                      backgroundColor: Colors.white,
                    ),
                    Positioned(
                      top: -4,
                      child: Text('🎂', style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Total count
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Total', style: TextStyle(color: Colors.white70)),
                SizedBox(width: 12),
                Text(
                  '2',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Birthday Wishing button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.send, color: Colors.white, size: 18),
                label: const Text(
                  'Birthday Wishing',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF9B5CF5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
